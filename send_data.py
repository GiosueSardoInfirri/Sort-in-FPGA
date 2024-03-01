import numpy as np
import serial
from input_data import generate_sequence
import time
import struct

x_delay = 5
len_output = 15
max_number = 100
print_out = False

sequence = generate_sequence(x_delay=x_delay, len_output=len_output, 
                             max_number=max_number, print_out=print_out)

print(f'Sending the sequence \n{sequence}\n...')

ser = serial.Serial(port='COM6', baudrate=115200, timeout=3)


for i, number in enumerate(sequence):
    ser.write(struct.pack('B', number))
    read_out = ser.read(1)
    if read_out:
        print(f'Read out: {struct.unpack("B", read_out)[0]}')
    else:
        print(f'No data: i = {i}, num = {read_out}')
    # time.sleep(.5)