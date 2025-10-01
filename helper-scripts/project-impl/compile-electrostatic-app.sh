#!/bin/bash

source "./helper-scripts/abstract/abstract-compile.sh"
source "./helper-scripts/abstract/abstract-util.sh"
source "./helper-scripts/project-impl/variables.sh"

# cd "${app_src}" || exit $?

COMMISSION_OUTPUT="${1}"
GCC_BIN="${2}"
GPP_BIN="${3}"
COMPILER_OPTIONS="${4}"
TARGET_MACHINE="${5}"
HEADERS="${6}"
CODEBASE_MODULES=("${7}")
DEPENDENCIES_MODULES=("${8}")
BUILTIN_LIBS="${9}"
SOURCE_DIR="${10}"
SYSTEM_DIR="${11}"
BUILD_DIR="${12}"

# precompile scripts
sources=$(find ${CODEBASE_MODULES[*]} -name *.c -o -name *.cpp -o -name *.cxx | tr '\n' ';')

if [ "${DEPENDENCIES_MODULES[*]}" != "${NULL}" ]; then
    dependencies=$(find ${DEPENDENCIES_MODULES[*]} -name *.a -o -name *.ar | tr '\n' ';')
fi

# compile scripts
compile "${COMMISSION_OUTPUT}" "${GCC_BIN}" "${GPP_BIN}" \
	    "${COMPILER_OPTIONS}" \
        "${TARGET_MACHINE}" "${HEADERS}" \
        "${SOURCE_DIR}" "${sources}" "${dependencies};${BUILTIN_LIBS}" \
        "${SYSTEM_DIR}/${BUILD_DIR}" "." "${SOURCE_DIR}"
