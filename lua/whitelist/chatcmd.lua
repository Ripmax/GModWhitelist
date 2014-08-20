local string = string
local hook = hook
local table = table
local wl = Whitelist
local config = wl.Config
local meta = FindMetaTable("Player")

local function meta:HasPermission()
	local Player = self
	if(!Player || !IsValid(Player)) then return false end
	
	if(config["usegroups"]) then
		return table.HasValue(config["groups"],Player:GetUserGroup())
	else
		return (config["superadmin"] and Player:IsSuperAdmin() or Player:IsAdmin())
	end
end

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
			elseif(!table.HasValue(arg,wl.Commands)) then
				Player:PrintMessage(HUD_PRINTTALK, "Unknown command!")
				Player:PrintMessage(HUD_PRINTTALK, "Listing all commands to console")
				Player:PrintMessage(HUD_PRINTCONSOLE, "Available commands")
				for k, v in pairs(wl.Commands) do
					Player:PrintMessage(HUD_PRINTCONSOLE, config["chatprefix"] .. "whitelist " .. v)
				end
			end
		end
	end
end)