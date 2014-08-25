Whitelist = {}
Whitelist.Commands = {"add","remove","view","on","off"}

function Whitelist:HasPermission(Player)
	local Player = self
	if(!Player || !IsValid(Player)) then return false end
	
	if(config["usegroups"]) then
		return table.HasValue(config["groups"],Player:GetUserGroup())
	else
		return (config["superadmin"] and Player:IsSuperAdmin() or Player:IsAdmin())
	end
end

function Whitelist:CheckPlayer(id, id64)
	if(table.HasValue(Whitelist.List, id)) then
		return true
	else
		if(table.HasValue(Whitelist.List.SixtyFour, id64)) then // Probably useless.
			return true
		else
			return false
		end
	end
end