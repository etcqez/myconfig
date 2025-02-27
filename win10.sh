diskutil eraseDisk MS-DOS "WIN10" GPT /dev/disk2
hdiutil mount ~/Downloads/cn_windows_10_enterprise_x64_dvd_6846957.iso
rsync -vha --exclude=sources/install.wim /Volumes/J_CENA_X64FREV_ZH-CN_DV5 /Volumes/WIN10
brew install wimlib
mkdir /Volumes/WIN10/sources
wimlib-imagex split /Volumes/J_CENA_X64FREV_ZH-CN_DV5/sources/install.wim /Volumes/WIN10/sources/install.swm 3800
