# Laboratorio YACC

Para correr el código realizar
`yacc -d LAB01_Vargas_Campanella_Gutierrez.y`
Posteriormente, ejecutamos flex
`flex -t LAB01_Vargas_Campanella_Gutierrez.lex > LAB01_Vargas_Campanella_Gutierrez.c`
Luego crear el ejecutable del código en c
`gcc -o LAB01_Vargas_Campanella_Gutierrez LAB01_Vargas_Campanella_Gutierrez.c`
Y por último correr el ejecutable
`./LAB01_Vargas_Campanella_Gutierrez entrada.txt > salida.txt`
