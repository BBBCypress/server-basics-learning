#!/usr/bin/env bash

# 这一份主要是把“查看”和“修改”分开练
# 这个概念在服务器上特别重要
#
# 很多时候不是不会命令，而是没分清：
# 现在这一步只是看看，还是已经真的改到文件了
#
# 先把思路记住：
# 查看类命令风险一般低一些
# 修改类命令就要先确认目录、对象、文件名

PRACTICE_DIR="$HOME/server_practice_view_modify"
mkdir -p "$PRACTICE_DIR"
cd "$PRACTICE_DIR" || exit 1

# 先准备一点练习内容
mkdir -p demo
echo "line 1" > demo/file1.txt
echo "line 2" >> demo/file1.txt
echo "line 3" > demo/file2.txt

echo "当前练习目录："
pwd
echo

echo "=== 第一部分：先练查看类命令 ==="

# pwd
# print working directory
# 直接记成：把当前位置打印出来
# 这是最值得养成的习惯之一
echo "--- pwd: 先看自己在哪 ---"
pwd
echo

# ls
# list
# 直接记成：列出来看看
echo "--- ls: 看当前目录里有什么 ---"
ls
echo

# ls -lah
# -l 长格式
# -a 显示隐藏文件
# -h 大小更好读
# 这个组合很常用
echo "--- ls -lah: 看详细信息 ---"
ls -lah demo
echo

# cat
# 先记成：把整个文件直接倒出来看
# 查看小文件很方便
echo "--- cat: 直接看整个文件 ---"
cat demo/file1.txt
echo

# head
# head = 头
# 看前几行
echo "--- head: 看前几行 ---"
head -n 2 demo/file1.txt
echo

# tail
# tail = 尾巴
# 看后几行
echo "--- tail: 看后几行 ---"
tail -n 2 demo/file1.txt
echo

# less
# 这个更适合看长文件
# 这里不直接进入交互模式，不然脚本会卡住
# 先记住用途就行
echo "--- less: 更适合翻长文件（这里只记，不在脚本里实际进入） ---"
echo "示例：less demo/file1.txt"
echo

# du
# disk usage
# 看目录/文件占了多大空间
echo "--- du -sh: 看目录大小 ---"
du -sh demo
echo

# df
# disk free
# 看磁盘剩余空间
echo "--- df -h: 看当前分区空间 ---"
df -h .
echo

echo "=== 第二部分：再练修改类命令 ==="

# mkdir
# make directory
# 创建目录
echo "--- mkdir: 创建目录 ---"
mkdir -p demo/results
ls -lah demo
echo

# touch
# 先记成：碰一下，文件就有了
# 常用来建空文件
echo "--- touch: 创建空文件 ---"
touch demo/results/empty.txt
ls -lah demo/results
echo

# cp
# copy
# 复制
echo "--- cp: 复制文件 ---"
cp demo/file1.txt demo/results/file1_copy.txt
ls -lah demo/results
echo

# mv
# move
# 移动 / 改名
echo "--- mv: 改文件名 ---"
mv demo/results/file1_copy.txt demo/results/file1_renamed.txt
ls -lah demo/results
echo

# echo + >
# > 这个很重要，要单独记
# 它不是“查看”，而是“覆盖写入”
# 如果文件原来有内容，会被新的内容盖掉
echo "--- echo + > : 覆盖写入 ---"
echo "this line overwrites old content" > demo/results/empty.txt
cat demo/results/empty.txt
echo

# echo + >>
# >> 是追加，不会把原内容清掉
echo "--- echo + >> : 追加写入 ---"
echo "append one more line" >> demo/results/empty.txt
cat demo/results/empty.txt
echo

echo "=== 第三部分：把两类命令放在脑子里分清楚 ==="

echo "查看类，先记这些："
echo "pwd / ls / cat / head / tail / less / du / df"
echo

echo "修改类，先记这些："
echo "mkdir / touch / cp / mv / echo > / echo >>"
echo

echo "这份最重要的不是命令多少，而是先分清："
echo "现在是在看，还是已经在改。"