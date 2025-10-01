#!/bin/bash

function compile() {
    local COMMISSION_OUTPUT=${1}
    local GCC_BIN=${2}
    local GPP_BIN=${3}
    local INPUT_COMPILER_OPTIONS=${4}
    local TARGET=${5}
    local HEADERS=${6}
    local SOURCES_DIR=${7}
    local PROJECT_SOURCES=${8}
    local DEPENDENCIES=${9}
    local BUILD_DIR=${10}
    local CMAKE_DIR=${11}

    local TEMP=$(pwd)

    cd "${CMAKE_DIR}" || exit $?

    cmake-3.19 "-DCOMMISSION_OUTPUT=${COMMISSION_OUTPUT}" \
          "-DGCC_BIN=${GCC_BIN}" \
          "-DGPP_BIN=${GPP_BIN}" \
          "-DINPUT_COMPILER_OPTIONS=${INPUT_COMPILER_OPTIONS}" \
          "-DTARGET=${TARGET}" \
          "-DHEADERS=${HEADERS}" \
          "-DSOURCES_DIR=${SOURCES_DIR}" \
          "-DPROJECT_SOURCES=${PROJECT_SOURCES}" \
          "-DDEPENDENCIES=${DEPENDENCIES}" \
          "-DBUILD_DIR=${BUILD_DIR}" \
          -S . -B "$(pwd)/${SOURCES_DIR}/cmake-build/${BUILD_DIR}"

    cmake-3.19 --build "$(pwd)/${SOURCES_DIR}/cmake-build/${BUILD_DIR}" || exit $?

    cd "${TEMP}" || exit $?
}

