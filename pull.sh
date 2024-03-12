#!/bin/bash
###########################################################################################################
# File Name:    update_git.sh
# Author:       NichloasChiu
# mail:         NichloasChiu@outlook.com
# Created Time: 2024年03月11日 星期一 09时50分06秒
##########################################################################################################
# 定义项目列表
repo_path="$HOME/WorkingDocument"

if [ ! -e $repo_path ]; then
	mkdir -p ~/WorkingDocument/
fi

projects=("$repo_path/NichloasChiu-Note" "$repo_path/Manjaro" "$repo_path/profile")
branches=("master" "main" "main")

# 循环更新每个项目
for i in "${!projects[@]}"; do
	cd "${projects[$i]}" || exit
	git pull origin "${branches[$i]}"
	echo "Project ${i+1} updated successfully."
done
