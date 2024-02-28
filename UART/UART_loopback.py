import serial
import time
ser = serial.Serial('COM6', baudrate=115200)

nn = int('0b01101110', base=2)

for i in range(97, 123):
    letter = chr(i).encode()
    ser.write(letter)
    d = ser.read()
    print(f'letter sent: {letter}\t letter read: {d}')
    time.sleep(.5)