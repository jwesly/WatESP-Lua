conn=net.createConnection(net.TCP, 0);
conn:on("receive", function(conn, payload) 
                       success = true
                       print(payload) 
                       end)

conn:on("connection",function(conn,payload)
    print("connected")
    conn:send("GET /"
                        .." HTTP/1.1\r\n" 
                        .."Host: wat.jabez.org\r\n" 
                        .."Connection: close\r\n"
                        .."Accept: */*\r\n" 
                        .."User-Agent: Mozilla/4.0 "
                        .."(compatible; esp8266 Lua; "
                        .."Windows NT 5.1)\r\n" 
                        .."\r\n")
end);
conn:on("disconnection", function(conn, payload) print('\nDisconnected') end)

conn:connect(3000,"wat.jabez.org");
--print("test finished")
--52.89.59.238
--
