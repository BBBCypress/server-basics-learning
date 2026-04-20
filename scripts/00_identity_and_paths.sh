#!/usr/bin/env bash

# 先确认自己是谁、在哪台机器、现在站在哪个目录
# 使用共享服务器，必须看清目录再动文件

echo "=== 先确认当前账号 ==="

# whoami
# who am I
# 就是“我是谁”
# 登录服务器后先跑一下，确认当前用的是哪个账号
whoami

echo
echo "=== 再确认当前机器 ==="

# hostname
# host = 主机
# name = 名字
# 就是看这台机器叫什么
# 本地和服务器来回切的时候，就阔以用得到
hostname

echo
echo "=== 看当前目录 ==="

# pwd
# print working directory
# 把当前所在位置打印出来
# 很重要，很多误删都是因为没先看 pwd
pwd

echo
echo "=== 看当前目录里有什么 ==="

# ls
# list
# 就是“列出来看看”
ls

echo
echo "=== 用详细一点的方式看目录 ==="

# ls -lah
# -l: long，长格式，能看到权限/大小/时间
# -a: all，连隐藏文件也显示
# -h: human-readable，大小更好读，比如 KB / MB
# 这个组合在服务器上非常常用
ls -lah

echo
echo "=== 建一个练习目录，不要直接在正式目录里乱试 ==="

# mkdir
# make directory
# mk = make
# dir = directory
# 就是“创建目录”
PRACTICE_DIR="server_practice_identity"
mkdir -p "$PRACTICE_DIR"

# -p 的意思先这样记：
# 目录已经有也没关系；上层没建好也顺手建
echo "练习目录已创建: $PRACTICE_DIR"

echo
echo "=== 进入练习目录 ==="

# cd
# change directory
# 就是切换目录
cd "$PRACTICE_DIR" || exit 1

# 进来以后第一件事还是看 pwd
pwd

echo
echo "=== 返回上一级目录 ==="

# cd ..
# .. 表示上一层
# 这个特别常用
cd ..
pwd

echo
echo "=== 回到家目录 ==="

# cd ~
# ~ 先记成 home，也就是“回家”
# 在服务器上路径走乱了，回到 ~ 很常用
cd ~ || exit 1
pwd

echo
echo "=== 这一份先到这里 ==="
echo "先养成顺序：whoami -> hostname -> pwd -> ls"
echo "先看清楚，再做别的。"
