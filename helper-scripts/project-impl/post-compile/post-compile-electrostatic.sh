#!/bin/bash

source "./helper-scripts/project-impl/variables.sh"

SYSTEM_DIR="${1}"
BUILD_DIR="${2}"
COMMISSION_EXE="${3}"

mkdir --parents "$(pwd)/build/${SYSTEM_DIR}/${BUILD_DIR}"
mkdir --parents "$(pwd)/build/${SYSTEM_DIR}/${BUILD_DIR}"

cp --update "$(pwd)/cmake-build/${SYSTEM_DIR}/${BUILD_DIR}/${COMMISSION_EXE}.elf" \
    "$(pwd)/build/${SYSTEM_DIR}/${BUILD_DIR}"

cp --update "$(pwd)/cmake-build/${SYSTEM_DIR}/${BUILD_DIR}/${COMMISSION_EXE}.elf" \
    "$(pwd)/build/${SYSTEM_DIR}/${BUILD_DIR}"