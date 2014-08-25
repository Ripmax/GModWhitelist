local config = Whitelist.Config
local config_sql = config["mysql"]
local useSQL = config_sql["enable"]

require("mysqloo")

if(!mysqloo) then Error("MySQLOO Failed to load!") end

local ip = string.Explode(config_sql["host"],":")

local ip = ip[1]
local port = tonumber(ip[2])

local __db = mysqloo.connect(ip,config_sql["user"],config_sql["password"],config_sql["database"],port)