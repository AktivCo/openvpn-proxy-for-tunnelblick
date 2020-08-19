#!/bin/bash
while [[ $# -gt 0 ]]    #       Parse arguments
do
        key="$1"
        case $key in
                -o |--openvpn)
                        openvpnPath="$2"
                        shift 2
                ;;
		-t | --tunnelblick)
			tunnelblickPath="$2"
			shift 2
		;;
		-d | -dst)
			dst="$2"
			shift 2
		;;
                *)
                        shift
                ;;
        esac
done

if [ -z "$dst" ]
then
	dst="/Library/Application Support/Tunnelblick"
fi

if [ -z "$tunnelblickPath" ]
then
	tunnelblickPath="/Applications/Tunnelblick.app"
fi

if ! [ -d "$tunnelblickPath" ]
then
	echo "No Tunnelblick found at $tunnelblickPath"
	exit 1
fi

if [ -z "$openvpnPath" ]
then
	openvpnPathes="`ls $tunnelblickPath/Contents/Resources/openvpn/*/openvpn | sort -V -r`"
	
	found=0
	IFS=$'\n'
	for openvpnPath in $openvpnPathes
	do
		if [[ "`$openvpnPath  --version | grep PKCS11`" ]]
		then
			found=1
			break;
		fi
	done
	if [ $found -ne 1 ]
	then
		echo "No PKCS#11 support openvpn found at $tunnelblick"
		exit 1
	fi
fi

if ! [ -f "$openvpnPath" ]
then
	echo "No openvpn found at $openvpnPath"
	exit 1
fi

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

mkdir Openvpn
ver="`$openvpnPath --version | grep "^OpenVPN" | cut -d " " -f2`"
ssl="`$openvpnPath --version | grep "^library versions:" | cut -d " " -f3 | awk '{print tolower($0)}'`"
sslVer="`$openvpnPath --version | grep "^library versions:" | cut -d " " -f4`"


dirName="openvpn-${ver}-${ssl}-${sslVer}"
mkdir "Openvpn/$dirName"

ln -s "$openvpnPath" Openvpn/$dirName/openvpn_origin
cp build/openvpn Openvpn/$dirName
ln -s "`dirname ${openvpnPath}`/openvpn-down-root.so" Openvpn/$dirName/openvpn-down-root.so 

chown -R root:wheel Openvpn
chmod -R 0755 Openvpn
chmod 0744 Openvpn/$dirName/openvpn-down-root.so
rsync -av Openvpn "$dst"

