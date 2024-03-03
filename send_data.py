import numpy as np
import serial
from input_data import generate_sequence
import time
import struct

x_delay = 5
len_output = 100
max_number = 127
ordered = []
print_out = False

sequence = generate_sequence(x_delay=x_delay, len_output=len_output, 
                             max_number=max_number, print_out=print_out)

sequence = sequence.tolist() + [np.max([sequence[-x_delay:-1]])]
print(f'Sending the sequence \n{sequence}\n...')

ser = serial.Serial(port='COM6', baudrate=115200, timeout=.1)

for ii in range(x_delay + len(sequence) - 1):

    if ii < len(sequence):
        ser.write(chr(sequence[ii]).encode())

    if ii > x_delay: 
        read_out = ser.read(1)
    
        if read_out:
            # print(f'Read out: {i}, {ord(read_out)}')
            ordered.append(ord(read_out))
print(f'Sorted list\n{ordered}')