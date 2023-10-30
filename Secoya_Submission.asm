#Group: Secoya
#1:Alison Ching
#2:Maddie Isaacs
#3:Michelle Paino
#4:Ryan Dautel
.data
prompt1: .asciiz "Please enter the first integer: "
prompt2: .asciiz "Please enter the second integer: "

input1: .asciiz "The first integer is: "
input2: .asciiz "\nThe second integer is: "
addResult:  .asciiz "\nThe addition of the two integers is: "
subResult:  .asciiz "\nThe subtraction of the two integers is: "
multResult:  .asciiz "\nThe multiplication of the two integers is: "
divResult:  .asciiz "\nThe division of the two integers is: "
sameInput: .asciiz "\nUser inputs are the same"
difInput: .asciiz "\nUser inputs are different" 


.text
main:
	li $v0, 4
	la $a0, prompt1
	syscall#Prints first prompt,which asks the user for the first integer
	
	li $v0, 5
	syscall#Accepts an integer input
	
	move $s0, $v0 # Moves first integer input to register s0
	
	li $v0, 4
	la $a0, prompt2
	syscall#Prints second prompt,which asks the user for the second integer
	
	li $v0, 5
	syscall#Accepts an integer input
	
	move $s1, $v0# Moves second integer input to register s1
	
	li $v0, 4
	la $a0,input1#Prints the first input
	syscall
	li $v0, 1
	la $a0,($s0)
	syscall
	
	li $v0, 4
	la $a0,input2#Prints the second input
	syscall
	li $v0, 1
	la $a0,($s1)
	syscall
	
	add $t2, $s0, $s1#Addition of both inputs and saved in $t2
	sub $t3, $s0, $s1#Subtraction of both inputs and saved in $t3
	mul $t4, $s0, $s1#Multiplication of both inputs and saved in $t4
	div $t5, $s0, $s1#Division of both inputs and saved in $t5
	
	li $v0, 4#Service call for string printing
	la $a0, addResult#Prints the string that announces the addition operation
	syscall
	li $v0, 1
	move $a0, $t2#Prints the integer value from the addition operation
	syscall

	li $v0, 4#Service call for string printing
	la $a0, subResult#Prints the string that announces the subtraction operation
	syscall
	li $v0, 1
	move $a0, $t3#Prints the integer value from the subtraction operation
	syscall

	li $v0, 4#Service call for string printing
	la $a0, multResult#Prints the string that announces the multiplication operation
	syscall
	li $v0, 1#Service call for integer printing
	move $a0, $t4#Prints the integer value from the mutltiplication operation
	syscall

	li $v0, 4#Service call for string printing
	la $a0, divResult#Prints the string that announces the division operation
	syscall
	li $v0, 1#Service call for integer printing
	move $a0, $t5#Prints the integer value from the division operation
	syscall
	
	beq $s0, $s1, Equal#Checks if the two inputs are equal, jumping to Equal if so
	bne $s0, $s1, notEqual#Checks if the two inputs are not equal, jumping to notEqual if so

Equal:
	li $v0, 4#Service call for integer printing
	la $a0, sameInput#Prints that the inputs are the same to the user
	syscall
	j exit#jumps to exit function
notEqual:
	li $v0, 4#Service call for integer printing
	la $a0, difInput#Prints that the inputs are not the same to the user
	syscall
	j exit#jumps to exit function
exit:	
	li $v0, 10#Ends the program
	syscall
