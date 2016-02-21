connections = 0;
conn = {}
create_conn = function(url,port)
    conn[connections] = net.createConnection(net.TCP,0)
    conn[connections]:on("disconnection", function(conn, payload) print('\nDisconnected') end)
end


http_get = function(host,url,port,callback)

    print(host,url,port)
    create_conn(host,port)

    sk = conn[connections];
    sk:on("receive", function(sk, payload) 
                       success = true
                       print(payload)
                       callback(payload)
                       end)

    sk:on("connection",function(sk,payload)
        print("connected")
        sk:send("GET /"
                        .." HTTP/1.1\r\n" 
                        .."Host: "..host.."\r\n" 
                        .."Connection: close\r\n"
                        .."Accept: */*\r\n" 
                        .."User-Agent: Mozilla/4.0 "
                        .."(compatible; esp8266 Lua; "
                        .."Windows NT 5.1)\r\n" 
                        .."\r\n")
    end);

    

    sk:connect(port,url);
--print("test finished")
--52.89.59.238
--
end
