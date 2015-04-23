# Hadoop-2.6.0-on-USC-HPCC-Clusters

This project is meant to suppport Hadoop-2.6.0 on USC HPCC clusters. The current version of Hadoop provided by HPCC is Hadoop-1.1.2, which relies on /scratch filesystem rather than HDFS. In this case, the HPC users execute their Hadoop programs by putting their files into /scratch, and then Hadoop will access the data files in /scratch when running the map-reduce. Here shows how Hadoop-2.6.0 can successfully launch up HDFS and YARN on HPCC cluster. We provide two different tutorials as options to run Hadoop. 

<Option 1> **Interactive mode**

1. Copy hadoop repository to your working directory.

          git clone https://github.com/JackMing/Hadoop-2.6.0-on-USC-HPCC-Clusters.git

2. In `setup-and-start-hadoop-on-hpcc`, change `HADOOP_TEMPLATE_DIR` to your working directory, specifically where your conf/ folder is.

          HADOOP_TEMPLATE_DIR=${HADOOP_TEMPLATE_DIR:-/path/to/configuration/template/dir/}

3. In `setup-and-start-hadoop-on-hpcc` and `setup.sh`, chang `HADOOP_HOME` to the path of Hadoop-2.6.0 home directory.

          HADOOP_HOME=/path/to/hadoop/home/directory/

4. You need to request nodes by **qsub** and run it in the interactive mode by adding option **-I**. If you need more options, please check the main page of qsub.

          qsub -d . -l 'walltime=00:30:00,nodes=3,ppn=6,pmem=2g' -I

5. Before you start your hadoop program, you should run the following setup commands first to launch up the HDFS and YARN.

          source setup.sh
          setup-and-start-hadoop-on-hpcc

6. After the setup, you can submit your hadoop job as you want. You can also manage the HDFS by the command

          hdfs

7. Please remember to copy your output file out from the HDFS each time you finish your operation. The HDFS will be erased after you leave the cluster or the running time exceeds the walltime limit you set up before.

<Option 2> **Submit PBS script**

1. Copy hadoop repository to your working directory. 

          git clone https://github.com/JackMing/Hadoop-2.6.0-on-USC-HPCC-Clusters.git


2. In `setup-and-start-hadoop-on-hpcc`, change `HADOOP_TEMPLATE_DIR` to your working directory, specifically where your conf/ folder is.

          HADOOP_TEMPLATE_DIR=${HADOOP_TEMPLATE_DIR:-/path/to/configuration/template/dir/}

3. In `setup-and-start-hadoop-on-hpcc` and `setup.sh`, chang `HADOOP_HOME` to the path of Hadoop-2.6.0 home directory.

          HADOOP_HOME=/path/to/hadoop/home/directory/

4. In PBS script `hadoop-example.pbs`, modify your WORK_HOME path. 
5. The current PBS script will run the hadoop example (wordcount). If you want to run other examples, modify the corresponding paths.
6. Submit PBS script.

          qsub hadoop-example.pbs
