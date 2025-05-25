# pwpolicy -clearaccountpolicies
# 隐藏应用的 Dock 图标（以 "AppName" 为例）
defaults write com.apple.dock "static-apps" -array-add "<dict><key>tile-data</key><dict><key>_CFURLString</key><string>/Applications/keyCastr.app</string></dict></dict>"
# mac自动隐藏和显示程序坞必须鼠标停顿一会才会出现
defaults write com.apple.dock autohide-delay -float 0
# 快速删除程序坞的所有程序
defaults write com.apple.dock persistent-apps -array
# 开启聚焦
# sudo launchctl bootstrap system /system/library/launchdaemons/com.apple.metadata.mds.plist
# 关闭聚焦
sudo launchctl bootout system /System/Library/LaunchDaemons/com.apple.metadata.mds.plist
sudo mdutil -a -i off
# 禁用拖动应用到角落切换空间
defaults write com.apple.dock workspaces-edge-delay -float 1000; killall Dock
# 减少菜单栏边距
defaults -currentHost write -globalDomain NSStatusItemSpacing -int 0
# 禁用backgroundtaskmanagermentd
sudo launchctl unload /System/Library/LaunchDaemons/com.apple.backgroundtaskmanagementd.plist
# 给予eqmac麦克风权限
sudo sqlite3 ~/Library/Application\ Support/com.apple.TCC/TCC.db "INSERT INTO "main"."access" ("service", "client", "client_type", "auth_value", "auth_reason", "auth_version", "csreq", "policy_id", "indirect_object_identifier_type", "indirect_object_identifier", "indirect_object_code_identity", "flags", "last_modified", "pid", "pid_version", "boot_uuid", "last_reminded") VALUES ('kTCCServiceMicrophone', 'com.bitgapp.eqmac', 0, 0, 4, 1, NULL, NULL, 0, 'UNUSED', NULL, 0, 1622199671, NULL, NULL, 'UNUSED', 0);"
