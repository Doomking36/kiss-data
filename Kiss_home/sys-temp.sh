#!/bin/bash



# Find the thermal zone directory for x86_pkg_temp type

thermal_zone_dir=$(grep -l x86_pkg_temp /sys/class/thermal/thermal_zone*/type)



# Extract the thermal zone number

thermal_zone_num=$(echo "$thermal_zone_dir" | sed 's/[^0-9]*//g')



# Read the temperature from the corresponding thermal zone

temperature=$(cat "/sys/class/thermal/thermal_zone$thermal_zone_num/temp")



# Convert the temperature to Celsius

temperature_celsius=$(echo "scale=2; $temperature/1000" | bc)



# Report the temperature

echo "CPU temperature is: $temperature_celsius°C"


