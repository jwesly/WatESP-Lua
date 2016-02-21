url = "https://n55.network-auth.com/splash/?mac="
.."00%3A18%3A0A%3A38%3AC8%3AB2&client_ip=10.100.53.103&"
.."client_mac=18:FE:34:01:62:72&vap=3&a=9a79be611e0267e1d943d"
.."a0737c6c51be67865a0&b=89393&auth_version=5&key=84b36d64e3dc9e"
.."4499313d77ebb87b0840b2575a&acl_ver=P1174278V2&"
.."continue_url=http%3A%2F%2Fwat.jabez.org%2F"

print("Authorizing", url)
con=net.createConnection(net.TCP, 0);
con:on("receive", function(conn, payload) 
                       success = true
                       print(payload)
                       --http = string.match(string.match(payload,"HTTP/%S+%s+%S+"),"%d%d%d")
                       --string.match(string.match(payload,"HTTP/%g+ %d%d%d"),"%d%d%d
                       --url = string.match(string.match(payload,"Location: http.*\n"),"http%S*")
                       --print(http,url)
                       end)

con:on("connection",function(con,payload)
    print("connected")
    con:send("GET /"
                        .." HTTP/1.1\r\n" 
                        .."Host: n55.network-auth.com\r\n" 
                        .."Connection: Keep-Alive\r\n"
                        .."Accept: */*\r\n" 
                        .."User-Agent: Mozilla/4.0 "
                        .."(compatible; esp8266 Lua; "
                        .."Windows NT 5.1)\r\n" 
                        .."\r\n")
end);
con:on("disconnection", function(con, payload) print('\nDisconnected') end)

con:connect(80,url);
print("test finished")
--52.89.59.238
--
