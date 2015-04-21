# Hadoop-2.6.0-on-USC-HPCC-Clusters
This project meant to suppport the Hadoop-2.6.0 on USC HPCC clusters. The current version of Hadoop provided by HPCC is **Hadoop-1.1.2** and do not support HDFS but rely on /scratch filesystem. The HPC users can execute their Hadoop program by putting their file into the /scratch, then the Hadoop will access the data file in the /scratch when running the map-reduce. Here I will show you how the Hadoop-2.6.0 can successfully launch up HDFS and YARN on HPCC cluster. We provided two different tutorials as options to run Hadoop. 

1. You need to request the nodes by **qsub** and run it by interactively mode by having option **-I**
   If you need more options, please check the man page of qsub.
  ```
   qsub -d . -l 'walltime=00:30:00,nodes=3,ppn=6,pmem=2g' -I
  ```
2. Before you start your hadoop program, you should run the following setup commands first to launch up the HDFS and YARN.
  ```
   source setup.sh
  ```
  ```
   setup-and-start-hadoop-on-hpcc
  ```
3. After the setup, you can submit your hadoop job as you want. You can also manage the HDFS by the command `hdfs`.
4. Please remember to copy your output file out from the HDFS each time you finish your operation. The HDFS will be eliminated after you leave the cluster or exceed the walltime limitation you setup before.
