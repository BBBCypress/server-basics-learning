#!/usr/bin/env bash

# 这一份开始练日志和重定向
#
# 这个很值得早点学
# 因为服务器上很多任务不是盯着屏幕跑完的
# 跑久了以后，最好把输出留到文件里，不然回头根本不知道发生了什么
#
# 先把这几个东西分清：
# >    覆盖写入
# >>   追加写入
# 2>   只把报错写到文件
# 2>&1 把报错并到正常输出里
#
# 这一份只做安全演示，不跑重任务

PRACTICE_DIR="$HOME/server_practice_logging"
mkdir -p "$PRACTICE_DIR"
cd "$PRACTICE_DIR" || exit 1

mkdir -p logs demo

echo "当前练习目录："
pwd
echo

echo "=== 先准备一个小文件 ==="
echo "apple" > demo/fruits.txt
echo "banana" >> demo/fruits.txt
echo "orange" >> demo/fruits.txt
cat demo/fruits.txt
echo

echo "=== 第一部分：> 和 >> 先分清 ==="

# >
# 这个最容易搞混
# 先记住：> 是覆盖写入
# 原来有内容的话，会被新内容顶掉
echo "--- 用 > 覆盖写入 ---"
echo "new line by >" > logs/out.txt
cat logs/out.txt
echo

# >>
# 这个是追加
# 不会把原来的内容清掉，而是接在后面
echo "--- 用 >> 追加写入 ---"
echo "append line 1" >> logs/out.txt
echo "append line 2" >> logs/out.txt
cat logs/out.txt
echo

echo "先这样记："
echo ">  是重新写，容易覆盖"
echo ">> 是接着写，比较像追加"
echo

echo "=== 第二部分：只把报错单独写出来 ==="

# 2>
# 这里的 2 指的是“标准错误输出”
# 先不用硬背 0 1 2 的系统定义
# 先记住最实用的：
# 2> 常用来单独存报错
#
# 这里故意 ls 一个不存在的文件，制造一个报错
echo "--- 用 2> 把报错写进文件 ---"
ls no_such_file 2> logs/error_only.log

echo "屏幕上不一定会看到报错，因为已经写到文件里了"
echo "看看 error_only.log："
cat logs/error_only.log
echo

echo "=== 第三部分：正常输出和报错分开看 ==="

# 先做一个同时包含正常输出和报错的小演示
# 前两条 echo 会正常输出
# ls no_such_file 会报错
#
# > 先接正常输出
# 2> 单独接报错
echo "--- 正常输出写到 run.out，报错写到 run.err ---"
(
  echo "step 1"
  echo "step 2"
  ls no_such_file
  echo "step 3"
) > logs/run.out 2> logs/run.err

echo "run.out 内容："
cat logs/run.out
echo

echo "run.err 内容："
cat logs/run.err
echo

echo "=== 第四部分：2>&1 这个写法单独记 ==="

# 2>&1
# 这串第一次看最别扭，但很常用
# 先别管太细的底层逻辑，先记用途：
# “把报错也并到正常输出里，一起写到同一个日志文件”
#
# 可以先粗暴记成：
# 2 跟着 1 走
echo "--- 把正常输出和报错都写到同一个日志里 ---"
(
  echo "start"
  ls demo
  ls no_such_file
  echo "end"
) > logs/all_in_one.log 2>&1

cat logs/all_in_one.log
echo

echo "=== 第五部分：tee 也很常用 ==="

# tee
# 这个名字不用深究，先记用途：
# “一边在屏幕上显示，一边写到文件里”
#
# 这个特别适合：
# 既想当场看结果，又想顺手留个日志
echo "--- grep + tee：边看边存 ---"
grep "apple" demo/fruits.txt | tee logs/grep.log
echo

echo "grep.log 内容："
cat logs/grep.log
echo

echo "=== 第六部分：这一份最值得记住的点 ==="
echo ">  覆盖写入"
echo ">> 追加写入"
echo "2> 只存报错"
echo "2>&1 把报错并到正常输出"
echo "tee 一边看一边存"
echo

echo "以后跑长一点的任务，先想清楚："
echo "输出留不留日志？"
echo "报错单独存还是合并存？"