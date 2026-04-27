#!/usr/bin/env bash

# 这一份练“长任务”的基础概念
#
# 服务器上，很多任务要跑很久
# 不能老是“开个窗口直接跑”
#
# 先用 sleep 做演示
#
# 概念记住：
# 前台：命令占着当前窗口
# 后台：命令放到后面跑，当前窗口还能继续用
# jobs：看当前 shell 里的后台任务
# wait：等后台任务结束
#
# 服务器上常见 tmux / screen / 调度系统
# 这一份先摸清基础概念

PRACTICE_DIR="$HOME/server_practice_longtask"
mkdir -p "$PRACTICE_DIR"
cd "$PRACTICE_DIR" || exit 1

echo "当前练习目录："
pwd
echo

echo "=== 第一部分：先看前台任务 ==="

# sleep
# sleep = 睡一会儿
#
# 这一句会让当前终端等 2 秒
# 前台运行，命令会占住窗口
echo "--- 前台跑一个小任务 ---"
sleep 2
echo "前台任务结束。"
echo

echo "=== 第二部分：后台任务 ==="

# &
# 放在命令最后，表示把任务丢到后台跑
#
# 可以记成：
# “这个命令不要占着我当前窗口”
echo "--- 把任务放到后台 ---"
sleep 5 &
echo "后台任务已经启动。"
echo

# $!
# 这个写法记成：
# “刚刚那个后台任务的 PID”
BG_PID=$!
echo "刚才后台任务的 PID 是: $BG_PID"
echo

echo "=== 第三部分：看一下当前 shell 里的后台任务 ==="

# jobs
# 看到 jobs 就先理解成“当前这个终端里挂着的任务”
echo "--- jobs: 看后台任务 ---"
jobs
echo

echo "=== 第四部分：后台任务在跑时，当前窗口还能继续用 ==="

# 这就是后台任务和前台任务最大的区别之一
echo "后台任务还在跑，但当前窗口还能继续敲命令。"
echo "比如现在还可以 ls 一下："
ls
echo

echo "=== 第五部分：等后台任务结束 ==="

# wait
# wait = 等待
# 这里专门等刚才那个后台任务结束
wait "$BG_PID"
echo "后台任务已经结束。"
echo

echo "=== 第六部分：再看一眼 jobs ==="
jobs
echo

echo "=== 第七部分：把 tmux / nohup 先记在脑子里 ==="

# tmux
# 开一个可重连的会话
#
# nohup
# no hang up
# 即使窗口断了，也尽量继续跑
#
# 这里不直接执行，只记用法
echo "tmux 示例："
echo "tmux new -s practice_session"
echo

echo "nohup 示例："
echo "nohup bash run.sh > run.log 2>&1 &"
echo

echo "=== 第八部分：这一份先记这些 ==="
echo "前台：命令占着当前窗口"
echo "后台：命令放后面跑，窗口还能继续用"
echo "&    = 放后台"
echo "jobs = 看后台任务"
echo "wait = 等后台任务结束"
echo

echo "真正在服务器上跑长任务时，不会只会裸跑。"
echo "至少要知道 tmux / nohup / 调度系统 这些东西。"
