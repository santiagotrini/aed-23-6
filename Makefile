1_vectores: 1_vectores.c
	@gcc -o 1_vectores -lm 1_vectores.c

2_random: 2_random.c
	@gcc -o 2_random 2_random.c

3_euclides: 3_euclides.c
	@gcc -o 3_euclides 3_euclides.c

4_binario: 4_binario.c
	@gcc -o 4_binario 4_binario.c

clean:
	@rm 1_vectores 2_random 3_euclides 4_binario

test: 1_vectores 2_random 3_euclides 4_binario
	@bash tests.sh
