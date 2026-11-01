# Coloração em Grafos

Trabalho de Teoria e Aplicação em Grafos: comparação de três heurísticas de coloração de vértices (Sequencial/Gulosa, Welsh-Powell e DSATUR) em grafos

## Compilar e rodar

Com Make:
    make          # compila em build/coloring
    make run
    make test
    make clean

Com CMake:
    cmake -S . -B build/cmake
    cmake --build build/cmake
    ./build/cmake/coloring

## Fluxo dos dados

    src/generator -> data/instances -> src/benchmark -> results/*.csv
                                                            |
                                  assets/charts <- scripts/plot_results.py

Formato do CSV (combinado entre C++ e Python):

    n,densidade,instancia,heuristica,num_cores,tempo_ms

## Gráficos
    pip install pandas matplotlib
    make plots

graph-coloring/
├── README.md                  
├── CMakeLists.txt             # build
├── .gitignore                 # build/, data/instances/, results/
│
├── src/
│   ├── main.cpp              
│   ├── core/
│   │   ├── Graph.hpp/.cpp     # lista de adjacência, graus, vizinhos
│   │   ├── Coloring.hpp       # resultado: cor de cada vértice, nº de cores
│   │   └── Validator.hpp/.cpp # confere se a coloração é válida
│   ├── heuristics/
│   │   ├── Greedy.hpp/.cpp         # sequencial
│   │   ├── WelshPowell.hpp/.cpp
│   │   └── Dsatur.hpp/.cpp
│   ├── generator/
│   │   └── RandomGraph.hpp/.cpp    # grafos aleatórios (com seed)
│   ├── benchmark/
│   │   └── Benchmark.hpp/.cpp      # roda tudo, mede tempo, escreve o CSV
│   └── io/
│       ├── GraphIO.hpp/.cpp        # ler/escrever grafo em arquivo
│       └── CsvWriter.hpp/.cpp
│
├── tests/                     # testes pequenos (grafos conhecidos, validador)
│
├── data/
│   ├── instances/             # grafos gerados (n50/, n100/, ...), não vai pro Git
│   └── practical_case/        # dados do caso prático
│
├── results/                   # CSVs gerados pelo benchmark
│
├── scripts/
│   └── plot_results.py       # lê os CSVs e gera tabela e gráficos
│
└── assets/
    ├── report/                # relatório (versões e figuras usadas nele)
    ├── charts/                # gráficos gerados pelo Python
    └── slides/                # apresentação