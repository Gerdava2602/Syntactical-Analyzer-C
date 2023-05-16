yacc -d LAB01_Vargas_Campanella_Gutierrez.y
flex -t LAB01_Vargas_Campanella_Gutierrez.lex > LAB01_Vargas_Campanella_Gutierrez.c
gcc -o LAB01_Vargas_Campanella_Gutierrez LAB01_Vargas_Campanella_Gutierrez.c
./LAB01_Vargas_Campanella_Gutierrez entrada.txt > salida.txt