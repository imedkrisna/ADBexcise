clear all
cd C:\github\ADBexcise

import excel "data\excisedata.xlsx", sheet("Sheet1") firstrow
//sureg (qskm1 lskm1 lskm2 lspm1 lspm2 lskt1a lskt1b lskt2 lskt3) (qskm2 lskm1 lskm2 lspm1 lspm2 lskt1a lskt1b lskt2 lskt3)

// generate a bunch of stuff

/// Monthly SKM,SPM,SKT

gen qskm=qskm1+qskm2
gen qspm=qspm1+qspm2
gen qskt=qskt1a+qskt1b+qskt2+qskt3
gen qqq=qskm+qspm+qskt

gen rskm=rskm1+rskm2
gen rspm=rspm1+rspm2
gen rskt=rskt1a+rskt1b+rskt2+rskt3
gen rrr=rskm+rspm+rskt

gen tskm=(tskm1*qskm1+tskm2*qskm2)/qskm
gen tspm=(tspm1*qspm1+tspm2*qspm2)/qspm
gen tskt=(tskt1a*qskt1a+tskt2*qskt2+tskt1b*qskt1b+tskt3*qskt3)/qskt

gen lskm=(lskm1*qskm1+lskm2*qskm2)/qskm
gen lspm=(lspm1*qspm1+lspm2*qspm2)/qspm
gen lskt=(lskt1a*qskt1a+lskt2*qskt2+lskt1b*qskt1b+lskt3*qskt3)/qskt

gen pskm=(pskm1*qskm1+pskm2*qskm2)/qskm
gen pspm=(pspm1*qspm1+pspm2*qspm2)/qspm
gen pskt=(pskt1a*qskt1a+pskt2*qskt2+pskt1b*qskt1b+pskt3*qskt3)/qskt

gen plskm=pskm/lskm
gen plspm=pspm/lspm
gen plskt=pskt/lskt

gen plskm1=pskm1/lskm1
gen plskm2=pskm2/lskm2
gen plspm1=pspm1/lspm1
gen plspm2=pspm2/lspm2
gen plskt1a=pskt1a/lskt1a
gen plskt1b=pskt1b/lskt1b
gen plskt2=pskt2/lskt2
gen plskt3=pskt3/lskt3

// ad-valorem equivalent + weighted average for 3 types
gen askm1=tskm1/lskm1
gen askm2=tskm2/lskm2
gen aspm1=tspm1/lspm1
gen aspm2=tskm2/lskm2
gen askt1a=tskt1a/lskt1a
gen askt1b=tskt1b/lskt1b
gen askt2=tskt2/lskt2
gen askt3=tskt3/lskt3

gen askm=(askm1*qskm1+askm2*qskm2)/qskm
gen aspm=(aspm1*qspm1+aspm2*qspm2)/qspm
gen askt=(askt1a*qskt1a+askt2*qskt2+askt1b*qskt1b+askt3*qskt3)/qskt

// graphing 7 stuff

twoway (line qskm qspm qskt mo), legend(pos(6) col(4)) name(q4, replace) scheme(s1rcolor)
twoway (line qskm1 qskm2 mo), legend(pos(6) col(4)) name(q1, replace) scheme(s1rcolor)
twoway (line qspm1 qspm2 mo), legend(pos(6) col(4)) name(q2, replace) scheme(s1rcolor)
twoway (line qskt1a qskt1b qskt2 qskt3 mo), legend(pos(6) col(4)) name(q3,replace) scheme(s1rcolor)

graph combine q1 q2 q3 q4, col(2) ysize(6) xsize(9) scheme(s1rcolor)

graph export "pic/demand.png", as(png) name("Graph") replace

// graphing the revenue pattern

twoway (line rskm rspm rskt mo), legend(pos(6) col(4)) name(r4, replace) scheme(s1rcolor)
twoway (line rskm1 rskm2 mo), legend(pos(6) col(4)) name(r1, replace) scheme(s1rcolor)
twoway (line rspm1 rspm2 mo), legend(pos(6) col(4)) name(r2, replace) scheme(s1rcolor)
twoway (line rskt1a rskt1b rskt2 rskt3 mo), legend(pos(6) col(4)) name(r3,replace) scheme(s1rcolor)

