for((i=1;i<=100;i++)); do

    #百分比
  percent=$(echo "scale=4;$i/100" | bc)

#   #进度条符号变量
#   processbar_param=""
#   loop_count=$(echo "scale=0; ($percent * 40)/1" | bc)
#   for ((j=0; j<$loop_count; j++)); do
#     processbar_param+=">"
#   done

    # printf '\r%d %s\n' $i "abc"
    # printf "\r\e[32;1m[%-*s][%6.2f%% %4d/%d] %21s" "25" "$processbar_param" "20" "$i" "100" "1.txt"
    # 实现更新效果,printf函数前面添加\r换到行首,末尾不要加\n换行就行
    printf '\r%d %s' $i "abc"

    sleep 0.1
done
