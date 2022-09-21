.macro bic(%rd, %rs, %mask)   # Native in ARM
      li $at, %mask
      nor $at, $at, $zero
      and %rd, %rs, $at
.end_macro  