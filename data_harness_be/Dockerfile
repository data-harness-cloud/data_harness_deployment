FROM reg.aidb.site/library/maven as builder
WORKDIR /app
RUN git clone https://gitee.com/data_harness_cloud/data_harness-be.git .
RUN mvn clean 
RUN mvn install -Dmaven.test.skip=true -Dmaven.javadoc.skip=true

FROM reg.aidb.site/library/openjdk8-jre as release
WORKDIR /app
COPY --from=builder /app/application-webadmin/target/application-webadmin-1.0.0.jar /app/
CMD ["sh", "-c", "java -jar -Duser.timezone=Asia/Shanghai application-webadmin-1.0.0.jar"]
EXPOSE 8082