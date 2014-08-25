Whitelist = {}
Whitelist.Commands = {"add","remove","view","on","off"}
Whitelist.List = {}

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
	return table.HasValue(Whitelist.List, id) or false
end