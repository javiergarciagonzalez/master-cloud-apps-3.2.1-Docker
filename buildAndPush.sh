#!/bin/bash

set -e

ROOT_DIR=$(pwd)
IMAGE_PREFIX="javiergarciagon/eoloplanner-"

# Services
WEATHER=weatherservice
TOPO=toposervice
PLANNER=planner
SERVER=server

BUILD_SERVER="docker build -t ${IMAGE_PREFIX}$SERVER ."
BUILD_PLANNER="docker build -t ${IMAGE_PREFIX}$PLANNER ."
BUILD_WEATHER="pack build ${IMAGE_PREFIX}weatherservice --path . --builder heroku/buildpacks:20"
BUILD_TOPO="mvn compile jib:dockerBuild -Dimage=${IMAGE_PREFIX}toposervice"


buildAndPush() {

    echo "\n"
    echo "\n"
    echo "--------------- $1 ----------------"
    echo "\n"
    echo "Building $1..."
    cd "${ROOT_DIR}/$1" && $2
    echo "Pushing $1..."
    docker push ${IMAGE_PREFIX}$1
    echo "[DONE] - $1 built and published"

}

echo "---------------- START ----------------"
echo "---------------------------------------"

buildAndPush "$SERVER" "$BUILD_SERVER"
buildAndPush "$PLANNER" "$BUILD_PLANNER"
buildAndPush "$TOPO" "$BUILD_TOPO"
buildAndPush "$WEATHER" "$BUILD_WEATHER"

