.macro args()
.end_macro
.macro args(%a0)
  move $a0, %a0
.end_macro
.macro args(%a0,%a1)
  move $a0, %a0
  move $a1, %a1
.end_macro
.macro args(%a0,%a1,%a2)
  move $a0, %a0
  move $a1, %a1
  move $a2, %a2
.end_macro
.macro args(%a0,%a1,%a2,%a3)
  move $a0, %a0
  move $a1, %a1
  move $a2, %a2
  move $a3, %a3
.end_macro