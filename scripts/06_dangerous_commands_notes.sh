#!/usr/bin/env bash

# 这一份不是真的拿来执行危险命令
# 这一份更像“高风险命令备忘”
#
# 目的不是学会乱用这些命令
# 而是先知道：
# 哪些命令风险高
# 为什么高
# 新手阶段先别乱碰
#
# 这里不做真实危险操作
# 只打印说明，提醒自己先建立边界感

echo "=== 高风险命令备忘 ==="
echo

echo "1) rm"
echo "   rm = remove"
echo "   就是删除文件。"
echo "   文件一删，很多情况下不好恢复。"
echo "   新手最容易出事的地方之一。"
echo

echo "2) rm -r"
echo "   -r = recursive"
echo "   递归删除目录。"
echo "   不是删一个文件，而是可能一路往下删整个目录树。"
echo

echo "3) rm -rf"
echo "   r = recursive"
echo "   f = force"
echo "   这个组合风险特别高。"
echo "   递归删 + 强制删，基本就是最容易出大事故的那类命令。"
echo "   没完全想清楚前，别随手用。"
echo

echo "4) >"
echo "   这个不是删除命令，但也危险。"
echo "   因为它会覆盖写入。"
echo "   文件原来的内容可能直接没了。"
echo

echo "5) mv"
echo "   mv = move"
echo "   能移动，也能改名。"
echo "   不是最危险，但也别掉以轻心。"
echo "   路径写错，文件就被移到别的地方去了。"
echo

echo "6) chmod"
echo "   chmod = change mode"
echo "   改权限。"
echo "   先理解权限再动，不要一上来就乱改。"
echo

echo "7) chmod -R 777"
echo "   -R = recursive"
echo "   777 常被新手乱用。"
echo "   看起来像'一把梭开放权限'，实际很不稳，也不规范。"
echo "   在共享服务器上尤其不推荐乱来。"
echo

echo "8) chown"
echo "   chown = change owner"
echo "   改文件拥有者。"
echo "   这个不是日常基础操作。"
echo "   不理解时先别碰。"
echo

echo "9) sudo"
echo "   sudo = superuser do"
echo "   以管理员权限执行命令。"
echo "   在共享服务器上，不该把 sudo 当成普通命令。"
echo "   能不用就别乱用。"
echo

echo "10) kill -9"
echo "    kill 本质上是发信号。"
echo "    -9 是很强硬的结束方式。"
echo "    不要把 kill -9 当默认首选。"
echo "    先搞清楚杀的是谁、为什么要杀。"
echo

echo "11) scancel"
echo "    如果服务器有 Slurm，这个是取消任务。"
echo "    先确认任务是不是自己的，再取消。"
echo

echo "12) 在公共目录里批量操作"
echo "    真正危险的有时不是命令本身，而是位置错了。"
echo "    在自己的练习目录里试，和在公共目录里试，后果完全不是一回事。"
echo

echo "=== 这一份最重要的点 ==="
echo "先别追求会不会用危险命令。"
echo "先知道哪些命令危险、为什么危险。"
echo "共享服务器上，最值钱的是边界感，不是胆子大。"