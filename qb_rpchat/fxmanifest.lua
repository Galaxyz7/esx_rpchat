fx_version 'cerulean'

game 'gta5'

description 'Adds Command for RP, such as: /me, /do, /OOC and more'
lua54 'yes'

version '1.0'
legacyversion '1.9.1'

shared_scripts {
    '@ox_lib/init.lua', -- OX_Lib, only line this in if you have ox_lib and are using them.
    'locales/en.lua', -- English Locales
}
server_scripts {
	'locales/*.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'locales/*.lua',
	'config.lua',
	'client/main.lua'
}
