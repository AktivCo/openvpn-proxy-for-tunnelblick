# Оболочка для работы с OpenVPN через Tunnelblick
## Описание
Данная оболочка позволяет использовать OpenVPN в приложении Tunnelblick, избегая запуск в режимe daemon. Это позволяет использовать PKCS#11 для аутентификации в сети OpenVPN т.к. текущие версии OpenVPN не поддерживают данную функцию в режиме daemon под macOS. Подробнее об этом можно почитать [здесь](https://ludovicrousseau.blogspot.com/2015/11/os-x-el-capitan-bug-pcsc-not-usable.html) и [здесь](https://community.openvpn.net/openvpn/ticket/961?__cf_chl_jschl_tk__=b79e3e0eb7b4f257b127b089c19c1349dc860724-1597754845-0-AapAnwK0Qe3fpEWh5bjTfhnT9QhWLtrQM5bAMY9_7-I-0SajAHsBdP30VhmZMdoAkHjlYIgVx0zQ-14ki9BL6j5PvIfQUCXmFFOiK_zecXi-phl59XMhUus2iHtMwBNV_nmlAZyUbeYNPlS0Fp-99cSPggBsFDUQBMsux09hLIO-NuT71qNrORPZ1ksvWBow3dfZG-Cg2JQQsDKCHIfdONaoy2Wrd2MWruBR_-I4Clvf00ADRkcWzrtmWPxqj9EuO4DNjoBjsetY6jhYRdJxRKrwp1Gl_ZoAYKtiUNRvNnXO).
## Использование

1. Вы можете скомпилировать свою версию оболочки с помощью команды:
	```bash
	cc main.c -o build/openvpn
	```
2. Далее можете запустить скрипт install.sh с помощью команды:
	```bash
	sudo ./install.sh
	```
	Данная команда автоматически установить оболочку над последней версией OpenVPN поддерживающей PKCS#11 в Tunnelblick.
3. Далее можете перезапустить Tunnelblick и указать в качестве версии используемого OpenVPN нашу оболочку.

Опционально скрипт установки принимает параметры:
- --openvpn  -- путь до необходимого OpenVPN над которым нужно создать оболочку;
- --tunnelblick -- путь до приложения Tunnelblick из которого можно автоматически извлечь нужную версию OpenVPN;
- --dst -- путь куда нужно установить нашу оболочку.
