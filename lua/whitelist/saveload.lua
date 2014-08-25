local config = Whitelist.Config
local config_sql = config["mysql"]
local useSQL = config_sql["enable"]
local connected = false

function Whitelist:ConnectToDB()
	Whitelist.DB = {}
	require("mysqloo")
	if(!mysqloo) then Error("MySQLOO Failed to load!") end

	local ip = string.Explode(config_sql["host"],":")

	local ip = ip[1]
	local port = tonumber(ip[2])

	Whitelist.DB.Connection = mysqloo.connect(ip,config_sql["user"],config_sql["password"],config_sql["database"],port)
	
	local dataB = Whitelist.DB.Connection
	
	function dataB:onConnected()
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