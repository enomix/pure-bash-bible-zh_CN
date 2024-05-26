#!/bin/bash
# 进度条函数
bar() {
# 用法: bar 1 10
#           ^----- 已经完成的百分比 (0-100).
#             ^--- 字符总长度.
((elapsed=$1*$2/100))

# 创建空格表示的进度条
printf -v prog  "%${elapsed}s"

printf -v total "%$(($2-elapsed))s"


# 添加百分比计算并格式化输出
percent=$(printf "%3d%%" $1)  # 格式化百分比，保证总是3位数，包括百分号
printf '\r%s %s' "$percent" "[${prog// /▉}${total}]"


# 显示日志信息，这里假设直接打印在进度条下方
    # echo -e "\r$3"  # 使用-e允许转义序列，如\n，这里使用'\r'回到行首，实际上根据需求可能不需要
# printf '%s\r' "[${prog// /-}${total}]"

}

# 进度条使用示例
for ((i=0;i<=100;i++)); do
    # 纯粹的暂停动作 (为了本例可以更好的演示).
    (:;:) && (:;:) && (:;:) && (:;:) && (:;:)
    sleep 0.01
    # Print the bar.
    # echo "日志信息$1"
    bar "$i" "100" 
done

printf '\n'
# echo '已完成'