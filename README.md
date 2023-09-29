## Julia Practice
This is just a repository containing things that I find useful in Julia. It is my first attempt at playing with Julia so any code here is incredibly rough as I'm not yet familiar with the language. The context of what the main sections of code attempt to do, is to apply methods in machine learning to the Hamiltonian matrix in the ro-vibrational nuclear motion with TROVE (Yurchenko et al, 2007) problem so that we can predict small matrix elements before computation to set them to zero without computing them, thereby reducing the computation time. The machine learning methodology is based on that recently used for MULTIMODE (Chen et al, 2023).

## References
SN Yurchenko, W Thiel, P Jensen; (2007) Theoretical ROVibrational Energies (TROVE): A robust numerical approach to the calculation of rovibrational energies for polyatomic molecules - Journal of Molecular Spectroscopy, https://doi.org/10.1016/j.jms.2007.07.009

Q Chen, P Houston, Q Yu, R Conte, P Pandey, A Nandi, et al; (2023) Communication J Chem Phys: Machine Learning Classification can Significantly Reduce the Cost of Calculating the Hamiltonian Matrix in CI Calculations 