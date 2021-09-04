#!/bin/bash

# used for deleting latex extra files
echo "删除额外LaTeX文件"
file_regex=".*(\.aux|\.bbl|\.blg|\.fls|\.fdb_latexmk|\.log|\.nav|\.out|\.run\.xml|\.snm|\.toc|\.vrb|\.xdv|-blx\.bib|\.bcf)"
file_not_regex=".*program.*"
# |synctex\.gz


# # used for deleting python-jupyter extra files
# echo "删除额外Jupyter(Python)文件"
# file_regex=".*/\.ipynb_checkpoints(|.*)"
# file_not_regex=";"


find "./" -regextype egrep -regex $file_regex ! -regex $file_not_regex
read -r -p "即将删除上述文件。请确认(Y/N): " state
case $state in
Y|y)
	find "./" -regextype egrep -regex $file_regex ! -regex $file_not_regex -delete
	echo "Finished deleting."
	;;
*)
	echo "Quit without deleting."
	;;
esac
exit 0
