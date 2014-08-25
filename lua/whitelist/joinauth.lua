local table = table
local hook = hook
local wl = Whitelist
local config = wl.Config

function Whitelist:CheckPlayer(id, id64)
	if(table.HasValue(wl.List, id)) then
		return true
	else
		if(table.HasValue(wl.List.SixtyFour, id64)) then // Probably useless.
			return true
		else
			return false
		end
	end
end

local __check = function(sid64, ipa, svp, clp, n)
	if(svp != "") then
		if(clp != svp) then
			return false, "#GameUI_ServerRejectBadPassword" // Lets not remove password functionality, shall we?
		end
	end
	
	local sid = util.SteamIDFrom64(sid64)
	local authed = wl:CheckPlayer(sid, sid64)
	
	if(authed) then
		return authed
	else
		return false, config["disconnectmessage"]
	end
end

hook.Add("CheckPassword",__check)
	
	
	
	