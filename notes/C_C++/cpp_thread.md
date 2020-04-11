# cpp thread

启用c++11标准开启线程库。Linux下需要链接pthread库。

```shell
$ g++ -g -Wall -std=c++11 -pthread main.cpp
```

## 最简单的线程

```c++
#include <thread>
#include <iostream>
int main()
{
    std::thread t([]{ std::cout << "hello world\n"; });
    t.join();
}
```

```bash
$ g++ -g -Wall -std=c++11 -pthread main.cpp
$ ./a.out
hello world
```

## 给线程传递参数

```c++
#include <thread>
#include <iostream>
#include <string>

void work_func(int n, double *d, std::string &msg)
{
    std::cout << n << std::endl;
    *d = 3.14;
    msg = "work_func";
}

int main()
{
    double d = 0.0;
    std::string msg = "main";
    std::thread t(work_func, 42, &d, msg);
    t.join();

    std::cout << d << std::endl;    // 3.14
    std::cout << msg << std::endl;  // work_func
}
```

## data race and mutex

多个线程操作共享变量会造成data race，解决data race的方法是使用mutex。

mutex保护一段代码在同一时间只能由一个线程访问。通常使用lock_guard来管理mutex，它在初始化时lock mutex，在析构时unlock mutex。

```c++
#include <thread>
#include <mutex>
#include <iostream>

std::mutex mtx;

void work_func()
{
    for (int i = 0; i < 100; i++)
    {
        std::lock_guard<std::mutex> lck(mtx);
        std::cout << "work_func: " << i << std::endl; // std::cout 是全局对象，如果不加锁，会乱序输出内容
    }
}

int main()
{
    std::thread t(work_func);
    for (int i = 0; i < 100; i++)
    {
        std::lock_guard<std::mutex> lck(mtx);
        std::cout << "main: " << i << std::endl;
    }
    t.join();
}
```

## unique_lock and condition_variable

线程函数可能一直在后台运行，作为一个消费者，消费共享数据。

为了避免后台线程 buzy waiting，可以让它阻塞住等待数据到来。

condition_variable用于处理这个问题。condition_variable需要一个lock，来控制线程阻塞。这个lock不能是lock_guard，它没有能力灵活的加锁解锁。这时候要用到unique_lock，它也是使用RAII来控制锁释放的lock guard。

```c++
#include <thread>
#include <mutex>
#include <condition_variable>
#include <iostream>
#include <list>

std::list<int> ilist;
std::mutex mtx;
std::condition_variable cond;

void work_func()
{
    int data = 0;
    while (data != -1)
    {
        std::unique_lock<std::mutex> lck(mtx);

		// 1. 对lck解锁
		// 2. 阻塞
		// 3. 如果被notify，唤醒，加锁。如果条件不满足，重新解锁进入阻塞
        cond.wait(lck, [] { return !ilist.empty(); });

        data = ilist.front();
        ilist.pop_front();
        lck.unlock();

		std::cout << data << std::endl;
    }
}

int main()
{
    std::thread t(work_func);
    for (int i = 10; i >= -1; i--)
    {
        {
            std::unique_lock<std::mutex> lck(mtx);
            ilist.push_back(i);
        }
		std::this_thread::sleep_for(std::chrono::milliseconds(10)); // 等待是为了每次notify都能通知到
        cond.notify_one();
    }
    t.join();
}
```

## ansync and future

ansync 提供了更高层的抽象。它可以让工作在后台执行，并返回future得到运行结果或异常。

```c++
#include <thread>
#include <future>
#include <iostream>

int factorial(int n)
{
    std::this_thread::sleep_for(std::chrono::seconds(1));   // 模拟
    int res = 1;
    for (int i = n; i >= 1; i--)
    {
        res *= i;
    }
    return res;
}

int main()
{
    std::future<int> f1 = std::async(factorial, 4); // 如果可能，在后台运行
    std::future<int> f2 = std::async(factorial, 4);

    int res1 = f1.get();    // 等待结果，如果后台程序没运行，则同步运行
    int res2 = f2.get();

    std::cout << "res1: " << res1 << std::endl;
    std::cout << "res2: " << res2 << std::endl;
}
```

程序运行1秒得到结果。