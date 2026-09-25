% 1. Criação do sistema de inferência fuzzy
fis = newfis('MPPT_Solar', 'mamdani', 'min', 'max', 'min', 'max', 'centroid');

% 2. Variável de Entrada 1: Variação de Potência (DeltaP)
fis = addvar(fis, 'input', 'DeltaP', [-1 1]);
fis = addmf(fis, 'input', 1, 'Negativa', 'trimf', [-2 -1 0]);
fis = addmf(fis, 'input', 1, 'Zero', 'trimf', [-0.5 0 0.5]);
fis = addmf(fis, 'input', 1, 'Positiva', 'trimf', [0 1 2]);

% 3. Variável de Entrada 2: Variação de Tensão (DeltaV)
fis = addvar(fis, 'input', 'DeltaV', [-1 1]);
fis = addmf(fis, 'input', 2, 'Negativa', 'trimf', [-2 -1 0]);
fis = addmf(fis, 'input', 2, 'Zero', 'trimf', [-0.5 0 0.5]);
fis = addmf(fis, 'input', 2, 'Positiva', 'trimf', [0 1 2]);

% 4. Variável de Saída: Variação do duty cycle (DeltaD)
fis = addvar(fis, 'output', 'DeltaD', [-1 1]);
fis = addmf(fis, 'output', 1, 'Diminuir', 'trimf', [-2 -1 0]);
fis = addmf(fis, 'output', 1, 'Manter', 'trimf', [-0.5 0 0.5]);
fis = addmf(fis, 'output', 1, 'Aumentar', 'trimf', [0 1 2]);

% 5. Base de regras
% Formato: [Entrada1 Entrada2 Saida1 Peso Operador_E(1=AND)]
regras = [
    1 1 3 1 1;
    1 2 2 1 1;
    1 3 1 1 1;
    2 1 1 1 1;
    2 2 2 1 1;
    2 3 3 1 1;
    3 1 3 1 1;
    3 2 2 1 1;
    3 3 1 1 1
];
fis = addrule(fis, regras);

% 6. Avaliação do sistema com os valores de teste
entradas_teste = [-1.0, 0.25];
saida_DeltaD = evalfis(entradas_teste, fis);

% Exibir o resultado final na janela de comandos
fprintf('O valor calculado para Delta D é: %.4f\n', saida_DeltaD);
