main()
{
	#nohup python -m mkdocs serve -a 127.0.0.1:9999 &
	python -m mkdocs serve -a 127.0.0.1:9999
}

main $@
