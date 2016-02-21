pin = 3
gpio.mode(pin,gpio.OUTPUT)
th = 1
tl = 1
for i=1,1000 do
    gpio.write(pin,gpio.LOW)
    tmr.delay(th)
    gpio.write(pin,gpio.HIGH)
    tmr.delay(tl)
    tmr.wdclr()--clear watchdog to avoid resets
end
print("finished")

