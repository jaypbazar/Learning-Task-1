section .data
    title1 db "==== SIMPLE CALCULATOR by Bazar & Garicia ====", 10
    title2 db "==== ADDITION ====", 10
    title3 db "==== SUBTRACTION ====", 10
    title4 db "==== MULTIPLICATION ====", 10
    title5 db "==== DIVISION ====", 10

    menu1 db "[0] Exit", 10
    menu2 db "[1] Add", 10
    menu3 db "[2] Subtract", 10
    menu4 db "[3] Multiply", 10
    menu5 db "[4] Divide", 10

    sum db "Sum: %d", 10
    diff db "Difference: ", 10
    prod db "Product: %d", 10
    quot db "Quotient: %d", 10

    prompt1 db "Enter choice: ", 10
    prompt2 db "Enter the first number: ", 10
    prompt3 db "Enter the second number: ", 10

    errorMessage db "Input should only be between -99 to 99. Please enter again a valid input.", 10


section .bss

section .text
    extern _printf
    extern _scanf
    global _main

_main:

