import pandas as pd

df = pd.read_csv("HamiltonianH2S.txt", delim_whitespace=True)

df.to_csv("HamiltonianH2S.csv", index=False)