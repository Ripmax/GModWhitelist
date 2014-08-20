local string = string
local hook = hook
local table = table
local config = Whitelist.Config
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
	local prefix = string.sub(text, 1, 1)
	local pref = (config["minecraftstyle"] and "/" or config["chatprefix"])
	if(prefix != pref) then return "" end
	local cmd = string.sub(text, 2)
	
	return cmd
end

hook.Add("PlayerSay",function(Player, text, t)
	if(!IsValid(Player)) then return false end
	
	if(Player:HasPermission()) then
		local s = Parse(text)
	end
end)