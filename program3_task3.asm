#CS2640.04 Group Secoya: Alison Ching, Maddie Isaacs , Michelle Paino, Ryan Dautel
#November 29, 2023
#Program 3: Accessing Memory and File Handling
#Task 3: Append to File
#Takes practiceFile.txt file and appends to it
#Append the answer to the prompt: "What have you enjoyed most about the class so far?"
#Bonus Task: file name and content is taken from user input

.macro printStr(%str)
    li $v0, 4
    la $a0, %str
    syscall
.end_macro

.macro getUserString
    li $v0, 8
    la $a0, buffer 	#load address of 'buffer' into $a0
    li $a1, 199 	#199 characters read by syscall
    syscall
.end_macro

#delete 0x0a from filename buffer
.macro delete
deleting:
    beq $t0, 200, exit
    lb $t1, buffer($t0)
    bne $t1, 0x0a, adding
    sb $zero, buffer($t0)
    j exit
adding:
    addi $t0, $t0, 1
    j deleting
exit:
.end_macro

.data
filenamePrompt: .asciiz "Enter file name: "
contentPrompt: .asciiz "\nEnter content to append to file: "
buffer: .space 200

.text
main:
    #print out the filename prompt
    printStr(filenamePrompt)
    
    #get filename
    getUserString
    
    #initialize counter $t0
    li $t0, 0
    #delete 0x0a from filename buffer
    delete

    #open file
    li $v0, 13
    la $a0, buffer
    li $a1, 9
    li $a2, 0
    syscall
    move $s0, $v0
    
    #print out the content prompt
    printStr(contentPrompt)
    
    #get content
    getUserString
    
     #initialize counter $t0
    li $t0, 0
    #delete 0x0a from content
    #delete
    
    #append to file
    li $v0, 15
    move $a0, $s0
    la $a1, buffer
    li $a2, 200
    syscall
    
    #close file
    li $v0, 16
    move $a0, $s0
    syscall
    
    #exit program
    li $v0, 10
    syscall
