local config = Whitelist.Config
local config_sql = config["mysql"]
local useSQL = config_sql["enable"]
local savetype = config["savetype"]:lower()
local connected = false

function Whitelist:ConnectToDB()
	Whitelist.DB = {}
	if(!useSQL) then
		Whitelist.DB.Connection = false
		return false
	end
	require("mysqloo")
	if(!mysqloo) then Error("MySQLOO Failed to load!") end

	local ip = string.Explode(config_sql["host"],":")

	local ip = ip[1]
	local port = tonumber(ip[2])

	Whitelist.DB.Connection = mysqloo.connect(ip,config_sql["user"],config_sql["password"],config_sql["database"],port)
	
	local dataB = Whitelist.DB.Connection
	
	function dataB:onConnected()
		connected = true
		Msg("Successfully connected to database " .. config_sql["host"] .. "\n")
		
		local qy = self:query("SELECT * FROM whitelist")
		function qy:onSuccess(ret)
			Msg("Successfully polled database.\n")
			PrintTable(ret) // debugging
		end
		
		function qy:onError(error, sql)
			// debugging
			Msg("Error in query\nQuery: " .. sql .. "\nError: " .. error)
		end
		
		qy:start()
	end
	return connected
end

function Whitelist:Save()
	if(useSQL) then
		// SQL SAVING CODE HERE
	else
		local savestring
		local st = config["savetype"]:lower()
		
		if(st == "sqlite") then 
			if(!sql.TableExists("whitelist")) then
				Msg("[SQLITE] Table 'whitelist' does not exist, creating!\n") // debugging
				local qy = [[CREATE TABLE IF NOT EXISTS `whitelist` (
					`steamid` varchar(18) NOT NULL,
					PRIMARY KEY (`steamid`),
					) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Whitelist Table';]]
					
				sql.Query(qy)
				timer.Simple(1.25, function()
					sql.Query("BEGIN")
					for k, v in pairs(Whitelist.List) do
						sql.Query("INSERT INTO whitelist (`steamid`) VALUES ('" .. v .. "')")
					end
					timer.Simple(0.2, function() sql.Query("COMMIT") end)
				end)
			else
				sql.Query("TRUNCATE TABLE whitelist")
				timer.Simple(1.25, function()
					sql.Query("BEGIN")
					for k, v in pairs(Whitelist.List) do
						sql.Query("INSERT INTO whitelist (`steamid`) VALUES ('" .. v .. "')")
					end
					timer.Simple(0.2, function() sql.Query("COMMIT") end)
				end)
			end
		elseif(st == "von") then savestring = von.serialise(Whitelist.List)
		elseif(st == "json") then savestring = util.TableToJSON(Whitelist.List)
		elseif(st == "string") then for k, v in pairs(Whitelist.List) do savestring = savestring .. "\n" .. v end
			
	end
end

function Whitelist:Load()
	if(useSQL) then
		// SQL LOADING CODE HERE
	else
		local loadstring
		local lt = config["savetype"]:lower()
		
		if(lt == "sqlite") then
			if(!sql.TableExists("whitelist")) then
				Msg("[SQLITE] Table 'whitelist' does not exist, creating!\n") // debugging
				local qy = [[CREATE TABLE IF NOT EXISTS `whitelist` (
					`steamid` varchar(18) NOT NULL,
					PRIMARY KEY (`steamid`),
					) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Whitelist Table';]]
						
				sql.Query(qy)
			else
			