fx_version "cerulean"
game "gta5"
version '1.02'
author "PerrItuber"


client_script 'client/main.lua'


server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'config.lua',
    'server/VersionCheck.lua',

}
