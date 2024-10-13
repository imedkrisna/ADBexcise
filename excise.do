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



// graphing the demand pattern

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

// graphing the HTP/HJE aka the market/legal price ratio (note that its has plenty missing spaces)
// this graph shows how hard it is to try to estimate HTP based on HJE

twoway (line plskm plspm plskt mo), legend(pos(6) col(4)) name(pl4, replace) scheme(s1rcolor)
twoway (line plskm1 plskm2 mo), legend(pos(6) col(4)) name(pl1, replace) scheme(s1rcolor)
twoway (line plspm1 plspm2 mo), legend(pos(6) col(4)) name(pl2, replace) scheme(s1rcolor)
twoway (line plskt1a plskt1b plskt2 plskt3 mo), legend(pos(6) col(4)) name(pl3,replace) scheme(s1rcolor)

graph combine pl1 pl2 pl3 pl4, col(2) ysize(6) xsize(9) scheme(s1rcolor)

graph export "pic/htphje.png", as(png) name("Graph") replace

twoway (area qskm mo,sort) \\\ 
		(area qspm mo, sort) \\\
		(area qskt mo,sort)

