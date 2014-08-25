Whitelist = {}
Whitelist.Commands = {"add","remove","view","on","off"}
Whitelist.List = {}
Whitelist.List.SixtyFour = {}

function Whitelist:HasPermission(Player)
	local Player = self
	if(!Player || !IsValid(Player)) then return false end
	
	if(Whitelist.Config["usegroups"]) then
		return table.HasValue(Whitelist.Config["groups"],Player:GetUserGroup())
	else
		return (Whitelist.Config["superadmin"] and Player:IsSuperAdmin() or Player:IsAdmin())
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