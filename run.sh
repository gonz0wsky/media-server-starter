#!/bin/bash

TEMPLATE="template.yml"
FILE="docker-compose.yml"

RADARR_R="#RADARR#"
SONARR_R="#SONARR#"
BAZARR_R="#BAZARR#"
QBITTORRENT_R="#QBITTORRENT#"
JACKETT_R="#JACKETT#"
JELLYFIN_R="#JELLYFIN#"

if [ -f "$FILE" ]; then
    rm $FILE
fi

cp $TEMPLATE $FILE

echo ""
echo "Example: /mnt/hdd/radarr"
echo ""

read -p "Enter Radarr path: " RADARR_PATH
read -p "Enter Sonarr path: " SONARR_PATH
read -p "Enter Bazarr path: " BAZARR_PATH
read -p "Enter Jackett path: " JACKETT_PATH
read -p "Enter Jellyfin path: " JELLYFIN_PATH
read -p "Enter qBitorrent path: " QBITTORRENT_PATH


if [[ 
    $RADARR_PATH != "" && 
    $SONARR_PATH != "" && 
    $BAZARR_PATH != "" && 
    $JACKETT_PATH != "" && 
    $JELLYFIN_PATH != "" &&
    $QBITTORRENT_PATH != ""
    ]]
then

sed -i "s!$RADARR_R!$RADARR_PATH!g" $FILE
sed -i "s!$SONARR_R!$SONARR_PATH!g" $FILE
sed -i "s!$BAZARR_R!$BAZARR_PATH!g" $FILE
sed -i "s!$JACKETT_R!$JACKETT_PATH!g" $FILE
sed -i "s!$JELLYFIN_R!$JELLYFIN_PATH!g" $FILE
sed -i "s!$QBITTORRENT_R!$QBITTORRENT_PATH!g" $FILE

fi
