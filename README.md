# Controle Fuzzy MPPT para Rastreamento do Ponto de Máxima Potência em Painéis Solares

Sistema de inferência fuzzy (Mamdani) projetado para ajustar o duty cycle de um conversor CC-CC e manter um painel fotovoltaico a operar no seu ponto de máxima potência.

## Variáveis do Sistema

**Variável de Entrada 1: Variação de Potência (ΔP)**
* Universo de discurso: [-1, 1] p.u.
* Termos linguísticos: {Negativa, Zero, Positiva}

**Variável de Entrada 2: Variação de Tensão (ΔV)**
* Universo de discurso: [-1, 1] p.u.
* Termos linguísticos: {Negativa, Zero, Positiva}

**Variável de Saída: Variação do duty cycle (ΔD)**
* Universo de discurso: [-1, 1] p.u.
* Termos linguísticos: {Diminuir, Manter, Aumentar}

## Base de Regras (Tabela)

| ΔP \ ΔV | Negativa | Zero | Positiva |
| :--- | :--- | :--- | :--- |
| **Negativa** | Aumentar | Manter | Diminuir |
| **Zero** | Diminuir | Manter | Aumentar |
| **Positiva** | Aumentar | Manter | Diminuir |

## Instruções de Execução

O código foi desenvolvido e testado no ambiente GNU Octave.
1. Certifique-se de que possui a biblioteca de lógica fuzzy instalada. Na Janela de Comandos, execute: `pkg install -forge fuzzy-logic-toolkit`
2. Carregue a biblioteca antes de executar o código com o comando: `pkg load fuzzy-logic-toolkit`
3. Execute o ficheiro principal `fuzzy_mppt.m`.

## Resultados de Teste

Para o cenário de teste exigido no exercício:
* **Entradas:** ΔP = -1.0 p.u. e ΔV = 0.25 p.u.
* **Saída Calculada Manualmente:** ΔD = -0.218 p.u.
* **Saída Calculada Computacional:** ΔD = -0.1997 p.u.

## Cálculos Manuais
O desenvolvimento analítico das 5 fases do processo de inferência fuzzy (Parte 1) encontra-se digitalizado no seguinte documento:
[Clique aqui para ver o PDF com os cálculos manuais](calculos_a_mao.pdf)

## Autor
* **Nome:** Wesley Francisco Rodrigues Marques Lima - 2018113029
* **Disciplina:** Automação Inteligente
