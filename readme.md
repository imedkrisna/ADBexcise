## What's this

This is a repository for a elasticity-calculating project. Data is provided by the Ministry of Finance's BKF. 

## Data

According to Peraturan Menteri Keuangan (PMK) 192/PMK.010/2021 Tentang TARIF CUKAI HASILTEMBAKAU BERUPA SIGARET, CERUTU, ROKOK DAUN ATAU KLOBOT, DAN TEMBAKAU IRIS, There are three types (jenis) of cigarette in Indonesia:

1. Sigaret Kretek Mesin (SKM) is a cloved cigarette which utilises machinery in most of its production. This accounts for 70.5% of total number of cigarette production in our dataset.
2. Sigaret Putih Mesin (SPM) is an uncloved cigarette which utilises machinery in most of its production. This accounts for 4.68% of total number of cigarette production in our dataset.
3. Sigaret Kretek Tangan (SKT) is a cloved cigarette which utilises no machinery at all in its production. This accounts for 24.8% of total number of cigarette production in our dataset. Included in this type is Sigaret Putih Tangan (SPT) which is the uncloved version of SKT, but we generally includes it here because they have the exact same tax structure.

Actually there are other types of cigarettes but these three are the most important and we only have dataset on these three.

For excise purpose, these three types are divided further into categories (golongan) based on how much a single firm produces each category. i.e., the tax structure tries to be progressive in that it put larger firm (e.g., producing so much annualy) on a higher tax brackett. Table 1 shows these categories and I put example from PMK 192/PMK.010/2021 (of course this table evolves as new PMK is produced)

THere are two types of prices in our dataset:
1. Harga Jual Eceran (HJE) is a price used by the government to set how much is the excise per cigarette.
2. Harga Transaksi Pasar (HTP) is a price paid by the consumer. This price is crucial but we have very little data point for this (i.e., many missing obs because MOF does not conduct survey every month)

Table 1. example from the PMK 192/PMK.010/2021

| type/category | Quantity produced | HJE (1000 IDR) | tariff | AVE(%) |
| --- | ----- | ----- | ---- | --- |
| SKM1 | > 3 billion cigarettes | 1.95 | .985 | 50.51 |
| SKM2 | <= 3 billion cigarettes | 1.14 | .6 | 52.63 |
| SPM1 | > 3 billion cigarettes | 2.005 | 1.065 | 53.12 |
| SPM2 | <= 3 billion cigarettes | 1.135 | .635 | 55.94 |
| SKT1a | > 2 billion cigarettes | >1.635 | .44 | 26.91 |
| SKT1b | > 2 billion cigarettes | >1.135 | .345 | 30.4 |
| SKT2 | (0.5 < x < 2) billion cigarettes | >600 | .205 | 34.2 |
| SKT3 | <= 0.5 billion cigarettes | >505 | .115 | 22.77 |

From table 1 we can see that handrolled types are taxed lower. This trend continues in the future iterations of the PMK, in fact.


variables in this dataset is constructed such that $V_{ij}$ be a variable where $i \in {l,q,t,r,p}$ and $j \in {skm1,skm2,spm1,spm2,skt1a,skt1b,skt2,skt3}$. l=HJE, q=production quantity, t=specific rate, r=total revenue, p=HTP. members of $j$ is just type/category but lowercase.

We also have mo=month which is the time index for the dataset which spans from Jan 2014 to Dec 2023.

Therefore, variable names in mydataset should look like this:

> mo lskm1 lskm2 lspm1 lspm2 lskt1a lskt1b lskt2 lskt3 qskm1 qskm2 qspm1 qspm2 qskt1a qskt1b qskt2 qskt3 tskm1 tskm2 tspm1 tspm2 tskt1a tskt1b tskt2 tskt3 rskm1 rskm2 rspm1 rspm2 rskt1a rskt1b rskt2 rskt3 pskm1 pskm2 pspm1 pspm2 pskt1a pskt1b pskt2 pskt3

Naturally I cannot share the dataset but as long as you have these variable names you can recreate this exercise bu running the file "excise.do". Oh and you have to have Stata. Obviously if you have the dataset that I have, you can also recreate this very easily.

Data is in folder "data", pictures in "pic" and regression results in "reg".