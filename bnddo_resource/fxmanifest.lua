fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
lua54 'yes'

name 'Resource Boilerplate'
description 'Boilterplate with modules needed for RedM development'
author 'BNDOO Scripts'

shared_scripts {
    "shared/config.lua",
}



client_scripts {
    "client/client.lua",
}

server_scripts {
    "server/server.lua"
}

files {

}
escrow_ignore {
    "client/*",
    "server/*",
    "shared/*",
}
