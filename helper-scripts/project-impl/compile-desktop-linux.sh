#!/bin/bash

# pre-compilation automata
source "./helper-scripts/project-impl/variables.sh"

source_module="${app_src}/"
electrostatic_sdk="${app_libs}"

# compilation automata
./helper-scripts/project-impl/compile-electrostatic-app.sh \
        "${COMMISSION_EXE}" "${GCC_BIN_x86}" "${GPP_BIN_x86}" "-O3 -fPIC" \
        "${TARGET_x86_64}" "${TOOLCHAIN_INCLUDES_x86};${app_headers}" "${source_module}" \
		"${electrostatic_sdk}/linux/x86-64/" "m;pthread;dl" "." \
         "linux" "${x86_64}" "false" "true"


./helper-scripts/project-impl/compile-electrostatic-app.sh \
        "${COMMISSION_EXE}" "${GCC_BIN_x86}" "${GPP_BIN_x86}" "-O3 -fPIC" \
        "${TARGET_x86}" "${TOOLCHAIN_INCLUDES_x86};${app_headers}" "${source_module}" \
		"${electrostatic_sdk}/linux/x86/" "m;pthread;dl" "." \
         "linux" "${x86}" "false" "true"

# post-compilation automata
# true, See, the compile-electrostatic-app.sh
