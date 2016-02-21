dofile("config.lua")
print(ssid,pwd)
if(ssid == nil or pwd == nil) then
    dofile("apmode.lua")
else
    wifi.setmode(wifi.STATION);
    wifi.sta.config(ssid,pwd);
    wifi.sta.connect();
    tmr.alarm (1, 800, 1, function ( )
    if wifi.sta.status() == 1 then
         print ("Waiting....")
    else
        tmr.stop (1)
        local status = wifi.sta.status();
        print(status);
        --print(wifi.sta.getip());
        if(status~=5) then
            dofile("apmode.lua")
        else
            --dofile("wifitest.lua")
        end
      end
    end)
end
