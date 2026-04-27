#!/usr/bin/env bash

# 这一份不真正执行危险命令
# 高风险命令备忘录
#
# 先知道：
# 哪些命令风险高
# 为什么高
# 新手阶段别乱碰

echo "=== 高风险命令备忘录 ==="
echo

echo "1) rm"
echo "   rm = remove"
echo "   就是删除文件。"
echo "   文件一删，很多情况下难以恢复。"
echo "   删除要慎之又慎"
echo

echo "2) rm -r"
echo "   -r = recursive"
echo "   递归删除目录。"
echo "   一路往下删整个目录树。"
echo

echo "3) rm -rf"
echo "   r = recursive"
echo "   f = force"
echo "   递归删 + 强制删，风险极高。"
echo "   没完全想清楚前，别用。"
echo

echo "4) >"
echo "   因为它会覆盖写入。"
echo "   文件原来的内容就没了。"
echo

echo "5) mv"
echo "   mv = move"
echo "   能移动，也能改名。"
echo "   路径写错，文件就被移到别的地方去了。"
echo

echo "6) chmod"
echo "   chmod = change mode"
echo "   改权限。"
echo "   先理解权限再动，不要一上来就乱改。"
echo

echo "7) chmod -R 777"
echo "   -R = recursive"
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
echo "   能不用就别用。"
echo

echo "10) kill -9"
echo "    kill 本质上是发信号。"
echo "    -9 是很强硬的结束方式。"
echo "    不要把 kill -9 当默认首选。"
echo "    搞清楚杀的是谁、为什么要杀。"
echo

echo "11) scancel"
echo "    取消任务。"
echo "    先确认任务是不是自己的，再取消。"
echo

echo "12) 在公共目录里批量操作"
echo "    任何操作前都要看清楚位置"
echo "    在自己的练习目录里试，和在公共目录里试，后果完全不是一回事。"
echo

echo "=== 最重要的点 ==="
echo "谨记哪些命令危险、为什么危险。"
echo "共享服务器上，必须要有边界感。"
