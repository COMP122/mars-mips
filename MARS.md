# MARS: Installation and Startup

During this semester, you will be learning about the MIPS assemble language. We will be using the MARS IDE.  This file walks you through the process to install the IDE and to begin to become familirize with it.

Perform the following steps:

1. Clone the mars-mips repo.  [Done: as part of the COMP122 setup process.]
1. Navigate to the mars-mips local repo:  ``cd ~/Desktop/classes/comp122/mars_mips``
1. Perform a ``git pull`` on the class material repo


1. Potentially install java (https://www.java.com/)

1. Install the software onto your computer.
  * Several security might arise with installing this software.
  * For example on a Mac, you will need to do the following:
    1. In the Finder on your Mac, locate the app you want to open.
    1. Control-click the app icon, then choose Open from the shortcut menu.
    1. Click Open.

1. Locate the files associated with the MIPS material
  * cd ~/Desktop/classes/comp122
  * cd mars_mips
  * ls 
    * documentation
    * examples
    * mars

1. Review the files in the mars subdirectory
   * MARS features.pdf
   * MARS Tutorial.doc

1. Open the MARS simulator
  * Using one of the following approaches
    * click on the icon
    * ``open ~/Desktop/classes/comp122/mars_mips/mars/Mars4_5.jar``
    * ``java -jar ~/Desktop/classes/comp122/mars_mips/mars/Mars4_5.jar ``
  * Make your life easier by defining an alias:
    * Place the following command in your ~/.profile
    ```
    alias mars="java -jar ~/Desktop/classes/comp122/mars_mips/mips/mars/Mars4_5.jar"
    ```
  * With the alias you can now launch mars either as:
    * ``mars``: to launch the GUI
    * ``mars filename.s``: to run the program without the GUI
      - Note: ``mars checksum.s < inputfile``

1. Complete the following exercises

  1. Exercise #1:  Review the Menu Bar.
     1. The menu bar is broken down into three major sections: 
     1. File operations:  New, open, save
     1. Edit operation: Undo, redo, cut, paste, etc.
     1. Run operations: Assemble, execute, forward step, backward step, pause, stop, reset.
 
  1. Exercise #2: Load and execute the "empty" code
     1. Load the 'empty.s' code:  (File -> Open )
     1. Assemble the code: (Run -> Assemble)
     1. Step through your code:  (Run -> Step)
     1. Watch what happens in the Text Segment window
 
  1. Exercise #3: Load and execute the "hello_world" code
     1. Load the 'hello_world.s' code:  (File -> Open )
     1. Assemble the code: (Run -> Assemble)
     1. Single step through the program until the simulator stops
     1. Watch what happens in the Text Segment and the Register windows
     1. Notice what happens when you encounter the 'syscall' command.
        * This is a trap to the kernel
        * An internal subcommand is executed that prints a string. 
        * The syscall takes two arguments; in our example, the values are stored  in two special registers: $v0 and $a0.  
        * The value of the $v0 register specifies that system should print a  string.  
        * The value of the $a0 register contains the address in memory of the  string to be printed.
        * When you step over this 'syscall' command, look at the console window where the string "hello world" should be printed.  All I/O results are performed within this window.

  1. Exercise #4: Load and execute the "echo_int" code
     1. Load the 'echo_int.asm' code:  (File -> Open )
     1. Assemble the code: (Run -> Assemble)
     1. Single step through the program until the simulator stops
     1. Watch what happens in the Text Segment and the Register windows
        * In this example, the simulator should stop on the 'syscall' command.  
        * This particular call to the 'syscall' command reads and integer from the console.  
        * You should enter a integer (followed by a return) in the console.  
        * Notice the value of the entered number has been placed into register $v0. 
        * This number is then placed into memory, by the 'sw' instruction, at the address 'num'.  
        * We also move this value into $v0.  This register is subsequently used by the next 'syscall' command to print the integer out to the console.

 
