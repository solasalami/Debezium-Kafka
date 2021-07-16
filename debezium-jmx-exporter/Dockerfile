FROM debezium/connect:latest

RUN curl https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.3.1/jmx_prometheus_javaagent-0.3.1.jar > /kafka/jmx_prometheus_javaagent.jar
COPY config.yml /kafka/config.yml
RUN mkdir $KAFKA_HOME/instantclient
COPY ./instantclient/* $KAFKA_HOME/instantclient/
COPY *.jar $KAFKA_HOME/libs/
ENV LD_LIBRARY_PATH=$KAFKA_HOME/instantclient/
COPY *.jar $KAFKA_HOME/connect/debezium-connector-oracle/
USER root
RUN yum -y install libaio && yum clean all
USER kafka