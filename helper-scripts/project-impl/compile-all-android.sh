#!/bin/bash

# pre-compilation automata
source "./helper-scripts/project-impl/variables.sh"

source_module="${app_src}/"
electrostatic_sdk="${app_libs}"

# compilation automata

./helper-scripts/project-impl/compile-electrostatic-app.sh \
        "${COMMISSION_EXE}" "${CLANG_BIN}" "${CLANGPP_BIN}" "-O3 -fPIC" \
        "--target=${ARM_64}" "${NDK_TOOLCHAIN_INCLUDES};${app_headers}" "${source_module}" \
        "${electrostatic_sdk}/android/${ARM_64}" "m;c;dl" "." \
         "android" "${ARM_64}" "false" "true"

./helper-scripts/project-impl/compile-electrostatic-app.sh \
        "${COMMISSION_EXE}" "${CLANG_BIN}" "${CLANGPP_BIN}" "-O3 -fPIC" \
        "--target=${ARM_32}" "${NDK_TOOLCHAIN_INCLUDES};${app_headers}" "${source_module}" \
        "${electrostatic_sdk}/android/${ARM_32}" "m;c;dl" "." \
         "android" "${ARM_32}" "false" "true"

./helper-scripts/project-impl/compile-electrostatic-app.sh \
        "${COMMISSION_EXE}" "${CLANG_BIN}" "${CLANGPP_BIN}" "-O3 -fPIC" \
        "--target=${ANDROID_x86}" "${NDK_TOOLCHAIN_INCLUDES};${app_headers}" "${source_module}" \
        "${electrostatic_sdk}/android/${ANDROID_x86}" "m;c;dl" "." \
         "android" "${ANDROID_x86}" "false" "true"


./helper-scripts/project-impl/compile-electrostatic-app.sh \
        "${COMMISSION_EXE}" "${CLANG_BIN}" "${CLANGPP_BIN}" "-O3 -fPIC" \
        "--target=${ANDROID_x86_64}" "${NDK_TOOLCHAIN_INCLUDES};${app_headers}" "${source_module}" \
        "${electrostatic_sdk}/android/${ANDROID_x86_64}" "m;c;dl" "." \
         "android" "${ANDROID_x86_64}" "false" "true"