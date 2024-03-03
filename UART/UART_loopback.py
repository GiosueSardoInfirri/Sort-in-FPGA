import serial
import time
ser = serial.Serial('COM6', baudrate=115200, timeout=1)
# ser = serial.Serial(port='COM6', baudrate=115200, timeout=1, stopbits=2, write_timeout =0, inter_byte_timeout =None)

nn = int('0b01101110', base=2)

for i in range(97, 123):
    letter = chr(i).encode()
    ser.write(letter)
    # if i <=100:
    #     ser.flush()
    #     ser.flushInput()
    #     ser.flushOutput()
    if ser.in_waiting > 0:
        data = ser.readline()
        print(data)    
    
    if i > 100:
            
        d = ser.read()
        print(f'letter sent: {letter}\t letter read: {d}')
    time.sleep(.5)