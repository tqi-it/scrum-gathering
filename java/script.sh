#!/bin/bash

./gradlew clean build -x test
java -jar -Dspring.profiles.active=local ./build/libs/mentorme-0.0.1-SNAPSHOT.jar