port = 80
host = "jabez.org"
url = "jabez.org"
callback = function(payload)
                       http = string.match(string.match(payload,"HTTP/%S+%s+%S+"),"%d%d%d")
                       --string.match(string.match(payload,"HTTP/%g+ %d%d%d"),"%d%d%d
                       url = string.match(string.match(payload,"Location: http.*\n"),"http%S*")
                       host = string.match(url,"n%S*%.com")
                       --print(http,url,host)
                       tmr.delay(10000)
                       
                       q = function() print("it worked") end
                       if http == "307" then  http_get(host,url,port,q) end
end
http_get(host,url,port,callback);
