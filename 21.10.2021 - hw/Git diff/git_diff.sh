#!/bin/bash

# $1 - ссылка на удаленный репозиторий $2 -  имя ветки 1 $3 -  имя ветки 2

rm -rf .git_rep

git clone $1 .git_rep
cd .git_rep
git diff origin/$2 origin/$3 > ../diff.txt

cd ../
rm -rf .git_rep
