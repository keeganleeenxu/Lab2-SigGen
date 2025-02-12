#!/bin/sh

# cleanup
rm -rf obj_dir
rm -f sinegen.vcd

# # view if USB is connected
sudo lsusb
sudo dmesg | grep tty

# run Verilator to translate Verilog into C++, including C++ testbench
verilator -Wall --cc --trace sinegen.sv --exe sinegen_tb.cpp

# build C++ project via make automatically generated by Verilator
make -j -C obj_dir/ -f Vsinegen.mk Vsinegen

# run executable simulation file
obj_dir/Vsinegen