graph combine r1 r2 r3 r4, col(2) ysize(6) xsize(9) scheme(s1rcolor)

graph export "pic/revenue.png", as(png) name("Graph") replace

// graphing the HJE aka the legal price

twoway (line lskm lspm lskt mo), legend(pos(6) col(4)) name(l4, replace) scheme(s1rcolor)
twoway (line lskm1 lskm2 mo), legend(pos(6) col(4)) name(l1, replace) scheme(s1rcolor)
twoway (line lspm1 lspm2 mo), legend(pos(6) col(4)) name(l2, replace) scheme(s1rcolor)
twoway (line lskt1a lskt1b lskt2 lskt3 mo), legend(pos(6) col(4)) name(l3,replace) scheme(s1rcolor)

graph combine l1 l2 l3 l4, col(2) ysize(6) xsize(9) scheme(s1rcolor)

graph export "pic/hje.png", as(png) name("Graph") replace

// graphing the HTP aka the market price (note that its has plenty missing spaces)

twoway (line pskm pspm pskt mo), legend(pos(6) col(4)) name(p4, replace) scheme(s1rcolor)
twoway (line pskm1 pskm2 mo), legend(pos(6) col(4)) name(p1, replace) scheme(s1rcolor)
twoway (line pspm1 pspm2 mo), legend(pos(6) col(4)) name(p2, replace) scheme(s1rcolor)
twoway (line pskt1a pskt1b pskt2 pskt3 mo), legend(pos(6) col(4)) name(p3,replace) scheme(s1rcolor)

graph combine p1 p2 p3 p4, col(2) ysize(6) xsize(9) scheme(s1rcolor)

graph export "pic/htp.png", as(png) name("Graph") replace

twoway (line tskm tspm tskt mo), legend(pos(6) col(4)) name(t4, replace) scheme(s1rcolor)
twoway (line tskm1 tskm2 mo), legend(pos(6) col(4)) name(t1, replace) scheme(s1rcolor)
twoway (line tspm1 tspm2 mo), legend(pos(6) col(4)) name(t2, replace) scheme(s1rcolor)
twoway (line tskt1a tskt1b tskt2 tskt3 mo), legend(pos(6) col(4)) name(t3,replace) scheme(s1rcolor)

graph combine t1 t2 t3 t4, col(2) ysize(6) xsize(9) scheme(s1rcolor)

graph export "pic/tariff.png", as(png) name("Graph") replace


twoway (line askm aspm askt mo), legend(pos(6) col(4)) name(a4, replace) scheme(s1rcolor)
twoway (line askm1 askm2 mo), legend(pos(6) col(4)) name(a1, replace) scheme(s1rcolor)
twoway (line aspm1 aspm2 mo), legend(pos(6) col(4)) name(a2, replace) scheme(s1rcolor)
twoway (line askt1a askt1b askt2 askt3 mo), legend(pos(6) col(4)) name(a3,replace) scheme(s1rcolor)

graph combine a1 a2 a3 a4, col(2) ysize(6) xsize(9) scheme(s1rcolor)

graph export "pic/ave.png", as(png) name("Graph") replace

// graphing the HTP/HJE aka the market/legal price ratio (note that its has plenty missing spaces)
// this graph shows how hard it is to try to estimate HTP based on HJE

twoway (line plskm plspm plskt mo), legend(pos(6) col(4)) name(pl4, replace) scheme(s1rcolor)
twoway (line plskm1 plskm2 mo), legend(pos(6) col(4)) name(pl1, replace) scheme(s1rcolor)
twoway (line plspm1 plspm2 mo), legend(pos(6) col(4)) name(pl2, replace) scheme(s1rcolor)
twoway (line plskt1a plskt1b plskt2 plskt3 mo), legend(pos(6) col(4)) name(pl3,replace) scheme(s1rcolor)

graph combine pl1 pl2 pl3 pl4, col(2) ysize(6) xsize(9) scheme(s1rcolor)

graph export "pic/htphje.png", as(png) name("Graph") replace



