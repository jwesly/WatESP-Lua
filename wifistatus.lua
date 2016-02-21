print(ssid);
print(pwd);
--repeat
    status = wifi.sta.status();
--    tmr.delay(1000)
---until status ~= 1
print(wifi.sta.status());
print(wifi.sta.getip());
