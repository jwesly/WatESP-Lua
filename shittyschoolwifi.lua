conn=net.createConnection(net.TCP, 0);
conn:on("receive", function(conn, payload) 
                       success = true
                       print(payload)
                       http = string.match(string.match(payload,"HTTP/%S+%s+%S+"),"%d%d%d")
                       --string.match(string.match(payload,"HTTP/%g+ %d%d%d"),"%d%d%d
                       url = string.match(string.match(payload,"Location: http.*\n"),"http%S*")
                       if http == "307" dofile("schoolauth.lua") end
                       end)

conn:on("connection",function(conn,payload)
    print("connected")
    conn:send("GET /"
                        .." HTTP/1.1\r\n" 
                        .."Host: wat.jabez.org\r\n" 
                        .."Connection: Keep-Alive\r\n"
                        .."Accept: */*\r\n" 
                        .."User-Agent: Mozilla/4.0 "
                        .."(compatible; esp8266 Lua; "
                        .."Windows NT 5.1)\r\n" 
                        .."\r\n")
end);
conn:on("disconnection", function(conn, payload) print('\nDisconnected') end)

conn:connect(80,"jabez.org");
--print("test finished")
--52.89.59.238
--
