FROM openjdk:8

RUN wget -O kafka.tgz https://downloads.apache.org/kafka/2.7.0/kafka_2.13-2.7.0.tgz

RUN tar -xvzf kafka.tgz -C /opt

RUN rm -f kafka.tgz

ENV KAFKA_HOME="/opt/kafka_2.13-2.7.0"

ENV PATH="${KAFKA_HOME}/bin:${PATH}"

WORKDIR /app

COPY default-server.properties /app/default-server.properties

COPY generate-server-props.sh /app/generate-server-props.sh

RUN echo $(pwd)

RUN chmod +x /app/generate-server-props.sh

RUN /app/generate-server-props.sh

CMD /app/generate-server-props.sh >> /app/severr.properties; kafka-server-start.sh /app/severr.properties

