#!/bin/dash

# ^c$var^ = fg color
# ^b$var^ = bg color

interval=0

# load colors
. ~/.config/chadwm/scripts/bar_themes/onedark

cpu() {
  cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)
  
  thermal_zone_dir=$(grep -l x86_pkg_temp /sys/class/thermal/thermal_zone*/type)
  thermal_zone_num=$(echo "$thermal_zone_dir" | sed 's/[^0-9]*//g')
  temp=$(cat "/sys/class/thermal/thermal_zone$thermal_zone_num/temp")
  temp_celsius=$(($temp/1000))

  printf "^c$black^ ^b$green^ CPU"
  printf "^c$white^ ^b$grey^ $cpu_val"
  printf "^c$white^ ^b$grey^ $temp_celsius""C"

}

mem() {
  printf "^c$blue^^b$black^  "
  printf "^c$blue^ $(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
}

pkg_updates() {
  updates=$( timeout 5 kiss U 2>/dev/null | grep -c '=>')

  if [ "$updates" -eq 0 ]; then
	  printf "   ^c$green^   @ Fully Updated"
  else
	  printf "   ^c$green^   @ $updates"" updates"
  fi
}

#wlan() {
#	case "$(cat /sys/class/net/wl*/operstate 2>/dev/null)" in
#	up) printf "^c$black^ ^b$blue^ 󰤨 ^d^%s" " ^c$blue^Connected" ;;
#	down) printf "^c$black^ ^b$blue^ 󰤭 ^d^%s" " ^c$blue^Disconnected" ;;
#	esac
#}

clock() {
	printf "^c$black^ ^b$darkblue^ 󱑆 "
	printf "^c$black^^b$blue^ $(date '+%H:%M:%S')  "
}

while true; do

  [ $interval = 0 ] || [ $(($interval % 3600)) = 0 ] && updates=$(pkg_updates)
  interval=$((interval + 1))

  sleep 1 && xsetroot -name "$updates $(cpu) $(mem) $(clock)"
done
