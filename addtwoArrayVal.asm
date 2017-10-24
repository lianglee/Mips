#  addtwoArrayVal($array_adddress){ 
#  	$array_adddress = *$array_adddress + 4;
# 	$t2 = $array_adddress[0];	
# 	$t3 = $array_adddress[1];
# 	return $t2 + $t3
# }
#
#
.data 
	array: .space 100
.text
main:
	#loading starting address of array to $s1 array[0]
	la, $s1, array

	#simply store 1, 2 to temperory variables
	
	li $t1, 1
	li $t2, 2
	
	#storing array[0] = 1	
	sw $t1, ($s1)

	#jump to address array[1] by adding 4 because each array index allocation is of 4 bytes
	#storing array[1] = 2	
	addi $s2, $s1, 4
	sw $t2, ($s2)

	#call addtwoArrayVal(<array address>)		
	move $a0, $s1
	jal addtwoArrayVal
	j exit
addtwoArrayVal:
	#rembember $a0 argument (<a0>...) contain address of array or array[0]
	#load array[0] in a0
	lw  $t2, ($a0)  # $t2 = array[0]
	
	#next element is at at 1, so address of array[0] is 4 bytes address away so address of array[1] = address array[0] + 4
	add $t1, $a0, 4
	lw  $t3, ($t1)  # $t3 = array[1];
	
	add $s0, $t2, $t3 #$s3 = $t2 + $t3
	jr $ra
exit:
	#printing the result
	li $v0, 36 #36 for printing unassigned integer
	move $a0, $s0
	syscall
