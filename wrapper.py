import os
import sys

# Read in the files of inputs
finputs = open(sys.argv[1],"r+")
inputs = finputs.readlines()

exec_name = 'a.out'

my_task_id = int(sys.argv[2])
num_tasks = int(sys.argv[3])

myInputs = inputs[my_task_id-1:len(inputs):num_tasks]
print("Iterating index values for this task:%d" % my_task_id)
for input_ in myInputs:
    print(input_)

for i in myInputs:
    cmd = './' + exec_name + ' ' + i
    os.system(cmd)
