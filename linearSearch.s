        0. add $t0, $zero # &Mem[0]
        1. add $t1, $zero # i=0
        2. addi $s0, 8 # n=8
        3. addi $s1, 4 # num to be searched
        4. comp $s2, $s0 # -n=-8
        5. comp $s3, $s1 # -num=-4
Loop:   6. xor $t2, $t2 # t2=0
        7. add $t2, $t1 # t2=i
        8. add $t2, $s2 # t2=i-n
        9. bz Exit # if t2=0, goto Exit
        10. lw $t3, 0($t0) # t3=Mem[i]
        11. add $t3, $s3 # t3=Mem[i]-num
        12. bz Exit
        13. addi $t1, 1 # i++
        14. addi $t0, 4 # &arr[i+1]
        15. b Loop
Exit:   16. Call Func
Func:   17. Ret