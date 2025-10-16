#!/bin/bash

source "./helper-scripts/project-impl/variables.sh"

source_module="${app_src}/"
electrostatic_sdk="${app_libs}"

# compilation automata
./helper-scripts/project-impl/compile-electrostatic-app.sh \
        "${COMMISSION_EXE}" "${AVR_GCC_BIN}" "${AVR_GPP_BIN}" "-O2" \
        "-mmcu=atmega32 -D_ELECTRO_MIO" "${AVR_TOOLCHAIN_INCLUDES};${app_headers}" "${source_module}" \
		"${electrostatic_sdk}/avr-mcu/atmega32/" "m" "." \
         "avr-mcu" "atmega32" "false" "true"

./helper-scripts/project-impl/compile-electrostatic-app.sh \
       "${COMMISSION_EXE}" "${AVR_GCC_BIN}" "${AVR_GPP_BIN}" "-O2" \
       "-mmcu=atmega328p -D_ELECTRO_MIO" "${AVR_TOOLCHAIN_INCLUDES};${app_headers}" "${source_module}" \
  "${electrostatic_sdk}/avr-mcu/atmega328p/" "m" "." \
        "avr-mcu" "atmega328p" "false" "true"