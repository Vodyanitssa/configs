#!/bin/bash
# wps.sh - 为 /bin/wps 插入 fcitx 输入法环境变量（如果尚未存在）
# 在文件第2行后插入：
# export QT_IM_MODULE=fcitx
# export XMODIFIERS=@im=fcitx

TARGET_FILE="/bin/wps"
LINE1='export QT_IM_MODULE=fcitx'
LINE2='export XMODIFIERS=@im=fcitx'

# 检查目标文件是否存在
if [[ ! -f "$TARGET_FILE" ]]; then
    echo "错误: $TARGET_FILE 不存在"
    exit 1
fi

# 检查是否已存在这两行（任意顺序，但要求都存在）
if grep -qF "$LINE1" "$TARGET_FILE" && grep -qF "$LINE2" "$TARGET_FILE"; then
    echo "环境变量已存在，无需插入。"
    exit 0
fi

# 需要 root 权限写入 /bin/wps
if [[ $EUID -ne 0 ]]; then
    echo "需要 root 权限写入 $TARGET_FILE，请使用 sudo 运行"
    exit 1
fi

# 在第2行后插入两行（即插入到第3行位置）
# 使用 sed 在第2行后插入
sed -i "2a\\$LINE1\\$LINE2" "$TARGET_FILE"

echo "已插入环境变量到 $TARGET_FILE 第2行后"