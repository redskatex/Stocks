resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'
description 'Borsa by redskatex'
version '1.0.0'


client_scripts {
    'client/main_client.lua',
    'client/config.lua'
}

server_scripts {
    'server/main_server.lua',
    '@mysql-async/lib/MySQL.lua'
}
