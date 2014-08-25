if(CLIENT) then return end

Msg("// LOADING SERVER WHITELIST ADDON \\\n")

include("whitelist/core.lua")
include("whitelist/config.lua")
include("whitelist/chatcmd.lua")
include("whitelist/saveload.lua")
include("whitelist/joinauth.lua")

Msg("        // LOADED \\\n")