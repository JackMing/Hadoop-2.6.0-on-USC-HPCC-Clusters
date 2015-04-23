# Hadoop-2.6.0-on-USC-HPCC-Clusters
This project is meant to suppport Hadoop-2.6.0 on USC HPCC clusters. The current version of Hadoop provided by HPCC is **Hadoop-1.1.2** ,which relies on /scratch filesystem rather than HDFS. In this case, the HPC users execute their Hadoop programs by putting their files into /scratch, and then Hadoop will access the data files in /scratch when running the map-reduce. Here shows how Hadoop-2.6.0 can successfully launch up HDFS and YARN on HPCC cluster. We provide two different tutorials as options to run Hadoop. 

>kjeqoejqwo

1. You need to request nodes by **qsub** and run it in the interactive mode by adding option **-I**
If you need more options, please check the main page of qsub.

          qsub -d . -l 'walltime=00:30:00,nodes=3,ppn=6,pmem=2g' -I
      
2. Before you start your hadoop program, you should run the following setup commands first to launch up the HDFS and YARN.

          source setup.sh
          setup-and-start-hadoop-on-hpcc
      
3. After the setup, you can submit your hadoop job as you want. You can also manage the HDFS by the command

          hdfs

4. Please remember to copy your output file out from the HDFS each time you finish your operation. The HDFS will be erased after you leave the cluster or the running time exceeds the walltime limit you set up before.
