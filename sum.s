.data
arr1 : .word 0, 0, 0 ,0 ,0 ,0 ,0 ,0 ,0
arr2 : .word 0, 0, 0 ,0 ,0 ,0 ,0 ,0 ,0
.text
main:
#register not to be used x0 to x4 and x10 to x17
    addi x5,x0,10 #let x be the size sert to 10
    addi x6,x0 ,0 #let x6 be sum1 set value to 0
    addi x7,x0,o #let x7 be sum2 set value to 0
     #for(i = 0; i < size; i++)
        #arr1[i] = i + 1;
    
    addi x8,x0,0 #let x8 be the i variable set to 0
    la x9, arr1 #3 loading address to x9
   
loop1:   
    bge x8,x5, exit1 #check if i >= size,if so goto exit1
    #calculate arr[1]
    #need base addres of arr1
    #them add ofset of i*4 to the base address
     slli x18,x8,2 #setx18 to i*4
     add x19,x18,x9 #add i*4 to base address of arr1 and put it to x19
     sw x20, 0(x19) #arr1[i] = i+1
     addi x8,x8,1
     j loop1
exit1:
     mv x8 x0 #sei i back to 0
     la x21,arr2 # loading addres of arr2 to x21
loop2:
     bge x8,x5, exit2 #check if i >= size,if so goto exit2
    #calculate arr[1]
    #need base addres of arr1
    #them add ofset of i*4 to the base address
     slli x18,x8,2 #setx18 to i*4
     add x19,x18,x21 #add i*4 to base address of arr1 and put it to x19 (x21 is position of arr2)
     add x20,x8,x8 #set x1 to i+i (2*i)     
     sw x20, 0(x19) #arr2[i] = 2+i
     addi x8,x8,1
     j loop2
exit2:
    mv x8 x0 # set i back to 0
loop3:
 #for(i = 0; i < size; i++) {
        #  sum2 = sum2 + arr2[i];
    #}
     bge x8,x5, exit3 #check if i >= size,if so goto exit3
     slli x18,x8,2 #setx18 to i*4
     add x19,x18,x9 #add i*4 to base address of arr1 and put it to x19
     lw x20, 0(x19) #x20 have arr1[i]
     add x6 x6 x20#su,1 = sum1 + arr1[i]
     
     add x19 x18 x21
     lw x20, 0(x19) #x20 have arr2[i]
     add x7 x7 x20#sum2 = sum2+arr2[i]
     j loop3
exit3:
#print_int
    addi a0 x0 1
    add a1,x0,x6
    ecall
    #print newline
    addi a0,x0,4
    la a1, newline
    ecall
    #print sum2
    addi a0 x0 1
    add a1,x0,x7
    ecall
