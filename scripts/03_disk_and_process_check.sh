#!/usr/bin/env bash

# 这一份开始练“资源和进程检查”
#
# 共享服务器上，最怕的不是只不会命令，
# 而是完全没有资源意识：
# 不看磁盘、不看进程、不知道任务是不是还在跑
#
# 这一份先练几个最常见的查看命令：
# 1. 看当前目录占多大
# 2. 看磁盘还有多少空间
# 3. 看内存（如果系统支持）
# 4. 看当前用户的进程
# 5. 看系统整体资源状态
#
# 先强调一下：
# 这里只做“看”的练习，不做危险操作

PRACTICE_DIR="$HOME/server_practice_resources"
mkdir -p "$PRACTICE_DIR"
cd "$PRACTICE_DIR" || exit 1

# 先随便准备一点文件，方便看大小
mkdir -p tmp_data
echo "aaa" > tmp_data/a.txt
echo "bbb" > tmp_data/b.txt
echo "ccc" > tmp_data/c.txt

echo "当前练习目录："
pwd
echo

echo "=== 第一部分：看目录和磁盘空间 ==="

# du
# disk usage
# 看某个目录或文件占了多大
# -s = summary，只看总量
# -h = human-readable，更好读
echo "--- du -sh: 看当前目录总大小 ---"
du -sh .
echo

echo "--- du -sh tmp_data: 看子目录大小 ---"
du -sh tmp_data
echo

# df
# disk free
# 看磁盘剩余空间
# -h 让大小更容易看
echo "--- df -h: 看当前分区剩余空间 ---"
df -h .
echo

echo "这里先记住区别："
echo "du 更像看'这个目录用了多少'"
echo "df 更像看'这块磁盘还剩多少'"
echo

echo "=== 第二部分：看内存情况 ==="

# free
# 一看到 free，先联想到“空闲/可用”
# free -h 用来看内存
#
# 不是所有环境都有这个命令
# 所以这里先判断一下再跑，避免报错
if command -v free >/dev/null 2>&1; then
  echo "--- free -h: 看内存情况 ---"
  free -h
else
  echo "当前环境没有 free 命令，先跳过。"
fi
echo

echo "=== 第三部分：看进程 ==="

# ps
# process status
# 看进程状态
#
# 先只看当前用户自己的进程
# 不要一开始就盯全系统
echo "--- ps -u \$USER: 看当前用户的进程 ---"
ps -u "$USER"
echo

# head
# 这里顺手和 ps 连起来用
# 不然输出太长的时候不方便看
echo "--- ps -u \$USER | head: 只先看前几行 ---"
ps -u "$USER" | head
echo

echo "ps 先这样记："
echo "p = process"
echo "s = status"
echo "就是看进程状态"
echo

echo "=== 第四部分：看系统整体资源状态 ==="

# top
# 这个命令很常见
# 看到 top 可以先理解成：谁最占资源，谁在前面
#
# top 通常是交互式的
# 为了不让脚本卡在里面，这里用 batch 模式抓一屏
if command -v top >/dev/null 2>&1; then
  echo "--- top -b -n 1 | head: 看一眼系统资源概况 ---"
  top -b -n 1 | head -n 15
else
  echo "当前环境没有 top 命令，先跳过。"
fi
echo

echo "=== 第五部分：补一个很基础的后台任务演示 ==="

# sleep
# sleep 就是“睡一会儿”
# 很适合拿来演示后台任务，不会占很多资源
#
# &
# 这个符号要认识
# 放在命令后面，表示让任务去后台跑
echo "--- 启一个很轻的小后台任务 ---"
sleep 3 &
echo "后台任务已经启动。"

# $!
# 这个表示“刚刚那个后台任务的 PID”
BG_PID=$!
echo "刚才后台任务的 PID 是: $BG_PID"
echo

echo "--- 再看一眼当前用户进程 ---"
ps -u "$USER" | head
echo

# wait
# wait = 等待
# 这里等刚才那个 sleep 跑完
wait "$BG_PID"

echo "后台任务已经结束。"
echo

echo "=== 这一份先记住这些点 ==="
echo "du 看用了多少"
echo "df 看还剩多少"
echo "free 看内存"
echo "ps 看进程"
echo "top 看整体资源状态"
echo "共享服务器上，先学会看资源，再谈跑任务。"