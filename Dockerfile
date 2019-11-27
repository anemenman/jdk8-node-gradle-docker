FROM openjdk:8

# Gradle
RUN \
    cd /usr/local && \
    curl -L https://services.gradle.org/distributions/gradle-5.6.4-bin.zip -o gradle-5.6.4-bin.zip && \
    unzip gradle-5.6.4-bin.zip && \
    rm gradle-5.6.4-bin.zip

ENV GRADLE_HOME=/usr/local/gradle-5.6.4
ENV PATH=$PATH:$GRADLE_HOME/bin

# Node
RUN \
  curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update -qq && apt-get install -qq --no-install-recommends nodejs yarn && \
  rm -rf /var/lib/apt/lists/*


