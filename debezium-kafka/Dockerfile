FROM debezium/kafka:1.6
RUN mkdir $KAFKA_HOME/instantclient
RUN mkdir $KAFKA_HOME/kafka-data
COPY ./instantclient/* $KAFKA_HOME/instantclient/
COPY *.jar $KAFKA_HOME/libs/
ENV LD_LIBRARY_PATH=$KAFKA_HOME/instantclient/