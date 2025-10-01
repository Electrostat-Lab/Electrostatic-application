cmake_minimum_required(VERSION 3.18.1)

# define a project with a version
project(electrostatic-application VERSION 1.0)

# To generate compile_commands.json for your project,
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

###################### CMake Predefined Variables ######################
############################################################

message(STATUS "Project: electrostatic-application")
message(STATUS "Current Output in-comission: ${COMMISSION_OUTPUT}")
message(STATUS "GCC: ${GCC_BIN}")
message(STATUS "GPP: ${GPP_BIN}")
message(STATUS "Compiler Options: ${INPUT_COMPILER_OPTIONS}")
message(STATUS "Target architecture: ${TARGET}")
message(STATUS "Toolchain Headers: ${HEADERS}")
message(STATUS "Source Directory: ${SOURCES_DIR}")
message(STATUS "Project sources: ${PROJECT_SOURCES}")
message(STATUS "Dependencies: ${DEPENDENCIES}")
message(STATUS "Building the binaries to: ${BUILD_DIR}")

###################### CMake Variables ######################
############################################################

set(PROJECT_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/${SOURCES_DIR}")

set(commission_exe "${COMMISSION_OUTPUT}.elf")

set(CMAKE_C_COMPILER "${GCC_BIN}")
set(CMAKE_CXX_COMPILER "${GPP_BIN}")
set(COMPILER_OPTIONS "${TARGET} ${INPUT_COMPILER_OPTIONS}")

set(headers "${HEADERS}")

###################### Build routines ######################
############################################################

# build an executable
add_executable(${commission_exe}) # executable based on the static archive
set_target_properties(${commission_exe} PROPERTIES COMPILE_FLAGS "${COMPILER_OPTIONS}" LINK_FLAGS "${COMPILER_OPTIONS}")
# include headers for the target
target_include_directories(${commission_exe} PUBLIC ${lib_headers} ${headers})
target_link_libraries(${commission_exe} PUBLIC "${DEPENDENCIES}")
# Start building the target
target_sources(${commission_exe} PUBLIC "${PROJECT_SOURCES}")
