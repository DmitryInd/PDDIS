#!/bin/bash

# $1 - ссылка на удаленный репозиторий $2 -  имя ветки 1 $3 -  имя ветки 2

mkdir .git_rep
cd /.git_rep

git clone $1
git diff $2 $3 > ../diff.txt

cd ../
rm -r .git_rep
