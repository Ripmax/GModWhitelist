local table = table
local hook = hook
local config = Whitelist.Config

local __check = function(sid64, ipa, svp, clp, n)
	if(svp != "") then
		if(clp != svp) then
			return false, "#GameUI_ServerRejectBadPassword"
		end
	end
	
	local sid = util.SteamIDFrom64(sid64)
	local authed = Whitelist:CheckPlayer(sid, sid64)
	
	if(authed) then
		return authed
	else
		return false, config["disconnectmessage"]
	end
end

hook.Add("CheckPassword",__check)