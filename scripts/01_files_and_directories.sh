#!/usr/bin/env bash

# 这一份开始练最基础的文件操作
# 先只练安全的：
# 建目录、建文件、写一点内容、复制、改名、查看
# 删除先不急，单独放后面学
# 先把“安全整理文件”这件事练熟

PRACTICE_DIR="$HOME/server_practice_files"

# mkdir = make directory
# 先建自己的练习目录
mkdir -p "$PRACTICE_DIR"

# cd = change directory
# 先进入自己的练习区
cd "$PRACTICE_DIR" || exit 1

echo "当前练习目录："
pwd

echo
echo "=== 先建几个子目录，模拟最简单的项目结构 ==="

# 这里先分三个：
# raw_data：原始文件
# results：结果文件
# notes：随手记的东西
mkdir -p raw_data results notes

# 建完先看一眼
ls -lah

echo
echo "=== 创建几个空文件 ==="

# touch
# 先记成“碰一下，文件就有了”
# 最常见用法就是创建空文件
touch raw_data/sample1.txt
touch raw_data/sample2.txt

ls -lah raw_data

echo
echo "=== 往文件里写一点内容 ==="

# echo
# 就是输出一行文字
#
# >
# 这个要记住：会覆盖写入
# 如果原来文件里有内容，会被新内容盖掉
# 所以真实项目里用 > 要小心
echo "sample_id: sample1" > raw_data/sample1.txt
echo "sample_id: sample2" > raw_data/sample2.txt

echo
echo "=== 看一下文件内容 ==="

# cat
# 先记成“把整个文件直接倒出来看”
# 名字虽然来自 concatenate，但现在先不用管这个
cat raw_data/sample1.txt

echo
echo "=== 复制一个文件 ==="

# cp
# copy
# 就是复制
cp raw_data/sample1.txt notes/sample1_copy.txt

ls -lah notes

echo
echo "=== 再把文件改个名字 ==="

# mv
# move
# 既能移动，也能改名
# 这里只演示改名
mv notes/sample1_copy.txt notes/sample1_renamed.txt

ls -lah notes

echo
echo "=== 看文件前几行 ==="

# head
# 就是“头”
# 看文件开头几行
head -n 5 raw_data/sample1.txt

echo
echo "=== 看文件后几行 ==="

# tail
# 就是“尾巴”
# 看文件最后几行
tail -n 5 raw_data/sample1.txt

echo
echo "=== 再把目录看一遍，确认文件都在自己以为的位置 ==="

ls -lah
echo
ls -lah raw_data
echo
ls -lah notes

echo
echo "=== 这一份先到这里 ==="
echo "先练创建、复制、改名、查看。"
echo "删除先不混在这一份里。"