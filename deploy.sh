#! /bin/bash

mkdocs build

mv site HelpMe

cp -r HelpMe /var/www/html

rm -fr HelpMe

echo "down"