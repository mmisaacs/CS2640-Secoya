#CS2640.04 Group Secoya: Alison Ching, Maddie Isaacs , Michelle Paino, Ryan Dautel
#November 29, 2023
#Program 3: Accessing Memory and File Handling
#Task 2: Printing Files
#Takes in a programmer-defined filename and prints out the file

.data
fileName: .asciiz "practiceFile.txt"
buffer: .space 500

.text
main:
    #open file
    li $v0, 13
    la $a0, fileName
    li $a1, 0
    li $a2, 0
    syscall
    move $s0, $v0
    
    #read file
    li $v0, 14
    move $a0, $s0
    la $a1, buffer
    li $a2, 499
    syscall
    
    #print to output screen
    li $v0, 4
    la $a0, buffer
    syscall
    
    #close file
    li $v0, 16
    move $a0, $s0
    syscall
    
    #exit program
    li $v0, 10
    syscall
