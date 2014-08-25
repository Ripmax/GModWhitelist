local config = Whitelist.Config
local config_sql = config["mysql"]
local useSQL = config_sql["enable"]

require("mysqloo")

if(!mysqloo) then Error("MySQLOO Failed to load!") end

local __db = mysqloo.connect(config_sql["host"]