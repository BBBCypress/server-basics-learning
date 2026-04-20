#!/usr/bin/env bash

# 这一份先练“长任务”的最基础概念
#
# 真正的服务器上，很多任务不是几秒钟就跑完
# 所以不能老是只会“开个窗口直接跑”
#
# 这一份先不跑任何重任务
# 只用 sleep 这种很轻的命令做安全演示
#
# 先把这几个概念记住：
# 前台：命令占着当前窗口
# 后台：命令放到后面跑，当前窗口还能继续用
# jobs：看当前 shell 里的后台任务
# wait：等后台任务结束
#
# 真正服务器上更常见的是 tmux / screen / 调度系统
# 这一份先把最基础的后台概念摸清

PRACTICE_DIR="$HOME/server_practice_longtask"
mkdir -p "$PRACTICE_DIR"
cd "$PRACTICE_DIR" || exit 1

echo "当前练习目录："
pwd
echo

echo "=== 第一部分：先看前台任务的感觉 ==="

# sleep
# sleep = 睡一会儿
# 很适合用来演示任务，不会真的占很多资源
#
# 这一句会让当前终端等 2 秒
# 这就是最简单的“前台运行”的感觉：窗口会被这个命令占住
echo "--- 前台跑一个很轻的小任务 ---"
sleep 2
echo "前台任务结束。"
echo

echo "=== 第二部分：后台任务 ==="

# &
# 这个符号非常值得记
# 放在命令最后，表示把任务丢到后台跑
#
# 先可以直接记成：
# “这个命令不要占着我当前窗口”
echo "--- 把任务放到后台 ---"
sleep 5 &
echo "后台任务已经启动。"
echo

# $!
# 这个写法先记成：
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
# 这个以后在服务器上很值得重点学
# 先记成：开一个可重连的会话
#
# nohup
# no hang up
# 先记成：即使窗口断了，也尽量继续跑
#
# 这里不直接执行，只先记用法
echo "tmux 示例（这里只记，不实际执行）："
echo "tmux new -s practice_session"
echo

echo "nohup 示例（这里只记，不实际执行）："
echo "nohup bash run.sh > run.log 2>&1 &"
echo

echo "=== 第八部分：这一份先记这些点 ==="
echo "前台：命令占着当前窗口"
echo "后台：命令放后面跑，窗口还能继续用"
echo "&    = 放后台"
echo "jobs = 看后台任务"
echo "wait = 等后台任务结束"
echo

echo "真正在服务器上跑长任务时，别只会裸跑。"
echo "至少要知道 tmux / nohup / 调度系统 这些东西。"