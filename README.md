# Electrostatic-application
> An executable template utilizing the Electrostatic-Sandbox SDK

This is a template that builds a cross-platform native executable application for Linux variants, Android variants, and AVR MCU variants utilizing the Electrostatic-Sandbox SDK libraries.

## Setup the Electrostatic Environment
This will install missing dependencies (CLI tools and toolchains) in `/opt/electrostatic-sandbox` that shall be utilized by the SDK build front-end and CMake to build the applications.

```bash
chmod +rwx ./helper-scripts/setup-environment/setup-sandbox.sh && \
           ./helper-scripts/setup-environment/setup-sandbox.sh
```

## Build the application binary (.elf)
This will build the application binary to all supported platforms; usually if a new build routine is to be built, it has to go here.

```bash
chmod +x ./helper-scripts/project-impl/compile-all.sh && \
         ./helper-scripts/project-impl/compile-all.sh 
```

## Introducing other building routines using Bash
Introducing other building routines is far easy. However, it's mostly dependent on whether the original SDK is supporting those platforms. If not yet, you will have to build a pre-compilation header that excludes the SDK for those unsupported systems or else you will get linking errors.

Usually the build routines will look like that in general:
https://github.com/Electrostat-Lab/Electrostatic-application/blob/0a4d1cb1635df59e5753aad2e2fad8a380d87706/helper-scripts/project-impl/compile-all.sh#L3-L14

They are dependent on that abstraction: 
https://github.com/Electrostat-Lab/Electrostatic-application/blob/0a4d1cb1635df59e5753aad2e2fad8a380d87706/helper-scripts/abstract/abstract-compile.sh#L1-L35

## Build front-end automata, CMake, and Toolchains
Essentially, the build architecture of the Electrostatic-Sandbox SDK is based on the idea of creating a front-end scripted API that creates a building automata, which entails taking an input and passing into a chain of states, and eventually ending with a terminal state; thus the recognition of the machine to the building holds if the terminal state is being reached by the program counter. The initial input to the automata is mainly a building routine instruction and the outputs are proceeded and could be found at the filesystems cmake-build and build, where the terminal output is produced.

The build of the Electrostatic-applications is much simpler than the SDK; it's literally a subset of it.

For more; refer to the [build architecture of the Electrostatic-Sandbox SDK](https://github.com/Electrostat-Lab/Electrostatic-Sandbox/blob/master/electrostatic-sandbox-framework/docs/system-build/architecture.md).
