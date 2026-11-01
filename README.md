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

## Estrutura do Projeto

```bash
graph-coloring/
├── README.md
├── Makefile                          # build: make, make run, make test
├── CMakeLists.txt                    # alternativa ao Makefile
├── .gitignore
│
├── src/                              # código-fonte (C++)
│   ├── main.cpp                      # ponto de entrada
│   ├── core/                         # grafo, coloração e validador
│   │   ├── Graph.hpp/.cpp
│   │   ├── Coloring.hpp
│   │   └── Validator.hpp/.cpp
│   ├── heuristics/                   # uma heurística por arquivo
│   │   ├── Greedy.hpp/.cpp           # sequencial (gulosa)
│   │   ├── WelshPowell.hpp/.cpp
│   │   └── Dsatur.hpp/.cpp
│   ├── generator/                    # grafos aleatórios (seed fixa)
│   │   └── RandomGraph.hpp/.cpp
│   ├── benchmark/                    # roda as heurísticas, mede tempo, gera CSV
│   │   └── Benchmark.hpp/.cpp
│   └── io/                           # leitura/escrita de grafos e CSV
│       ├── GraphIO.hpp/.cpp
│       └── CsvWriter.hpp/.cpp
│
├── tests/                            # testes com grafos pequenos conhecidos
│   └── test_main.cpp
│
├── data/
│   ├── instances/                    # grafos gerados (não versionado)
│   └── practical_case/               # dados do caso prático
│
├── results/                          # CSVs do benchmark (não versionado)
│
├── scripts/
│   └── plot_results.py               # CSV -> gráficos e tabelas (Python)
│
└── assets/                           # entregáveis que não são código
    ├── relatorio/                       # relatório
    ├── gráficos/                     # gráficos gerados
    └── slides/                       # apresentação
```