FROM centos/java8:v2

RUN curl -s http://apache.claz.org/spark/spark-1.6.1/spark-1.6.1-bin-hadoop2.6.tgz | tar -xz -C /usr/share; \
cd /usr/share &&  ln -s spark-1.6.1-bin-hadoop2.6 spark; \
curl -s http://www.scala-lang.org/files/archive/scala-2.11.8.tgz | tar -xz -C /usr/share; \
ln -s scala-2.11.8 scala; 

ENV PATH=$PATH:/usr/share/scala/bin:/usr/share/spark/bin SCALA_HOME=/usr/share/scala SPARK_HOME=/usr/share/spark

CMD ["/bin/bash"]