# ----------------------------------------------------------------------------------------
# Find the maxmum value among three. Runs on 64-bit Linux only.
# To assemble and run:
#
#     gcc -c Assignment7.s && ld Assignment7.o && ./a.out
#
# or
#
#     gcc -nostdlib Assignment7.s && ./a.out
# ----------------------------------------------------------------------------------------
# Author: Troy Bechtold

        .global _start

        .text
_start:
        # write your program below
        movq $10, %rcx #x 
        movq $5, %rbx #y
        movq $1, %rdx #z
        cmpq % rcx, %rbx #x < y
        jle _xlarge #x > y
        jmp _ylarge #x < y

 _xlarge:
        cmpq %rcx, %rdx #compare x and z
        jle _xlargest #x > z
        movq % rdx, %rax #x < z
        jmp _end 
 
_ylarge:
        cmpq %rbx, %rdx #compare x and z
        jle _ylargest #y > z
        movq %rdx, %rax #y < z
        jmp _end 
  
_xlargest:
        movq %rcx, %rax 
        jmp _end 
 
_ylargest:
        movq %rbx, %rax 
        jmp _end 
 
_end:
#end of program
	# write your program above

_Exit:  # exit(0)
        mov     $60, %rax               # system call 60 is exit
        xor     %rdi, %rdi              # we want return code 0
        syscall                         # invoke operating system to exit


