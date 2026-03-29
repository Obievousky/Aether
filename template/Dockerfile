FROM eclipse-temurin:21-jre-jammy

ARG NEOFORGE_VERSION
ARG USER_ID
ARG GROUP_ID

ENV NEOFORGE_VERSION=${NEOFORGE_VERSION}

RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/* \
  && groupadd -g ${GROUP_ID} minecraft \
  && useradd -u ${USER_ID} -g ${GROUP_ID} -m minecraft

RUN mkdir -p /server && chown ${USER_ID}:${GROUP_ID} /server

USER ${USER_ID}:${GROUP_ID}

WORKDIR /server

RUN curl -o neoforge-installer.jar \
     "https://maven.neoforged.net/releases/net/neoforged/neoforge/${NEOFORGE_VERSION}/neoforge-${NEOFORGE_VERSION}-installer.jar" \
  && java -jar neoforge-installer.jar --installServer \
  && rm neoforge-installer.jar

RUN echo "eula=true" > eula.txt

EXPOSE 25565

CMD ["sh", "run.sh"]