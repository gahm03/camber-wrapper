# Camber-MPI_wrapper
Alexander-Katz Group

This is a simple example of what I do to run a Job Array on MIT Supercloud. Using the Xeon-P8 Allocation I can run simultanously batches up to 48 jobs of 1 core each (24 for this example)

Depending on the simulations I pass different values to the C executable (a.out), one value for this example. Values are read from the inputFile.dat file.

I submit my script with `sbatch submit.sh`
SLURM is configured and calls the python wrapper

Inside the wrapper, the line `myInputs = inputs[my_task_id-1:len(inputs):num_tasks]` administers the execution of my code. In this particular case, it will pass the 24 values, one for each core. 
If I had 48 values in .dat file, slurm will execute 24 x 2 Jobs (for this example with slurm array=1-24). First 1 - 24 job and then 25 -48.

Usually I don't do that because SLURM will save jobs 1 and 25, 2 and 26 ... in the same folder, I haven't figured out how to save them in different folders.


In Summary I can run simultanously 48 jobs on 8 nodes on Supercloud (depending on the demand, I get the 8 nodes or not at the same time), 48x8 jobs total and then I collect the data with a bash script. 
What we'd like to do for example is to run our code with 100 different inputs without scripting and doing the math for multiples of 48 on n number of nodes and then wait for all to finish. 
If node number 8 went through hours after the rest, I usually wait for it to finsih before collecting the data.

The python wrapper helps becuase I can manipulate variables before passing them to the a.out exec.
