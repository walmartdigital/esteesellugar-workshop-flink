FROM apache/zeppelin:0.9.0

USER root

ENV FLINK_VERSION=flink-1.12.2

RUN curl -l "https://downloads.apache.org/flink/${FLINK_VERSION}/${FLINK_VERSION}-bin-scala_2.11.tgz" -o /opt/${FLINK_VERSION}.tgz
RUN tar -xvzf /opt/${FLINK_VERSION}.tgz -C /opt/
RUN rm /opt/${FLINK_VERSION}.tgz
COPY flink-interpreter-setting.json .
RUN sed -i 's:{{FLINK_HOME}}:/opt/'"${FLINK_VERSION}"':g' flink-interpreter-setting.json
RUN cp flink-interpreter-setting.json /opt/zeppelin/interpreter/flink/interpreter-setting.json

# install flink kafka dependencies
RUN curl -l https://repo1.maven.org/maven2/org/apache/flink/flink-connector-kafka-base_2.11/1.11.3/flink-connector-kafka-base_2.11-1.11.3.jar -o /opt/${FLINK_VERSION}/lib/flink-connector-kafka-base_2.11-1.11.3.jar
RUN curl -l https://repo1.maven.org/maven2/org/apache/flink/flink-streaming-scala_2.11/1.12.2/flink-streaming-scala_2.11-1.12.2.jar -o /opt/${FLINK_VERSION}/lib/flink-streaming-scala_2.11-1.12.2.jar
RUN curl -l https://repo1.maven.org/maven2/org/apache/flink/flink-connector-kafka_2.11/1.12.2/flink-connector-kafka_2.11-1.12.2.jar -o /opt/${FLINK_VERSION}/lib/flink-connector-kafka_2.11-1.12.2.jar
RUN curl -l https://repo1.maven.org/maven2/org/apache/flink/flink-core/1.12.2/flink-core-1.12.2.jar -o /opt/${FLINK_VERSION}/lib/flink-core-1.12.2.jar
RUN curl -l https://repo1.maven.org/maven2/org/apache/flink/flink-clients_2.11/1.12.2/flink-clients_2.11-1.12.2.jar -o /opt/${FLINK_VERSION}/lib/flink-clients_2.11-1.12.2.jar
RUN curl -l https://repo1.maven.org/maven2/org/apache/kafka/kafka-clients/2.7.0/kafka-clients-2.7.0.jar -o /opt/${FLINK_VERSION}/lib/kafka-clients-2.7.0.jar

USER 1000