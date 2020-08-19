# Shell for working with an OpenVPN in Tunnelblick
## Description
This shell allows to use an OpenVPN in a Tunnelblick app without daemon mode. This feature allows you to use PKCS#11 for auth in an OpenVPN network, because  current versions of OpenVPN have troubles interacting with PCSC-layer in daemon mode on latest macOS versions. You can read about it [here](https://ludovicrousseau.blogspot.com/2015/11/os-x-el-capitan-bug-pcsc-not-usable.html) and [here](https://community.openvpn.net/openvpn/ticket/961?__cf_chl_jschl_tk__=b79e3e0eb7b4f257b127b089c19c1349dc860724-1597754845-0-AapAnwK0Qe3fpEWh5bjTfhnT9QhWLtrQM5bAMY9_7-I-0SajAHsBdP30VhmZMdoAkHjlYIgVx0zQ-14ki9BL6j5PvIfQUCXmFFOiK_zecXi-phl59XMhUus2iHtMwBNV_nmlAZyUbeYNPlS0Fp-99cSPggBsFDUQBMsux09hLIO-NuT71qNrORPZ1ksvWBow3dfZG-Cg2JQQsDKCHIfdONaoy2Wrd2MWruBR_-I4Clvf00ADRkcWzrtmWPxqj9EuO4DNjoBjsetY6jhYRdJxRKrwp1Gl_ZoAYKtiUNRvNnXO).

## Usage
1. Compile your own version of shell using this cmd:
	```bash
	cc main.c -o build/openvpn
	```
	This step is optional, because the latest version of build is located in build directory.
2. Run install.sh script using this cmd:
	```bash
        cc main.c -o build/openvpn
	```
	This cmd automatically installs the shell for OpenVPN inside Tunnelblick.
3. Restart Tunnelblick and choose new outside version of OpenVPN:

Optionally installment script has following arguments:
- --openvpn  -- path for needed OpenVPN, for which you want to create shell;
- --tunnelblick -- path to Tunnelblick app, from which you want to automatically extract needed OpenVPN;
- --dst -- path to where you want to install the shell.

# Оболочка для работы с OpenVPN через Tunnelblick
## Описание
Данная оболочка позволяет использовать OpenVPN в приложении Tunnelblick, избегая запуск в режимe daemon. Это позволяет использовать PKCS#11 для аутентификации в сети OpenVPN, т.к. в текущих версиях OpenVPN есть проблемы во взаимодействии с PCSC-слоем в режиме daemon в последних версиях macOS. Подробнее об этом можно почитать [здесь](https://ludovicrousseau.blogspot.com/2015/11/os-x-el-capitan-bug-pcsc-not-usable.html) и [здесь](https://community.openvpn.net/openvpn/ticket/961?__cf_chl_jschl_tk__=b79e3e0eb7b4f257b127b089c19c1349dc860724-1597754845-0-AapAnwK0Qe3fpEWh5bjTfhnT9QhWLtrQM5bAMY9_7-I-0SajAHsBdP30VhmZMdoAkHjlYIgVx0zQ-14ki9BL6j5PvIfQUCXmFFOiK_zecXi-phl59XMhUus2iHtMwBNV_nmlAZyUbeYNPlS0Fp-99cSPggBsFDUQBMsux09hLIO-NuT71qNrORPZ1ksvWBow3dfZG-Cg2JQQsDKCHIfdONaoy2Wrd2MWruBR_-I4Clvf00ADRkcWzrtmWPxqj9EuO4DNjoBjsetY6jhYRdJxRKrwp1Gl_ZoAYKtiUNRvNnXO).

## Использование
1. Скомпилируйте свою версию оболочки с помощью команды:
	```bash
	cc main.c -o build/openvpn
	```
	Данный шаг опционален, так как последняя версия сборки лежит в папке build.
2. Запустить скрипт install.sh с помощью команды:
	```bash
	sudo ./install.sh
	```
	Данная команда автоматически установливает оболочку для OpenVPN в Tunnelblick.
3. Перезапустить Tunnelblick и указать в качестве версии используемого OpenVPN нашу оболочку.

Опционально скрипт установки принимает параметры:
- --openvpn  -- путь до необходимого OpenVPN, для которого нужно создать оболочку;
- --tunnelblick -- путь до приложения Tunnelblick, из которого можно автоматически извлечь нужную версию OpenVPN;
- --dst -- путь, куда нужно установить нашу оболочку.
