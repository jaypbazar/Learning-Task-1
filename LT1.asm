section .data
    ; variables for displaying the title messages
    title1 db "==== SIMPLE CALCULATOR by Bazar & Garcia ====", 10, 0
    title2 db "==== ADDITION ====", 10, 0
    title3 db "==== SUBTRACTION ====", 10, 0
    title4 db "==== MULTIPLICATION ====", 10, 0
    title5 db "==== DIVISION ====", 10, 0
    
    ; variables for displaying the menu messages
    menu1 db "[0] Exit", 10, 0
    menu2 db "[1] Add", 10, 0
    menu3 db "[2] Subtract", 10, 0
    menu4 db "[3] Multiply", 10, 0
    menu5 db "[4] Divide", 10, 0

    ; variables for displaying the output messages
    sum db "Sum: %d", 10, 0
    diff db "Difference: ", 10, 0
    prod db "Product: %d", 10, 0
    quot db "Quotient: %d", 10, 0

    ; variables for displaying the prompts
    prompt1 db "Enter choice: ", 10, 0
    prompt2 db "Enter the first number: ", 10, 0
    prompt3 db "Enter the second number: ", 10, 0
    prompt4 db "Thank you!", 10, 0

    ; format of the inputs
    inputFormat db "%d", 0

    ; variables for displaying the error messages
    errorMessage1 db "Input should only be between -99 to 99. Please enter again a valid input.", 10
    errorMessage2 db "You cannot divide by 0. Please enter again a valid divisor.", 10

section .bss

section .text
    ; external functions for input and output
    extern _printf
    extern _scanf

    ; defining main funtion
    global _main 


_main:

