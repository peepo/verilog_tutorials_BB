verilog tutorials for iCE40HX8K Breakout Board

Install IceStorm: http://www.clifford.at/icestorm/

Install necessary tools:

    sudo apt-get install git cmake 

Clone the repository:

    git clone https://github.com/peepo/verilog_tutorials_BB

Build one of the examples:

    cd project
    make
    make upload

NB make upload uses -S to program SRAM so please remove J7 jumper and rotate 2xJ6 jumpers

when cmake is implemented:

Build one of the examples:

    cd verilog_tutorials_BB/build
    cmake ..
    cd project_0/
    make
    ./LED

Build all examples (takes a while):

    cd verilog_tutorials_BB/build
    cmake ..
    make

---

please send comments, and report bugs to the current maintainer: Jonathan Chetwynd

jay@peepo.com

created in conjunction with these excellent resources:

https://embeddedmicro.com/tutorials/mojo/creating-a-project

https://nandland.com/verilog/tutorials/tutorial-introduction-to-verilog-for-beginners.html
