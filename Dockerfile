# ---- Build ----
FROM maven:3.9-eclipse-temurin-21 AS build
WORKDIR /build
COPY pom.xml .
RUN mvn -B -q dependency:go-offline
COPY src ./src
RUN mvn -B -q -DskipTests package

# ---- Run ----
FROM eclipse-temurin:21-jre
WORKDIR /app
RUN useradd --system --create-home appuser && chown appuser /app
COPY --from=build /build/target/*.jar app.jar
USER appuser

# "demo" = in-memory H2 database with sample data (no MySQL needed).
# Set SPRING_PROFILES_ACTIVE="" and DB_URL / DB_USERNAME / DB_PASSWORD to use MySQL instead.
ENV SPRING_PROFILES_ACTIVE=demo
# Small-memory friendly defaults (e.g. free hosting tiers with 512 MB)
ENV JAVA_OPTS="-XX:MaxRAMPercentage=75 -XX:+UseSerialGC -Xss512k -XX:TieredStopAtLevel=1"
EXPOSE 8080
CMD ["sh", "-c", "exec java $JAVA_OPTS -jar app.jar"]
