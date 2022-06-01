local internet = require("internet")
local filesystem = require("filesystem")
local serialization = require("serialization")
local component = require("component")

local serveraddr = ""
local serverport = 9988

local ocsshnet = {}

local function load_serial(filename)
  local filepath = "/etc/ocssh/"..filename
  if filesystem.exists() then
    local file = io.open(filepath, "r")
    local data = serialization.unserialize(file:read())
    file:close()
    return data
  else
    error("No such config file "..filepath..filename)
  end
end
-- auth.conf
-- {"username","authcode"}
-- config.conf
-- {"name","login_user", "PIN"}
-- crypt not support yet

function ocsshnet.connect()
  local socket = internet.open(serveraddr, serverport)
  local auth = load_serial("auth.conf")
  local conf = load_serial("config.conf")

  socket.write()
  return socket
end

function ocsshnet.


return ocsshnet