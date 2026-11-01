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
