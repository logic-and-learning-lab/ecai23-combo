
This repository contains the experimental code and data for the paper: [Learning Logic Programs by Combining Programs]

********** IMPORTANT **********
Due to restrictions on the size of the supplementary material, we have removed the training and testing data for the graph/imdb/zendo tasks because they require too much space. We still provide the induced programs and experimental results  but not the training and testing BK.
*******************************

# Requirements

[SWI-Prolog](https://www.swi-prolog.org)

[Clingo 5.5.0](https://potassco.org/clingo/)

[pyswip](https://pypi.org/project/pyswip/)

# Data

The training data are in the folder data/{task}/data/train

The testing data are in the folder data/{task}/data/test

The induced programs are in the folder data/{task}/programs

The results are in the folder data/{task}/results

# Usage

You can reproduce the plots with the command: `python benchmark.py results`

You can run the tests again with the command: `python benchmark.py test`

You can run the learning/training again with the command: `python benchmark.py train`



COMBO is the popper2 folder.# ecai23-combo
