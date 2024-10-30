#!/usr/bin/env python3
# Calc v.1.01 By @Tagorevitorino

###-------------------------------FUNCTION----------------------------------####

def coletNum():
    global num1, num2
    while True:
      try:
          num1 = int(input('\n  Digite o Primeiro Número do Calculo: '))
          break
      except:
          print("""
          -------------------------------------
          -Digite um Número ao Invés de Letra!-
          -------------------------------------
          """)

    while True:
      try:
          num2 = int(input('  Digite o Segundo Número do Calculo: '))
          break
      except:
          print("""
          -------------------------------------
          -Digite um Número ao Invés de Letra!-
          -------------------------------------
          """)

    return num1, num2
###----------------------------------MAIN-----------------------------------####
print("""
---------Calculadora Versão 1.01------------
----Calcular as 4 Operações Aritméticas-----
-(Soma, Subtração, Multiplicação e Divisão)-
============================================
--------Usando Apenas Dois Números!---------


""")
print("""
--------------------------------------------
------Qual a operação você quer fazer?------
--------------------------------------------
""")
while True:
      operaCalc = input("""
  Para Soma Digite [1]
  Para Subtração Digite [2]
  Para Mulplicação Digite [3]
  Para Divisão Digite [4]

  """)
      if operaCalc in ('1', '2', '3', '4'):
        break
      else:
        print("""
      -------------------------------------
      -Digite um Número ao Invés de Letra!-
      -------------------------------------
      """);

###----------------------------MAIN/CONDITIONS------------------------------####

if operaCalc == '1':
  print('\n  Sua Escolha foi \033[93mSoma\033[0m')
  coletNum()
  resultOp = (num1 + num2)
  print('\n  A Soma de {} e {} é \033[93m{}\033[0m'.format(num1, num2, resultOp))

elif operaCalc == '2':
  print('\n  Sua Escolha foi \033[93mSubtração\033[0m')
  coletNum()
  resultOp = (num1 - num2)
  print('\n  A Subtração de {} e {} é \033[93m{}\033[0m'.format(num1, num2, resultOp))

elif operaCalc == '3':
  print('\n  Sua Escolha foi \033[93mMulplicação\033[0m')
  coletNum()
  resultOp = (num1 * num2)
  print('\n  A Multiplicação de {} e {} é \033[93m{}\033[0m'.format(num1, num2, resultOp))

elif operaCalc == '4':
  print('\n  Sua Escolha foi \033[93mDivisão\033[0m')
  coletNum()
  resultOp = (num1 / num2)
  print('\n  A Divisão de {} e {} é \033[93m{}\033[0m'.format(num1, num2, resultOp))

else: print('Operação Inválida!')
###----------------------------------END_MAIN----------------------------------####
print("""


--------------------------------------------
---------Obrigado, Volte Sempre!------------
--------------------------------------------

            \033[3m@byTagorevitorino\033[0m
""")
###-------------------------------END_PROGRAM-------------------------------####
