clear all
cd C:\github\ADBexcise

import excel "data\excisedata.xlsx", sheet("Sheet1") firstrow
//sureg (qskm1 lskm1 lskm2 lspm1 lspm2 lskt1a lskt1b lskt2 lskt3) (qskm2 lskm1 lskm2 lspm1 lspm2 lskt1a lskt1b lskt2 lskt3)

gen plskm1=pskm1/lskm1
gen plskm2=pskm2/lskm2
gen plspm1=pspm1/lspm1
gen plspm2=pspm2/lspm2
gen plskt1a=pskt1a/lskt1a
gen plskt1b=pskt1b/lskt1b
gen plskt2=pskt2/lskt2
gen plskt3=pskt3/lskt3



// graphing the demand pattern



twoway (line qskm1 qskm2 qspm1 qspm2 qskt1a qskt1b qskt2 qskt3 mo), legend(pos(6) col(4)) 
graph display Graph, ysize(6) xsize(9) scheme(s1rcolor)

graph export "pic/demand.png", as(png) name("Graph")

// graphing the HTP/HJE pattern

twoway (line plskm1 plskm2 plspm1 plspm2 plskt1a plskt1b plskt2 plskt3 mo), legend(pos(6) col(4)) 
graph display Graph, ysize(6) xsize(9) scheme(s1rcolor)
graph export "pic/ratio.png", as(png) name("Graph")