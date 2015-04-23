if [ ! "${MINGENV_HADOOP}" ] ; then
  MINGENV_HADOOP=1 ; export MINGENV_HADOOP

  # HADOOP_VERSION=1.1.2
  JAVA_PATH=/usr/lib/jvm/jre-1.6.0-openjdk.x86_64
  JAVA_HOME=/usr/lib/jvm/jre-1.6.0-openjdk.x86_64

  # prefix=/usr/usc/hadoop/default
  prefix=/path/to/hadoop/home/directory/
  _bindir=$prefix/bin

  # export HADOOP_VERSION
  export JAVA_HOME
  if [ -n "$PATH" ]; then
    PATH=$_bindir:$JAVA_PATH:$PATH
  else
    PATH=$_bindir:$JAVA_PATH
  fi
  export PATH

fi
