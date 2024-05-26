#参考https://blog.csdn.net/qq_36949278/article/details/123851250

display_processbar() {
  #百分比分子
  numerator=$1
  #百分比分母
  denominator=$2
  #信息
  info=$3
  #进度条长度
  processbar_len=$4

  #百分比
  percent=$(echo "scale=4;$numerator/$denominator" | bc)

  #进度条符号变量
  processbar_param=""
  loop_count=$(echo "scale=0; ($percent * $processbar_len)/1" | bc)
  for ((j=0; j<$loop_count; j++)); do
    processbar_param+="="
  done
  
  # 实现更新效果,printf函数前面添加\r换到行首,末尾不要加\n换行就行
  printf "\r\e[1;35m[%-*s][%6.2f%% %4d/%d] %21s" "$processbar_len" "$processbar_param" "$percent" "$numerator" "$denominator" "$info"
  
  
  # per=$[${numerator}*${denominator}/${denominator}]
  # printf "\r\e[${processbar_len};0H${info}\e[42m%${per}s\e[47m%${loop_count}s\e[00m" "" ""
}




total_count=100
echo "开始"
log="处理信息"
for((i=1;i<=$total_count;i++)); do
  the_log=$(echo "打印信息${i}")
  #调用方式,调用该函数需传4个参数 display_processbar $处理量 $总量 $打印信息 $进度条长度
  display_processbar $i $total_count $the_log 20
  sleep 0.01
done

#打印完之后需手动恢复颜色,并换下行
printf "\e[0m"
echo -e '\n结束'