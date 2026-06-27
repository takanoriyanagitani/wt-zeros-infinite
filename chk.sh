#!/bin/bash

wsm=./z2stdout.wasm
wsm=./opt.wasm

aot=./z2stdout.aot
aot=./opt.aot

bench4wazero(){
  \time -l wazero run "${wsm}" |
    dd of=/dev/null bs=65536 count=1048576 status=progress
}

bench4wasmtime(){
  (\time -l wasmtime run "${wsm}"; echo $? >&2) |
    dd of=/dev/null bs=65536 count=1048576 status=progress
}

bench4iwasm(){
  \time -l iwasm "${wsm}" |
    dd of=/dev/null bs=65536 count=1048576 status=progress
}

bench4iwasm_aot(){
  \time -l iwasm "${aot}" |
    dd of=/dev/null bs=65536 count=1048576 status=progress
}

bench4wasmer(){
  \time -l wasmer run "${wsm}" |
    dd of=/dev/null bs=65536 count=1048576 status=progress
}

bench4cat(){
  \time -l cat /dev/zero |
    dd of=/dev/null bs=65536 count=1048576 status=progress
}

bench4wasmedge(){
  \time -l wasmedge run "${wsm}" |
    dd of=/dev/null bs=65536 count=1048576 status=progress
}

bench4wasmi(){
  \time -l wasmi_cli "${wsm}" |
    dd of=/dev/null bs=65536 count=1048576 status=progress
}

#bench4iwasm_aot
bench4wazero
#bench4iwasm
#bench4wasmedge
#bench4wasmi
#bench4wasmer
#bench4cat

#bench4wasmtime
