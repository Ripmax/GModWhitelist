local string = string
local hook = hook
local table = table
local config = Whitelist.Config

local function Parse(mg, pl, tm)
	local text = mg
	local prefix = text:sub(1, 1)
	local pref = (config["minecraftstyle"] or "/" and config["chatprefix"])
	
	if(prefix == pref) then return end
end