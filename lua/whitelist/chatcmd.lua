local string = string
local hook = hook
local table = table
local config = Whitelist.Config
local __regex = "^.(%S+)"

local function Parse(mg, pl, tm)
	local text = mg
	local prefix = text:sub(1, 1)
	local pref = (config["minecraftstyle"] or "/" and config["chatprefix"])
	
	if(prefix == pref) then return end
	
	local comm
	text = text:gsub(__regex, function(m)
		comm = m
		return ""
	end, 1)
	
	if(!comm || !text || comm == text) then return "" end
end