#!/bin/bash -xe
remove(){
  i=0
  count=0
  bar=""
  #flen为文件夹下所有文件数量，用于判断文件夹是否为空，以及计算百分比增量
  flen=$(ls -l "$1"| grep "^-" -c)
  #blen用于设置进度条总长度，以及控制进度条增量，通过"%-*s" “blen” "bar"动态设置输出字符宽度
  blen=25
  if [ "${flen}" -eq 0 ];
  then
    printf "目录 %s 是空的\n" "$1"
    return
  else
    printf "目录 %s 下有 %d 个文件,正在删除中\n" "$1" "$flen"
    add=$(echo "scale=6;100/$flen"|bc)
    badd=$(echo "$flen/$blen"|bc)
    ((badd++))
#    echo "$flen", "$badd", "$add"
    list=$(ls "$1")
    for file in $list
    do
      i=$(echo "$i+$add"|bc)
      ((count++))
      if [  $(echo "$count%$badd"|bc) -eq 0 ];
      then
        bar+='='
      fi
      printf "\e[32;1m[%-*s][%6.2f%% %4d/%d] %21s\r" "$blen" "$bar" "$i" "$count" "$flen" "$file"
      rm "$1""$file"
    done
    bar+='='
    i=100
    printf "\e[32;1m[%-*s][%6.2f%% %4d/%d] %21s\n" "$blen" "$bar" "$i" "$count" "$flen" "$file"
    printf "\e[0m"
  fi
}


path=detection/
remove $path
