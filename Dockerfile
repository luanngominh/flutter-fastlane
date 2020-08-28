ARG BASE_IMAGE="circleci/android:api-30"

FROM $BASE_IMAGE

LABEL MAINTAINER luanngominh<ngominhluanbox@gmail.com>

USER root

RUN gem install fastlane

# Install Flutter.
ENV FLUTTER_ROOT="/opt/flutter"
RUN git clone --branch 1.20.2 --depth=1 https://github.com/flutter/flutter "${FLUTTER_ROOT}"
ENV PATH="${FLUTTER_ROOT}/bin:${PATH}"
ENV ANDROID_HOME="/opt/android/sdk"

# Disable analytics and crash reporting on the builder.
RUN flutter config  --no-analytics

# Perform an artifact precache so that no extra assets need to be downloaded on demand.
RUN flutter precache

# Accept licenses.
RUN yes "y" | flutter doctor --android-licenses

# Perform a doctor run.
RUN flutter doctor -v

USER circleci