local string = string
local hook = hook
local table = table
local config = Whitelist.Config
local meta = FindMetaTable("Player")

local function Parse(text)
	local text = text:lower()
	local prefix = string.sub(text, 1, 1)
	local pref = config["chatprefix"]
	if(prefix != pref) then return "" end
	local cmd = string.sub(text, 2)
	local cmd = string.Explode(cmd, " ")
	
	return cmd
end

hook.Add("PlayerSay",function(Player, text, t)
	if(!IsValid(Player)) then return false end
	
	if(Player:HasPermission()) then
		local parsed = Parse(text)
		local s = parsed[1]
		local arg = parsed[2]
		if(s == "whitelist") then
			if(!arg || arg == "" || arg == " ") then
				Player:PrintMessage(HUD_PRINTTALK, "Correct usage " .. config["chatprefix"] .. "whitelist <cmd>")
			elseif(!table.HasValue(arg,Whitelist.Commands)) then
				Player:PrintMessage(HUD_PRINTTALK, "Unknown command!")
				Player:PrintMessage(HUD_PRINTTALK, "Listing all commands to console")
				Player:PrintMessage(HUD_PRINTCONSOLE, "Available commands")
				for k, v in pairs(Whitelist.Commands) do
					Player:PrintMessage(HUD_PRINTCONSOLE, config["chatprefix"] .. "whitelist " .. v)
				end
			end
		end
	end
end)