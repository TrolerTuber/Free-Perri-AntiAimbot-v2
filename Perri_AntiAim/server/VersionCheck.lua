
if Config.VersionCheck then
    local function ToNumber(cd) 
         return 
         tonumber(cd) 
     end
     
     MySQL.ready(function()
        Wait(5000)
         local resource_name = GetCurrentResourceName()
         local current_version = GetResourceMetadata(resource_name, 'version', 0)
         local symbols = '^'..math.random(1,9)
         for tonumber = 1, 26+#resource_name do
             symbols = symbols..'='
         end
         symbols = symbols..'^0'
         PerformHttpRequest('https://gist.githubusercontent.com/TrolerTuber/5581f7fa34e986c4176063776d9ae54c/raw/8baf2aeb4544aa51c69a8a5df38539e4872e93d7/Free%2520Anti%2520Aimbot',function(error, result, headers)
             if not result then print('^1Version check disabled because github is down.^0') return end
             local data = json.decode(result)
             if current_version ~= data.version then
     
                 print(symbols)
                 print('^2['..resource_name..'] - New Update Available.^0\nCurrent Version: ^5'..current_version..'^0.\n New Version: ^5'..data.version..'^0.\n Notes: ^5'..data.note..'^0.')
                 print(symbols)
             else
                 print(symbols)
                 print('^2['..resource_name..'] You have the latest version ',current_version)
                 print(symbols)
             end
         end,'GET')
    end)
end