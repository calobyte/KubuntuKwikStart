last_state="discharging"
while :
do
    echo "START CHECK"
    echo "Last state: $last_state"

    batt_stat=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep state: | cut -d ':' -f 2 | xargs)
    echo "Current state: $batt_stat"

    if [[ "$batt_stat" == "discharging" && "$last_state" != "discharging" ]]; then
        echo "we are on battery"
        powerprofilesctl set power-saver
        sudo brightnessctl -d amdgpu_bl2 set 40%
        xrandr --output eDP --mode 1920x1080 --rate 60.00
    elif [[ "$batt_stat" == "charging" && "$last_state" != "charging" ]] || [[ "$batt_stat" == "fully-charged" && "$last_state" != "fully-charged" ]]; then
        echo "we are plugged in"
        powerprofilesctl set performance
        sudo brightnessctl -d amdgpu_bl2 set 90%
        xrandr --output eDP --mode 1920x1080 --rate 144.00
    fi
    last_state=$batt_stat

    sleep 15
done
