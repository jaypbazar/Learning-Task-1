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
    prompt1 db "Enter choice: ", 0
    prompt2 db "Enter the first number: ", 0
    prompt3 db "Enter the second number: ", 0
    prompt4 db "Thank you!", 10, 0

    ; format of the inputs
    inputFormat db "%d", 0

    ; variables for displaying the error messages
    errorMessage1 db "Input should only be between -99 to 99. Please enter again a valid input.", 10
    errorMessage2 db "You cannot divide by 0. Please enter again a valid divisor.", 10

section .bss
    ; defines a reserve byte for the user input
    num1 resb 4
    num2 resb 4
    choice resb 2

section .text
    ; external functions for input and output
    extern _printf
    extern _scanf

    ; defining main funtion
    global _main 

_main:
    while_start:
        ; displays ==== SIMPLE CALCULATOR by YourName ====
        push title1
        call _printf
        add esp, 4

        ; displays [0] Exit
        push menu1
        call _printf
        add esp, 4

        ; displays [1] Add
        push menu2
        call _printf
        add esp, 4

        ; displays [2] Subtract
        push menu3
        call _printf
        add esp, 4

        ; displays [3] Multiply
        push menu4
        call _printf
        add esp, 4

        ; displays [4] Divide
        push menu5
        call _printf
        add esp, 4

        ; displays Enter choice:
        push prompt1
        call _printf
        add esp, 4

        ; get user input for choice
        push choice
        push inputFormat
        call _scanf
        add esp, 8

        ; exit loop if choice is 0
        cmp choice, 0
        je while_end

        ; jump to case_1 if choice is 1
        cmp choice, 1
        je case_1

        ; cmp choice, 2
        ; je case_2

        ; cmp choice, 3
        ; je case_3

        ; cmp choice, 4
        ; je case_4

        ; Case for addition
        case_1:
            ; display ==== ADDITION ====
            push title2
            call _printf
            add esp, 4

            ; displays Enter the first number: 
            push prompt2
            call _printf
            add esp, 4

            ; get user input for num1
            push num1
            push inputFormat
            call _scanf
            add esp, 8

            ; displays Enter the second number: 
            push prompt3
            call _printf
            add esp, 4

            ; get user input for num2
            push num2
            push inputFormat
            call _scanf
            add esp, 8

            ; add the two numbers
            mov eax, num1
            add eax, num2

            ; displays Sum: <sum>
            push num1
            push sum
            call _printf
            add esp, 4

        jmp while_start

    while_end: 
        push prompt4
        call _printf
        add esp, 4