int main()
{
  int a[3][3] = {0},b[3][3] = {0},c[3][3] = {0};
  a[0][0] = 1;a[0][1] = 2;a[0][2] = 3;
  a[1][0] = 4;a[1][1] = 3;a[1][2] = 1;
  a[2][0] = 0;a[2][1] = 5;a[2][2] = 2;
  b[0][0] = 1;b[0][1] = 4;b[0][2] = 1;
  b[1][0] = 2;b[1][1] = 2;b[1][2] = 3;
  b[2][0] = 5;b[2][1] = 3;b[2][2] = 2 ;

  c[0][0] = a[0][0]*b[0][0] + a[0][1]*b[1][0] + a[0][2]*b[2][0];
  c[0][1] = a[0][0]*b[0][1] + a[0][1]*b[1][1] + a[0][2]*b[2][1];
  c[0][2] = a[0][0]*b[0][2] + a[0][1]*b[1][2] + a[0][2]*b[2][2];

  c[1][0] = a[1][0]*b[0][0] + a[1][1]*b[1][0] + a[1][2]*b[2][0];
  c[1][1] = a[1][0]*b[0][1] + a[1][1]*b[1][1] + a[1][2]*b[2][1];
  c[1][2] = a[1][0]*b[0][2] + a[1][1]*b[1][2] + a[1][2]*b[2][2];

  c[2][0] = a[2][0]*b[0][0] + a[2][1]*b[1][0] + a[2][2]*b[2][0];
  c[2][1] = a[2][0]*b[0][1] + a[2][1]*b[1][1] + a[2][2]*b[2][1];
  c[2][2] = a[2][0]*b[0][2] + a[2][1]*b[1][2] + a[2][2]*b[2][2];

  return 0;
}

/*
addiu	$sp,$sp,-128
sw	$fp,124($sp)
move	$fp,$sp
sw	$0,8($fp)
sw	$0,12($fp)
movz	$31,$31,$0
sw	$0,16($fp)
sw	$0,20($fp)
sw	$0,24($fp)
sw	$0,28($fp)
sw	$0,32($fp)
sw	$0,36($fp)
sw	$0,40($fp)
sw	$0,44($fp)
sw	$0,48($fp)
sw	$0,52($fp)
sw	$0,56($fp)
sw	$0,60($fp)
sw	$0,64($fp)
sw	$0,68($fp)
sw	$0,72($fp)
sw	$0,76($fp)
sw	$0,80($fp)
sw	$0,84($fp)
sw	$0,88($fp)
sw	$0,92($fp)
sw	$0,96($fp)
sw	$0,100($fp)
sw	$0,104($fp)
sw	$0,108($fp)
sw	$0,112($fp)
li	$2,1			# 0x1
sw	$2,8($fp)
li	$2,2			# 0x2
sw	$2,12($fp)
li	$2,3			# 0x3
sw	$2,16($fp)
li	$2,4			# 0x4
sw	$2,20($fp)
li	$2,3			# 0x3
sw	$2,24($fp)
li	$2,1			# 0x1
sw	$2,28($fp)
sw	$0,32($fp)
li	$2,5			# 0x5
sw	$2,36($fp)
li	$2,2			# 0x2
sw	$2,40($fp)
li	$2,1			# 0x1
sw	$2,44($fp)
li	$2,4			# 0x4
sw	$2,48($fp)
li	$2,1			# 0x1
sw	$2,52($fp)
li	$2,2			# 0x2
sw	$2,56($fp)
li	$2,2			# 0x2
sw	$2,60($fp)
li	$2,3			# 0x3
sw	$2,64($fp)
li	$2,5			# 0x5
sw	$2,68($fp)
li	$2,3			# 0x3
sw	$2,72($fp)
li	$2,2			# 0x2
sw	$2,76($fp)
lw	$3,8($fp)
lw	$2,44($fp)
nop
mult	$3,$2
mflo	$2
lw	$4,12($fp)
lw	$3,56($fp)
nop
mult	$4,$3
mflo	$3
addu	$2,$2,$3
lw	$4,16($fp)
lw	$3,68($fp)
nop
mult	$4,$3
mflo	$3
addu	$2,$2,$3
sw	$2,80($fp)
lw	$3,8($fp)
lw	$2,48($fp)
nop
mult	$3,$2
mflo	$2
lw	$4,12($fp)
lw	$3,60($fp)
nop
mult	$4,$3
mflo	$3
addu	$2,$2,$3
lw	$4,16($fp)
lw	$3,72($fp)
nop
mult	$4,$3
mflo	$3
addu	$2,$2,$3
sw	$2,84($fp)
lw	$3,8($fp)
lw	$2,52($fp)
nop
mult	$3,$2
mflo	$2
lw	$4,12($fp)
lw	$3,64($fp)
nop
mult	$4,$3
mflo	$3
addu	$2,$2,$3
lw	$4,16($fp)
lw	$3,76($fp)
nop
mult	$4,$3
mflo	$3
addu	$2,$2,$3
sw	$2,88($fp)
lw	$3,20($fp)
lw	$2,44($fp)
nop
mult	$3,$2
mflo	$2
lw	$4,24($fp)
lw	$3,56($fp)
nop
mult	$4,$3
mflo	$3
addu	$2,$2,$3
lw	$4,28($fp)
lw	$3,68($fp)
nop
mult	$4,$3
mflo	$3
addu	$2,$2,$3
sw	$2,92($fp)
lw	$3,20($fp)
lw	$2,48($fp)
nop
mult	$3,$2
mflo	$2
lw	$4,24($fp)
lw	$3,60($fp)
nop
mult	$4,$3
mflo	$3
addu	$2,$2,$3
lw	$4,28($fp)
lw	$3,72($fp)
nop
mult	$4,$3
mflo	$3
addu	$2,$2,$3
sw	$2,96($fp)
lw	$3,20($fp)
lw	$2,52($fp)
nop
mult	$3,$2
mflo	$2
lw	$4,24($fp)
lw	$3,64($fp)
nop
mult	$4,$3
mflo	$3
addu	$2,$2,$3
lw	$4,28($fp)
lw	$3,76($fp)
nop
mult	$4,$3
mflo	$3
addu	$2,$2,$3
sw	$2,100($fp)
lw	$3,32($fp)
lw	$2,44($fp)
nop
mult	$3,$2
mflo	$2
lw	$4,36($fp)
lw	$3,56($fp)
nop
mult	$4,$3
mflo	$3
addu	$2,$2,$3
lw	$4,40($fp)
lw	$3,68($fp)
nop
mult	$4,$3
mflo	$3
addu	$2,$2,$3
sw	$2,104($fp)
lw	$3,32($fp)
lw	$2,48($fp)
nop
mult	$3,$2
mflo	$2
lw	$4,36($fp)
lw	$3,60($fp)
nop
mult	$4,$3
mflo	$3
addu	$2,$2,$3
lw	$4,40($fp)
lw	$3,72($fp)
nop
mult	$4,$3
mflo	$3
addu	$2,$2,$3
sw	$2,108($fp)
lw	$3,32($fp)
lw	$2,52($fp)
nop
mult	$3,$2
mflo	$2
lw	$4,36($fp)
lw	$3,64($fp)
nop
mult	$4,$3
mflo	$3
addu	$2,$2,$3
lw	$4,40($fp)
lw	$3,76($fp)
nop
mult	$4,$3
mflo	$3
addu	$2,$2,$3
sw	$2,112($fp)
move	$2,$0
move	$sp,$fp
lw	$fp,124($sp)
addiu	$sp,$sp,128
j	$31
nop

*/