Whitelist.Config = {}
Whitelist.Config["mysql"] = {}

Whitelist.Config["usegroups"] = false // Set to true to use groups rather than permission checks. (NOT ALL ADMIN MODS WILL SUPPORT THIS!) (ULX Does)

Whitelist.Config["groups"] = {"admin","superadmin","owner"} // Change these to the groups you want to have access, must have usegroups set to true.

Whitelist.Config["superadmin"] = true // Set to false to allow normal administrators to whitelist players. Will be ignored if usegroups is set to true.

Whitelist.Config["disconnectmessage"] = "You're not whitelisted on this server!"

Whitelist.Config["chatprefix"] = "/" // Set chat command prefix.

Whitelist.Config["usejson"] = true // Set to false to use the alternative slow saving method, but if you feel the burning desire to not use JSON for any reason, set this to false.

// MYSQL FUNCTIONALITY \\

Whitelist.Config["mysql"]["enable"] = false

Whitelist.Config["mysql"]["host"] = "127.0.0.1:3306"

Whitelist.Config["mysql"]["user"] = "root"

Whitelist.Config["mysql"]["password"] = ""

Whitelist.Config["mysql"]["database"] = "whitelist"