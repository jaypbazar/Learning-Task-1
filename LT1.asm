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
    diff db "Difference: %d", 10, 0
    prod db "Product: %d", 10, 0
    quot db "Quotient: %d", 10, "Remainder: %d", 10, 0

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
    errorMessage3 db "Invalid choice! Please try again.", 10, 0

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

        ; store the valud of choice variable to ax register
        mov ax, [choice]

        ; exit loop if choice is 0 
        cmp ax, 0
        je while_end
        jl choiceError ; print error if choice < 0

        ; jump to case_1 if choice is 1
        cmp ax, 1
        je case_1

        ; jump to case_1 if choice is 2
        cmp ax, 2
        je case_2

        ; jump to case_1 if choice is 3
        cmp ax, 3
        je case_3

        ; jump to case_1 if choice is 4
        cmp ax, 4
        je case_4
        jg choiceError ; print error if choice > 4
        
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
            mov eax, [num1]
            add eax, [num2]

            ; displays Sum: <sum>
            push eax
            push sum
            call _printf
            add esp, 4

            ; jumps to the start of the loop
            jmp while_start

        ; Case for sutraction
        case_2:
            ; display ==== SUBTRACTION ====
            push title3
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

            ; subtract the two numbers
            mov eax, [num1]
            sub eax, [num2]

            ; displays Difference: <diff>
            push eax
            push diff
            call _printf
            add esp, 4

            ; jumps to the start of the loop
            jmp while_start

        ; Case for multiplication
        case_3:
            ; display ==== MULTIPLICATION ====
            push title4
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

            ; multiply the value two numbers
            mov eax, [num1]
            mov ebx, [num2]
            mul ebx

            ; displays Product: <prod>
            push eax
            push prod
            call _printf
            add esp, 4

            ; jumps to the start of the loop
            jmp while_start

        case_4:
            ; display ==== DIVISION ====
            push title5
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

            mov bx, [num2]
            cmp bx, 0
            je zeroDivisionError

            ; clears the edx register
            mov edx, 0

            ; divide the value two numbers
            mov eax, [num1]
            mov ebx, [num2]
            div ebx

            ; displays Quotient: <quot>
            push edx
            push eax
            push quot
            call _printf
            add esp, 8

            ; jumps to the start of the loop
            jmp while_start

        inputRangeError:
            ; displays Input should only be between -99 to 99. Please enter again a valid input.
            push errorMessage1
            call _printf
            add esp, 4

            ; jumps to the start of the loop
            jmp while_start

        zeroDivisionError:
            ; displays You cannot divide by 0. Please enter again a valid divisor.
            push errorMessage2
            call _printf
            add esp, 4

            ; jumps to the start of the loop
            jmp while_start
        
        choiceError:
            ; displays Invalid choice! Please try again.
            push errorMessage3
            call _printf
            add esp, 4

            ; jumps to the start of the loop
            jmp while_start

    while_end: 
        push prompt4
        call _printf
        add esp, 4

    