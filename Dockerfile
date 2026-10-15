FROM gradle:8.14-jdk21 AS build
WORKDIR /workspace

COPY kot_lib_2/ /workspace/kot_lib_2/
RUN gradle -p /workspace/kot_lib_2 publishToMavenLocal --no-daemon

COPY kotlin1-service-2/ /workspace/kotlin1-service-2/
RUN gradle -p /workspace/kotlin1-service-2 installDist --no-daemon

FROM eclipse-temurin:21-jre
WORKDIR /app
COPY --from=build /workspace/kotlin1-service-2/build/install/kotlin1-service-2/ /app/
EXPOSE 8082
CMD ["/app/bin/kotlin1-service-2"]