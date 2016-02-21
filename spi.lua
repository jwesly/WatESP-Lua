pin=8 
spi.setup(1, spi.MASTER, spi.CPOL_LOW, spi.CPHA_LOW, spi.DATABITS_8, 0);
gpio.mode(pin, gpio.OUTPUT)

gpio.write(pin, gpio.HIGH)
tmr.delay(30)
gpio.write(pin, gpio.LOW)
tmr.delay(30)
gpio.write(pin, gpio.HIGH)
tmr.delay(45)
for i = 1,200 do
gpio.write(pin, gpio.LOW)
spi.send(1,0x30)
gpio.write(pin, gpio.HIGH)
tmr.delay(100)

gpio.write(pin, gpio.LOW)
spi.send(1,0x00)
spi.send(1,56)
gpio.write(pin, gpio.HIGH)
tmr.delay(100)

gpio.write(pin, gpio.LOW)
spi.send(1,0x80)
read = spi.recv(1, 1)

gpio.write(pin, gpio.HIGH)
tmr.delay(100)
tmr.wdclr();
end

print(string.byte(read))
