
***Chapter 3 - Running the analysis***
ssc install mediation

medeff (probit CashJob Urban) (probit GoneHungry Urban CashJob), treat(Urban) mediate(CashJob) sims(100)

*installing asdoc for exporting tables, specifically the ACME part*

ssc install asdoc

asdoc medeff (probit CashJob Urban) (probit GoneHungry Urban CashJob), treat(Urban) mediate(CashJob) sims(100), replace

*Manual 4 step approach*

probit GoneHungry Urban ///relationship is staistically significant, we can go on

probit CashJob Urban  ///relationship is staistically significant, we can go on

probit GoneHungry Urban CashJob /// Urban predicts GoneHungry, not fully though - partial mediation

***Chapter 7 Expanding the analysis***
*Looking for maningful relationship between gender and age for our question*


eststo: probit GoneHungry Age Urban CashJob Female

esttab using "./probit2.tex", replace ///
 b(3) se(3) nomtitle label star(* 0.10 ** 0.05 *** 0.01) ///
 booktabs alignment(D{.}{.}{-1}) ///
 title(N/A table \label{reg1})   ///
 addnotes("N/A.")

*Region dependency*

gen region = .
replace region = 1 if (CentralRegion == 1)
replace region = 2 if (NorthernRegion == 1)
replace region = 3 if (SouthernRegion == 1)

label define region1 1 "CentralRegion" 2 "NorthernRegion" 3 "SouthernRegion"

label values region region1  

**
tab GoneHungry region

probit GoneHungry Urban CashJob Female i.region
eststo: probit GoneHungry  Urban CashJob Female i.region

esttab using "./probit2.tex", replace ///
 b(3) se(3) nomtitle label star(* 0.10 ** 0.05 *** 0.01) ///
 booktabs alignment(D{.}{.}{-1}) ///
 title(N/A table \label{reg1})   ///
 addnotes("N/A.")
 




