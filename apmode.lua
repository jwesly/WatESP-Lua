function saveConfig(f,ssid,pwd)
    file.remove(f)
    file.open(f,"w+")
    w = file.writeline
    w("ssid='"..ssid.."';")
    w("pwd='"..pwd.."';")
    file.close()
    return 0
end
cfg={}
cfg.ssid="myAccessPoint"
cfg.pwd="password"
wifi.setmode(wifi.SOFTAP)
wifi.ap.config(cfg)
print(wifi.ap.getip())
sv = net.createServer(net.TCP,30)
sv:listen(80,function(conn)
    conn:on("receive",function(c,r)
        local _, _, method, path, vars = string.find(r, "([A-Z]+) (.+)?(.+) HTTP");
        if(method == nil)then
            _, _, method, path = string.find(r, "([A-Z]+) (.+) HTTP");
        end
        local _GET = {}
        if (vars ~= nil)then
            for k, v in string.gmatch(vars, "(%w+)=(%w+)&*") do
                _GET[k] = v
            end
        end
        local msgz = ""
        if (_GET.ssid == nil) then
            msgz = "<h1>Welcome to your ESP</h1><form action='/' method='get'><table><tr><td>SSID</td><td><input type='text' name='ssid'></td></tr><tr><td>Password</td><td><input type='text' name='pwd'></td>"
            msgz = msgz.."<tr><td /><td><input type='submit' value='Submit'></td></tr></form>";
        else
            c:send("Thanks for the Update")
            c:close()
            sv:close()
            saveConfig("config.lua",_GET.ssid,_GET.pwd)
            dofile('wificonfig.lua')
        end
        c:send(msgz)
        c:close();
        collectgarbage();
    end)
    
end)
