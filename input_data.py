import numpy as np

def generate_sequence(x_delay=5, len_output=15, max_number=255, print_out=False):
    numbers = np.random.choice(list(range(max_number)), size=len_output, replace=False)
    sorted_num = np.sort(numbers)


    # print(f'numbers:\n{numbers}')
    output = sorted_num.reshape(int(len_output/x_delay), x_delay)
    for j in range(output.shape[0]):
        output[j] = np.random.choice(output[j], size=output.shape[1], replace=False)
    output = output.flatten()
    if print_out:
        print(f'output:\n{output}')
        print(f'sorted_output:\n{np.sort(output)}')
    
    return output