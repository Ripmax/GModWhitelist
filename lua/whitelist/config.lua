Whitelist.Config = {}

Whitelist.Config["usegroups"] = false // Set to true to use groups rather than permission checks. (NOT ALL ADMIN MODS WILL SUPPORT THIS!) (ULX Does)

Whitelist.Config["groups"] = {"admin","superadmin","owner"} // Change these to the groups you want to have access, must have usegroups set to true.

Whitelist.Config["superadmin"] = true // Set to false to allow normal administrators to whitelist players. Will be ignored if usegroups is set to true.

Whitelist.Config["disconnectmessage"] = "You're not whitelisted on this server!"

Whitelist.Config["chatprefix"] = "/" // Set chat command prefix.

Whitelist.Config["minecraftstyle"] = false // Use minecraft style whitelisting commands (WILL OVERRIDE CHAT COMMAND PREFIX WITH /)

