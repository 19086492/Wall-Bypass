#!/bin/sh

exec >/dev/null 2>&1

command -v curl >/dev/null 2>&1 || pkg install curl -y
command -v wget >/dev/null 2>&1 || pkg install wget -y

URL1="https://raw.githubusercontent.com/19086492/Wall-Bypass/main/optionalavatarres_commonab"
URL2="https://raw.githubusercontent.com/19086492/Wall-Bypass/main/P"

ARQ1="$HOME/optionalavatarres_commonab_shader.~2Fchadw1hj5T0KRekMBo9sJ7qUW4~3D"
ARQ2="$HOME/P"

ultimo_zen=$(adb shell settings get global zen_mode 2>/dev/null | tr -d '\r')
ultima_projecao=""
zen_injetado=0
projecao_injetado=0

while true; do
atual_zen=$(adb shell settings get global zen_mode 2>/dev/null | tr -d '\r')
projecao_ativa=$(adb shell dumpsys media_projection 2>/dev/null | grep "mProjection")

if [ "$atual_zen" != "$ultimo_zen" ]; then  
    zen_injetado=0  
    ultimo_zen=$atual_zen  
fi  

if [ -z "$projecao_ativa" ]; then
    projecao_injetado=0
fi

if [ "$atual_zen" = "1" ] && [ "$zen_injetado" -eq 0 ]; then  
    curl -L "$URL1" | adb shell "dd of=/sdcard/Android/data/com.dts.freefireth/files/contentcache/Optional/android/optionalavatarres/optionalavatarres_commonab_shader.~2Fchadw1hj5T0KRekMBo9sJ7qUW4~3D bs=1 seek=0 conv=notrunc" >/dev/null 2>&1  
    adb shell input keyevent 25 >/dev/null 2>&1  
    zen_injetado=1  
fi  

if [ "$atual_zen" = "0" ]; then  
    adb shell input keyevent 24 >/dev/null 2>&1  
fi  

if [ -n "$projecao_ativa" ] && [ "$projecao_injetado" -eq 0 ]; then  
    curl -L "$URL2" | adb shell "dd of=/sdcard/Android/data/com.dts.freefireth/files/contentcache/Optional/android/optionalavatarres/optionalavatarres_commonab_shader.~2Fchadw1hj5T0KRekMBo9sJ7qUW4~3D bs=1 seek=0 conv=notrunc" >/dev/null 2>&1  
    projecao_injetado=1  
fi  

ultima_projecao="$projecao_ativa"  

sleep 1
donea"  

sleep 1

done1

done