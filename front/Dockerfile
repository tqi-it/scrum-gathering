FROM debian:buster

RUN apt update && apt install nano python3-pip git unzip curl clang cmake \
	ninja-build pkg-config libgtk-3-dev liblzma-dev openjdk-11-jdk-headless \
	gradle libjsoncpp-dev libsecret-1-dev -y

# JAVA_HOME
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

# Android SDK
ENV ANDROID_SDK_TOOLS_VERSION=8512546
ENV ANDROID_PLATFORM_VERSION=30
ENV ANDROID_BUILD_TOOLS_VERSION=30.0.3
ENV ANDROID_HOME=/root/android-sdk-linux
ENV ANDROID_SDK_ROOT="$ANDROID_HOME"
ENV PATH=${PATH}:${ANDROID_HOME}/cmdline-tools/cmdline-tools/bin:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/emulator

RUN curl -C - --output android-sdk-tools.zip https://dl.google.com/android/repository/commandlinetools-linux-${ANDROID_SDK_TOOLS_VERSION}_latest.zip \
	&& mkdir -p ${ANDROID_HOME}/ \
	&& unzip -q android-sdk-tools.zip -d ${ANDROID_HOME}/cmdline-tools/ \
	&& rm android-sdk-tools.zip \
	&& yes | sdkmanager --licenses \
	&& touch $HOME/.android/repositories.cfg \
	&& sdkmanager platform-tools \
	&& sdkmanager emulator \
	&& sdkmanager "platforms;android-${ANDROID_PLATFORM_VERSION}" "build-tools;$ANDROID_BUILD_TOOLS_VERSION" \
	&& sdkmanager --install "cmdline-tools;latest"

ENV FLUTTER_CHANNEL="stable"
ENV FLUTTER_VERSION="3.7.5"
ENV FLUTTER_HOME=/root/flutter
ENV PATH=${PATH}:${FLUTTER_HOME}/bin

# Flutter SDK
RUN curl -C - --output flutter.tar.xz https://storage.googleapis.com/flutter_infra_release/releases/${FLUTTER_CHANNEL}/linux/flutter_linux_${FLUTTER_VERSION}-${FLUTTER_CHANNEL}.tar.xz
RUN tar -xf flutter.tar.xz -C ~
RUN rm flutter.tar.xz
RUN flutter config --android-sdk "${ANDROID_SDK_ROOT}" \
	&& yes | flutter doctor --android-licenses
RUN flutter precache --no-linux --no-windows --no-macos
RUN flutter doctor

RUN git config --global --add safe.directory /root/flutter

RUN mkdir -p /front

COPY ./ front/

WORKDIR /front/mentorme

COPY scripts/script.sh /usr/bin

RUN chmod a+x /usr/bin/script.sh

# ENTRYPOINT [ "flutter", "run", "--hot", "-d", "web-server", "--web-hostname", "0.0.0.0","--web-port", "8080" ]
ENTRYPOINT [ "script.sh"]
