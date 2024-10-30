#!/bin/bash
#Abertura#
echo -e "\n       '-_-'-_-'-_-'-Seja Bem-vindo!-'-_-'-_-'-_-'"
#pausa
sleep 0.5
#...
echo "             A Calculadora v.1.01 via SHell"
#pausa
sleep 0.5
#...
echo -e "\n           Precisamos fazer algumas perguntas"
#...
echo -e "\n     A calculadora requer o pacote python3 instalado       \n"
#pausa
sleep 1
##Abordagem pra ver se o py3 tá instalado, ele segue se não quiser instalar##
while true; do
  read -p "Instalar o pacote python3 (S)im ou (N)ão. Tecle S ou N: " respInstall
#
  if [[ "$respInstall" == "S" || "$respInstall" == "s" ]]; then
    echo "Instalando o pacote python3..."
    sleep 2
    sudo apt update
    sudo apt install -y python3
    break
      elif [[ "$respInstall" == "N" || "$respInstall" == "n" ]]; then
      echo -e "\n Vamos criar os diretórios para instalar a Calculadora..."
      sleep 2
      break
        else
          echo "Resposta Inválida. Por favor, digite S ou N."
  fi
done
#...
###instalando a Calculadora
#...
##[$0]descobre o diretório em que o arquivo está , [cd]entra nesse diretório e [pwd]imprime armezando na var##
atualDir="$(cd "$(dirname "$0")" && pwd)"
#...
##Cria o diretório e registra o acesso usuário e data em um arquivo txt OU || imprima error##
mkdir -p "$atualDir/calc_TagVito/log" || { echo "Falha ao criar pastas"; exit 1; }
echo "$(whoami) $(date)" >> "$atualDir/calc_TagVito/log/hostLogV1.txt"
#...
#...
##cria o diretório para exportar o py OU || imprima error##
mkdir -p "$atualDir/calc_TagVito/Python" || { echo "Falha ao criar pastas"; exit 1; }
##exporta o py pelo cat (CRIANDO ARQUIVO .PY CODIFICADO)##
cat > "$atualDir/calc_TagVito/Python/calculadora_v101_SS_by_tagore_vitorino.py" << EOF
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
EOF
#...
##Define Permisssões de Execução para o Arquivo Criado##
chmod +x "$atualDir/calc_TagVito/Python/calculadora_v101_SS_by_tagore_vitorino.py"
#...
echo -e "\n   '-_-'-_-'-_-'-Calculadora Instalada!-'-_-'-_-'-_-'   \n"
#...
##Executa a função quando o py3 não tá instalado e fica em loop até instalar##
pctPython () {
  while true; do
    read -p "Instalar o pacote python3 (S)im ou (N)ão. Tecle S ou N: " py3
#...    
    if [[ "$py3" == "S" || "$py3" == "s" ]]; then
      echo "Instalando o pacote python3..."
      sleep 0.5
      sudo apt update
      sudo apt install -y python3
      break
      elif [[ "$py3" == "N" || "$py3" == "n" ]]; then
        echo -e "\n Python3 não está instalado. Instale-o e tente novamente. \n"
        sleep 1
        else
          echo "Resposta Inválida. Por favor, digite S ou N."
    fi  
  done
}
#...
##Abrindo uma cond com loop e tratando erro se tentar executar o py sem python3 instalado##
while true; do
	read -p "Deseja abrir a calculadora? (S)im ou (N)ão. Tecle S ou N: " openCalc
  #...
	if [[ "$openCalc" == "S" || "$openCalc" == "s" ]]; then
		sleep 0.5
        #Aqui testa se o py3 tá instalado e chama função da pergunta de install
        if ! command -v python3 &> /dev/null; then
            echo -e "Python3 não está instalado. Instale-o e tente novamente.\n"
            pctPython
        fi
    echo -e "\n  -_-'Abrindo a calculadora_v101_by_tagore_vitorino'-_-  \n"
    sleep 1
		python3 "$atualDir/calc_TagVito/Python/calculadora_v101_SS_by_tagore_vitorino.py"
    break
      elif [[ "$openCalc" == "N" || "$openCalc" == "n" ]]; then
        cat <<EOF
                          
                    Que Pena... -_-

        Tentaremos Outra Vez em Outro Momento!

                              @Tagore_Vitorino

EOF
        break
			  else
				  echo "Resposta Inválida. Por favor, digite S ou N."
	fi
done
###FIM###