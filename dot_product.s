#include <stdio.h>

#int a[5] = {1, 2, 3, 4, 5};
#int b[5] = {6, 7, 8, 9, 10};

#int main() {
#    int i, sop = 0;
    
 #   for (i = 0; i < 5; i++) {
  #      sop += a[i] * b[i];
   # }
    
  #  printf("The dot product is: %d\n", sop);
  #  return 0;
#}
.data
arr1 : .word 1,2,3,4,5
arr2 : .word 6,7,8,9,10
print_text: .asciiz "The dot product is: "
.text
main:
addi x5 x0 0 #x5 is sop = 0
#register not to be used x0 to x4 and x10 to x17
addi x6 x0 0 #x6 , i = 0
addi x7 x0 5#temporary value x7 = 5
la x9 arr1
la x21 arr2
loop1:
bge x6 x7 exit1
slli x18,x6,2#setx18 to i*4
add x19,x18,x9 #add i*4 to base address of arr1 and put it to x19
add x22,x18,x21 #add i*4 to base address of arr2 and put it to x21
lw x20 0(x19)# load value from a[i]
lw x23 0(x22) #load value from b[i]
mul x8 x20 x23 #x8 = a[i]*b[i]
add x5 x5 x8 #sop += a[i]*b[i]
addi x6 x6 1 #i++
j loop1

exit1:
    # print text
    addi a0 zero 4
    la a1 print_text
    ecall

    # print sop
    addi a0 zero 1
    mv a1 x5
    ecall

    addi a0 zero 10
    ecall
    
