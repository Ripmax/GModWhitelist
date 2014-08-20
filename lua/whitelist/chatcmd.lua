local string = string
local hook = hook
local table = table
local config = Whitelist.Config
local __regex = "^.(%S+)"

local function Parse(mg, pl, tm)
	local text = mg
	local prefix = string.sub(text, 1, 1)
	local pref = (config["minecraftstyle"] or "/" and config["chatprefix"])
	
	if(prefix != pref) then return end
end