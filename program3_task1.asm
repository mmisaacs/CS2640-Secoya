#CS2640.04 Group Secoya: Alison Ching, Maddie Isaacs , Michelle Paino, Ryan Dautel
#November 29, 2023
#Program 3: Accessing Memory and File Handling
#Task 1: Return a Letter Grade from Scores in Memory

.data
scores: .word 32, 56, 78, 66, 88, 90, 93, 100, 101, 82
gradeLabel1: .asciiz "\nThe grade for "
gradeLabel2: .asciiz " is: "
extraCreditLabel: .asciiz " with Extra Credit"
name: .asciiz "\nAlison Ching, Maddie Isaacs , Michelle Paino, Ryan Dautel"
exitLabel: .asciiz "\nThe program will now exit."

.text
main:
    #load base address
    la $s0, scores
    #initialize loop counter $t0 to zero
    li $t0, 0
    
loop:
    #checks if $t0 equals 10 then exits loop
    beq $t0, 10, exit
    
    #increments $t0 by 1
    addi $t0, $t0, 1
    
    #laod int into $t1
    lw $t1, 0($s0)
    
    #move base to next element
    addi $s0, $s0, 4
    
     #print out gradeLabel1
    li $v0, 4
    la $a0, gradeLabel1
    syscall
    
    #print out number score
    li $v0, 1
    move $a0, $t1
    syscall
    
    #print out gradeLabel2
    li $v0, 4
    la $a0, gradeLabel2
    syscall
    
    #check which letter grade corresponds to score
    bgt $t1, 100, extraCredit
    bge $t1, 90, a
    bge $t1, 80, b
    bge $t1, 70, c
    bge $t1, 60, d
    bge $t1, 0, f
	
extraCredit:
    #display A with Extra Credit
    li $v0, 11
    la $a0, 65
    syscall
    li $v0, 4
    la $a0, extraCreditLabel
    syscall
    
    j loop
    
a:
    #display A
    li $v0, 11
    la $a0, 65
    syscall
    
    j loop
    
b:
    #display B
    li $v0, 11
    la $a0, 66
    syscall
	
    j loop
	
c:
    #display C
    li $v0, 11
    la $a0, 67
    syscall
    
    j loop

d:
    #display D
    li $v0, 11
    la $a0, 68
    syscall
	
    j loop

f:
    #display F
    li $v0, 11
    la $a0, 70
    syscall
    
    j loop
    
exit:
    #display name
    li $v0, 4
    la $a0, name
    syscall
    
    #display the exit label
    li $v0, 4
    la $a0, exitLabel
    syscall
    #exit the program
    li $v0, 10
    syscall
