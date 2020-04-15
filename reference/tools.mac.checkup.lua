#!/usr/bin/env luajit

-- print header of program

function gethelp()
  local header = [[

--------------------
jimmy's system check
--------------------

check           get system information
applist         get common installed applications
runningapps     get current running applications
version         get current script version
help            get list of commands
]]

  return(header)
end

function getos()
  local rtnval = jit.os

  return(rtnval:lower())
end

function getdisk()
  local handle = io.popen("df -lPh")
  local rtnval = handle:read("*a")

  handle:close()

  -- rtnval = string.match(diskspace, "")
  return(rtnval:lower())
end

function getversion()
  return("1.0.0")
end

function getrunningapps()
  os.execute ("ps waux | grep sophos")
  return("--")
end


function getapplist()
  return("nginx ✓")
end

-- execute command in prompt
-- local handle = io.popen ("df -lh")
-- local result = handle:read ("*a")
-- print (result)
-- handle:close ()

-- test = os.execute ("df")

-- main script

if #arg == 0 then
  print(gethelp())
elseif arg[1] == "check" then
  print("operating system :    " .. getos())
  print("disk space : ...         ")
  print(getdisk())
elseif arg[1] == "runningapps" then
  print(getrunningapps())
elseif arg[1] == "applist" then
  print(getapplist())
elseif arg[1] == "version" then
  print(getversion())
elseif arg[1] == "help" then
  print(gethelp())
else
  print("invalid command ... ")
end

-- show current system details
-- show current system details verbose
-- inspect command <tool inspect> or <tool inspect xxx.xxx.xxx.xxx IP>
-- -- shows ip and open ports
-- -- login and show:
-- -- -- diskspace df
-- -- -- ip address
-- -- -- local gateway
-- -- -- running services
-- -- -- matched running services (common services)
-- expect command <expect install app> i.e. <expect install nginx>
-- -- -- scans if software is installed
-- -- -- if installed is it running
-- -- -- if installed show running version
-- -- -- if not installed. run installs
-- run command
