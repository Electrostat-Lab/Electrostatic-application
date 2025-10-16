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
DYNAMIC_LINKING="${13}"
POST_PROCESSING="${14}"

# precompile scripts
sources=$(find ${CODEBASE_MODULES[*]} -name *.c -o -name *.cpp -o -name *.cxx | tr '\n' ';')

if [ "${DEPENDENCIES_MODULES[*]}" != "${NULL}" ]; then
  if [ "${DYNAMIC_LINKING}" == "true" ]; then
    echo -e "--------- Deferring Linking to runtime ---------"
    dependencies=$(find ${DEPENDENCIES_MODULES[*]} -name *.so | tr '\n' ';')
  else
    echo -e "--------- Performing Static Linking ---------"
    dependencies=$(find ${DEPENDENCIES_MODULES[*]} -name *.a -o -name *.ar | tr '\n' ';')
  fi
fi

# compile scripts
compile "${COMMISSION_OUTPUT}" "${GCC_BIN}" "${GPP_BIN}" \
	    "${COMPILER_OPTIONS}" \
        "${TARGET_MACHINE}" "${HEADERS}" \
        "${SOURCE_DIR}" "${sources}" "${dependencies};${BUILTIN_LIBS}" \
        "${SYSTEM_DIR}/${BUILD_DIR}" "." "${SOURCE_DIR}"

# post-compilation automata
if [ "${POST_PROCESSING}" == "true" ]; then
    chmod +rwx ./helper-scripts/project-impl/post-compile/post-compile-electrostatic.sh
    ./helper-scripts/project-impl/post-compile/post-compile-electrostatic.sh \
      "${SYSTEM_DIR}" "${BUILD_DIR}" "${COMMISSION_OUTPUT}"
fi