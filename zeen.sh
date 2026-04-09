#!/bin/sh

exec >/dev/null 2>&1

command -v curl >/dev/null 2>&1 || pkg install curl -y
command -v wget >/dev/null 2>&1 || pkg install wget -y

URL1="https://raw.githubusercontent.com/19086492/Wall-Bypass/main/optionalavatarres_commonab"
URL2="https://raw.githubusercontent.com/19086492/Wall-Bypass/main/P"

ultimo_zen=$(adb shell settings get global zen_mode 2>/dev/null | tr -d '\r')
zen_injetado=0
projecao_injetado=0

while true; do
    atual_zen=$(adb shell settings get global zen_mode 2>/dev/null | tr -d '\r')
    projecao_ativa=$(adb shell dumpsys media_projection 2>/dev/null | grep -E "TYPE_SCREEN_CAPTURE|com.discord")

    if [ "$atual_zen" != "$ultimo_zen" ]; then  
        zen_injetado=0  
        projecao_injetado=0  
        ultimo_zen=$atual_zen  
    fi  

    if [ "$atual_zen" = "1" ]; then

        if [ -n "$projecao_ativa" ] && [ "$projecao_injetado" -eq 1 ]; then
            sleep 1
            continue
        fi

        if [ "$zen_injetado" -eq 0 ] && [ -z "$projecao_ativa" ]; then  
            curl -L "$URL1" | adb shell "dd of=/sdcard/Android/data/com.dts.freefireth/files/contentcache/Optional/android/optionalavatarres/optionalavatarres_commonab_shader.~2Fchadw1hj5T0KRekMBo9sJ7qUW4~3D bs=1 seek=0 conv=notrunc"
            adb shell input keyevent 25  
            zen_injetado=1  
        fi  

        if [ -n "$projecao_ativa" ] && [ "$projecao_injetado" -eq 0 ]; then  
            curl -L "$URL2" | adb shell "dd of=/sdcard/Android/data/com.dts.freefireth/files/contentcache/Optional/android/optionalavatarres/optionalavatarres_commonab_shader.~2Fchadw1hj5T0KRekMBo9sJ7qUW4~3D bs=1 seek=0 conv=notrunc"
            adb shell input keyevent 24  
            projecao_injetado=1  
        fi  

    fi

    sleep 1
done