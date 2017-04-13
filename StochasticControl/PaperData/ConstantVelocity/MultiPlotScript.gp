#GNUPLOT script to plot constant velocity ensemble results
#Steven Large
#April 10th 2017
set term postscript landscape color enhanced lw 2 "Times-Roman,22"
set output "constVelocityMulti.ps"
set border lw 0.5
set style data l
set logscale y
set logscale x
set style circle radius graph 0.01

set format y "10^%T"
set format x "10^%T"

set xrange [1:500]
set yrange [100:40000]

unset key
set key off

POS = "at graph 0.15,0.85 font 'Helvetica'"

#TMARGIN = "set tmargin at screen 0.95; set bmargin at screen 0.575"
#BMARGIN = "set tmargin at screen 0.525; set bmargin at screen 0.15"
#LMARGIN = "set lmargin at screen 0.125; set rmargin at screen 0.525"
#RMARGIN = "set lmargin at screen 0.575; set rmargin at screen 0.975"

TLMARGIN = "set tmargin at screen 0.95; set bmargin at screen 0.6834; set lmargin at screen 0.125; set rmargin at screen 0.4083"
TMMARGIN = "set tmargin at screen 0.95; set bmargin at screen 0.6834; set lmargin at screen 0.4083; set rmargin at screen 0.6916"
TRMARGIN = "set tmargin at screen 0.95; set bmargin at screen 0.6834; set lmargin at screen 0.6916; set rmargin at screen 0.975"

MLMARGIN = "set tmargin at screen 0.6834; set bmargin at screen 0.4167; set lmargin at screen 0.125; set rmargin at screen 0.4083"
MMMARGIN = "set tmargin at screen 0.6834; set bmargin at screen 0.4167; set lmargin at screen 0.4083; set rmargin at screen 0.6916"
MRMARGIN = "set tmargin at screen 0.6834; set bmargin at screen 0.4167; set lmargin at screen 0.6916; set rmargin at screen 0.975"

BLMARGIN = "set tmargin at screen 0.4167; set bmargin at screen 0.15; set lmargin at screen 0.125; set rmargin at screen 0.4083"
BMMARGIN = "set tmargin at screen 0.4167; set bmargin at screen 0.15; set lmargin at screen 0.4083; set rmargin at screen 0.6916"
BRMARGIN = "set tmargin at screen 0.4167; set bmargin at screen 0.15; set lmargin at screen 0.6916; set rmargin at screen 0.975"

#NOYTICS = "set ytics 10000000; unset ylabel"
#NOXTICS = "set xtics 10000000; unset xlabel"

NOYTICS = "unset ytics; unset ylabel"
NOXTICS = "unset xtics; unset xlabel"

XTICS = "set xtics 10"
YTICS = "set ytics 10"

set label 3 "ProtocolTime (s)" at screen 0.45, 0.02
set label 4 "Work (units of k_BT)" at screen 0.01, 0.4 rotate by 90

set multiplot layout 3,3 rowsfirst

#set label 1 'a' @POS
#@TMARGIN; @LMARGIN
@TLMARGIN
@NOXTICS; @YTICS
plot "SimulationData/WorkTotal_L20_k1_05.dat" with circles lc rgb "blue" fs transparent solid 0.5 noborder, \
	 "SimulationData/WorkTotal_L20_k1_1.dat" with circles lc rgb "green" fs transparent solid 0.5 noborder, \
	 "SimulationData/WorkTotal_L20_k1_2.dat" with circles lc rgb "orange" fs transparent solid 0.5 noborder, \
	 "SimulationData/WorkTotal_L20_k1_4.dat" with circles lc rgb "red" fs transparent solid 0.5 noborder, \
	 "SimulationData/WorkTotal_L20_k1_8.dat" with circles lc rgb "purple" fs transparent solid 0.5 noborder, \
	 "WorkTheory/WorkTotalExact_20_k1_Var_0.5.dat" with line lt "dashed" lw 1.5 lc rgb "blue", \
	 "WorkTheory/WorkTotalExact_20_k1_Var_1.dat" with line lt "dashed" lw 1.5 lc rgb "green", \
	 "WorkTheory/WorkTotalExact_20_k1_Var_2.dat" with line lt "dashed" lw 1.5 lc rgb "orange", \
	 "WorkTheory/WorkTotalExact_20_k1_Var_4.dat" with line lt "dashed" lw 1.5 lc rgb "red", \
	 "WorkTheory/WorkTotalExact_20_k1_Var_8.dat" with line lt "dashed" lw 1.5 lc rgb "purple", \
	 "WorkTheory/WorkTotalTheory_20_k1_Var_0.5.dat" with line lt 1 lw 1.5 lc rgb "blue", \
	 "WorkTheory/WorkTotalTheory_20_k1_Var_1.dat" with line lt 1 lw 1.5 lc rgb "green", \
	 "WorkTheory/WorkTotalTheory_20_k1_Var_2.dat" with line lt 1 lw 1.5 lc rgb "orange", \
	 "WorkTheory/WorkTotalTheory_20_k1_Var_4.dat" with line lt 1 lw 1.5 lc rgb "red", \
	 "WorkTheory/WorkTotalTheory_20_k1_Var_8.dat" with line lt 1 lw 1.5 lc rgb "purple"

#set label 1 'b' @POS
#@TMARGIN; @RMARGIN
@TMMARGIN
@NOYTICS; @NOXTICS
plot "SimulationData/WorkTotal_L20_k2_05.dat" with circles lc rgb "blue" fs transparent solid 0.5 noborder, \
	 "SimulationData/WorkTotal_L20_k2_1.dat" with circles lc rgb "green" fs transparent solid 0.5 noborder, \
	 "SimulationData/WorkTotal_L20_k2_2.dat" with circles lc rgb "orange" fs transparent solid 0.5 noborder, \
	 "SimulationData/WorkTotal_L20_k2_4.dat" with circles lc rgb "red" fs transparent solid 0.5 noborder, \
	 "SimulationData/WorkTotal_L20_k2_8.dat" with circles lc rgb "purple" fs transparent solid 0.5 noborder, \
	 "WorkTheory/WorkTotalExact_20_k2_Var_0.5.dat" with line lt "dashed" lw 1.5 lc rgb "blue", \
	 "WorkTheory/WorkTotalExact_20_k2_Var_1.dat" with line lt "dashed" lw 1.5 lc rgb "green", \
	 "WorkTheory/WorkTotalExact_20_k2_Var_2.dat" with line lt "dashed" lw 1.5 lc rgb "orange", \
	 "WorkTheory/WorkTotalExact_20_k2_Var_4.dat" with line lt "dashed" lw 1.5 lc rgb "red", \
	 "WorkTheory/WorkTotalExact_20_k2_Var_8.dat" with line lt "dashed" lw 1.5 lc rgb "purple" ,\
	 "WorkTheory/WorkTotalTheory_20_k2_Var_0.5.dat" with line lt 1 lw 1.5 lc rgb "blue", \
	 "WorkTheory/WorkTotalTheory_20_k2_Var_1.dat" with line lt 1 lw 1.5 lc rgb "green", \
	 "WorkTheory/WorkTotalTheory_20_k2_Var_2.dat" with line lt 1 lw 1.5 lc rgb "orange", \
	 "WorkTheory/WorkTotalTheory_20_k2_Var_4.dat" with line lt 1 lw 1.5 lc rgb "red", \
	 "WorkTheory/WorkTotalTheory_20_k2_Var_8.dat" with line lt 1 lw 1.5 lc rgb "purple"


#set label 1 'c' @POS
#@TMARGIN; @RMARGIN
@TRMARGIN
@NOYTICS; @NOXTICS
plot "SimulationData/WorkTotal_L20_k4_05.dat" with circles lc rgb "blue" fs transparent solid 0.5 noborder, \
	 "SimulationData/WorkTotal_L20_k4_1.dat" with circles lc rgb "green" fs transparent solid 0.5 noborder, \
	 "SimulationData/WorkTotal_L20_k4_2.dat" with circles lc rgb "orange" fs transparent solid 0.5 noborder, \
	 "SimulationData/WorkTotal_L20_k4_4.dat" with circles lc rgb "red" fs transparent solid 0.5 noborder, \
	 "SimulationData/WorkTotal_L20_k4_8.dat" with circles lc rgb "purple" fs transparent solid 0.5 noborder, \
	 "WorkTheory/WorkTotalExact_20_k4_Var_0.5.dat" with line lt "dashed" lw 1.5 lc rgb "blue", \
	 "WorkTheory/WorkTotalExact_20_k4_Var_1.dat" with line lt "dashed" lw 1.5 lc rgb "green", \
	 "WorkTheory/WorkTotalExact_20_k4_Var_2.dat" with line lt "dashed" lw 1.5 lc rgb "orange", \
	 "WorkTheory/WorkTotalExact_20_k4_Var_4.dat" with line lt "dashed" lw 1.5 lc rgb "red", \
	 "WorkTheory/WorkTotalExact_20_k4_Var_8.dat" with line lt "dashed" lw 1.5 lc rgb "purple", \
	 "WorkTheory/WorkTotalTheory_20_k4_Var_0.5.dat" with line lt 1 lw 1.5 lc rgb "blue", \
	 "WorkTheory/WorkTotalTheory_20_k4_Var_1.dat" with line lt 1 lw 1.5 lc rgb "green", \
	 "WorkTheory/WorkTotalTheory_20_k4_Var_2.dat" with line lt 1 lw 1.5 lc rgb "orange", \
	 "WorkTheory/WorkTotalTheory_20_k4_Var_4.dat" with line lt 1 lw 1.5 lc rgb "red", \
	 "WorkTheory/WorkTotalTheory_20_k4_Var_8.dat" with line lt 1 lw 1.5 lc rgb "purple"

#set label 1 'd' @POS
#@BMARGIN; @LMARGIN
@MLMARGIN
@NOXTICS; @YTICS
plot "SimulationData/WorkTotal_L40_k1_05.dat" with circles lc rgb "blue" fs transparent solid 0.5 noborder, \
	 "SimulationData/WorkTotal_L40_k1_1.dat" with circles lc rgb "green" fs transparent solid 0.5 noborder, \
	 "SimulationData/WorkTotal_L40_k1_2.dat" with circles lc rgb "orange" fs transparent solid 0.5 noborder, \
	 "SimulationData/WorkTotal_L40_k1_4.dat" with circles lc rgb "red" fs transparent solid 0.5 noborder, \
	 "SimulationData/WorkTotal_L40_k1_8.dat" with circles lc rgb "purple" fs transparent solid 0.5 noborder,\
	 "WorkTheory/WorkTotalExact_40_k1_Var_0.5.dat" with line lt "dashed" lw 1.5 lc rgb "blue", \
	 "WorkTheory/WorkTotalExact_40_k1_Var_1.dat" with line lt "dashed" lw 1.5 lc rgb "green", \
	 "WorkTheory/WorkTotalExact_40_k1_Var_2.dat" with line lt "dashed" lw 1.5 lc rgb "orange", \
	 "WorkTheory/WorkTotalExact_40_k1_Var_4.dat" with line lt "dashed" lw 1.5 lc rgb "red", \
	 "WorkTheory/WorkTotalExact_40_k1_Var_8.dat" with line lt "dashed" lw 1.5 lc rgb "purple", \
	 "WorkTheory/WorkTotalTheory_40_k1_Var_0.5.dat" with line lt 1 lw 1.5 lc rgb "blue", \
	 "WorkTheory/WorkTotalTheory_40_k1_Var_1.dat" with line lt 1 lw 1.5 lc rgb "green", \
	 "WorkTheory/WorkTotalTheory_40_k1_Var_2.dat" with line lt 1 lw 1.5 lc rgb "orange", \
	 "WorkTheory/WorkTotalTheory_40_k1_Var_4.dat" with line lt 1 lw 1.5 lc rgb "red", \
	 "WorkTheory/WorkTotalTheory_40_k1_Var_8.dat" with line lt 1 lw 1.5 lc rgb "purple"

#set label 1 'e' @POS
#@BMARGIN; @RMARGIN
@MMMARGIN
@NOYTICS; @NOXTICS
plot "SimulationData/WorkTotal_L40_k2_05.dat" with circles lc rgb "blue" fs transparent solid 0.5 noborder, \
	 "SimulationData/WorkTotal_L40_k2_1.dat" with circles lc rgb "green" fs transparent solid 0.5 noborder, \
	 "SimulationData/WorkTotal_L40_k2_2.dat" with circles lc rgb "orange" fs transparent solid 0.5 noborder, \
	 "SimulationData/WorkTotal_L40_k2_4.dat" with circles lc rgb "red" fs transparent solid 0.5 noborder, \
	 "SimulationData/WorkTotal_L40_k2_8.dat" with circles lc rgb "purple" fs transparent solid 0.5 noborder,\
	 "WorkTheory/WorkTotalExact_40_k2_Var_0.5.dat" with line lt "dashed" lw 1.5 lc rgb "blue", \
	 "WorkTheory/WorkTotalExact_40_k2_Var_1.dat" with line lt "dashed" lw 1.5 lc rgb "green", \
	 "WorkTheory/WorkTotalExact_40_k2_Var_2.dat" with line lt "dashed" lw 1.5 lc rgb "orange", \
	 "WorkTheory/WorkTotalExact_40_k2_Var_4.dat" with line lt "dashed" lw 1.5 lc rgb "red", \
	 "WorkTheory/WorkTotalExact_40_k2_Var_8.dat" with line lt "dashed" lw 1.5 lc rgb "purple", \
	 "WorkTheory/WorkTotalTheory_40_k2_Var_0.5.dat" with line lt 1 lw 1.5 lc rgb "blue", \
	 "WorkTheory/WorkTotalTheory_40_k2_Var_1.dat" with line lt 1 lw 1.5 lc rgb "green", \
	 "WorkTheory/WorkTotalTheory_40_k2_Var_2.dat" with line lt 1 lw 1.5 lc rgb "orange", \
	 "WorkTheory/WorkTotalTheory_40_k2_Var_4.dat" with line lt 1 lw 1.5 lc rgb "red", \
	 "WorkTheory/WorkTotalTheory_40_k2_Var_8.dat" with line lt 1 lw 1.5 lc rgb "purple"


#set label 1 'f' @POS
#@BMARGIN; @RMARGIN
@MRMARGIN
@NOYTICS; @NOXTICS
plot "SimulationData/WorkTotal_L40_k4_05.dat" with circles lc rgb "blue" fs transparent solid 0.5 noborder, \
	 "SimulationData/WorkTotal_L40_k4_1.dat" with circles lc rgb "green" fs transparent solid 0.5 noborder, \
	 "SimulationData/WorkTotal_L40_k4_2.dat" with circles lc rgb "orange" fs transparent solid 0.5 noborder, \
	 "SimulationData/WorkTotal_L40_k4_4.dat" with circles lc rgb "red" fs transparent solid 0.5 noborder, \
	 "SimulationData/WorkTotal_L40_k4_8.dat" with circles lc rgb "purple" fs transparent solid 0.5 noborder, \
	 "WorkTheory/WorkTotalExact_40_k4_Var_0.5.dat" with line lt "dashed" lw 1.5 lc rgb "blue", \
	 "WorkTheory/WorkTotalExact_40_k4_Var_1.dat" with line lt "dashed" lw 1.5 lc rgb "green", \
	 "WorkTheory/WorkTotalExact_40_k4_Var_2.dat" with line lt "dashed" lw 1.5 lc rgb "orange", \
	 "WorkTheory/WorkTotalExact_40_k4_Var_4.dat" with line lt "dashed" lw 1.5 lc rgb "red", \
	 "WorkTheory/WorkTotalExact_40_k4_Var_8.dat" with line lt "dashed" lw 1.5 lc rgb "purple", \
	 "WorkTheory/WorkTotalTheory_40_k4_Var_0.5.dat" with line lt 1 lw 1.5 lc rgb "blue", \
	 "WorkTheory/WorkTotalTheory_40_k4_Var_1.dat" with line lt 1 lw 1.5 lc rgb "green", \
	 "WorkTheory/WorkTotalTheory_40_k4_Var_2.dat" with line lt 1 lw 1.5 lc rgb "orange", \
	 "WorkTheory/WorkTotalTheory_40_k4_Var_4.dat" with line lt 1 lw 1.5 lc rgb "red", \
	 "WorkTheory/WorkTotalTheory_40_k4_Var_8.dat" with line lt 1 lw 1.5 lc rgb "purple"	 


#set label 1 'g' @POS
#@BMARGIN; @RMARGIN
@BLMARGIN
@YTICS; @XTICS
plot "SimulationData/WorkTotal_L80_k1_05.dat" with circles lc rgb "blue" fs transparent solid 0.5 noborder, \
	 "SimulationData/WorkTotal_L80_k1_1.dat" with circles lc rgb "green" fs transparent solid 0.5 noborder, \
	 "SimulationData/WorkTotal_L80_k1_2.dat" with circles lc rgb "orange" fs transparent solid 0.5 noborder, \
	 "SimulationData/WorkTotal_L80_k1_4.dat" with circles lc rgb "red" fs transparent solid 0.5 noborder, \
	 "SimulationData/WorkTotal_L80_k1_8.dat" with circles lc rgb "purple" fs transparent solid 0.5 noborder, \
	 "WorkTheory/WorkTotalExact_80_k1_Var_0.5.dat" with line lt "dashed" lw 1.5 lc rgb "blue", \
	 "WorkTheory/WorkTotalExact_80_k1_Var_1.dat" with line lt "dashed" lw 1.5 lc rgb "green", \
	 "WorkTheory/WorkTotalExact_80_k1_Var_2.dat" with line lt "dashed" lw 1.5 lc rgb "orange", \
	 "WorkTheory/WorkTotalExact_80_k1_Var_4.dat" with line lt "dashed" lw 1.5 lc rgb "red", \
	 "WorkTheory/WorkTotalExact_80_k1_Var_8.dat" with line lt "dashed" lw 1.5 lc rgb "purple",\
	 "WorkTheory/WorkTotalTheory_80_k1_Var_0.5.dat" with line lt 1 lw 1.5 lc rgb "blue", \
	 "WorkTheory/WorkTotalTheory_80_k1_Var_1.dat" with line lt 1 lw 1.5 lc rgb "green", \
	 "WorkTheory/WorkTotalTheory_80_k1_Var_2.dat" with line lt 1 lw 1.5 lc rgb "orange", \
	 "WorkTheory/WorkTotalTheory_80_k1_Var_4.dat" with line lt 1 lw 1.5 lc rgb "red", \
	 "WorkTheory/WorkTotalTheory_80_k1_Var_8.dat" with line lt 1 lw 1.5 lc rgb "purple"	 


#set label 1 'h' @POS
#@BMARGIN; @RMARGIN
@BMMARGIN
@NOYTICS; @XTICS
plot "SimulationData/WorkTotal_L80_k2_05.dat" with circles lc rgb "blue" fs transparent solid 0.5 noborder, \
	 "SimulationData/WorkTotal_L80_k2_1.dat" with circles lc rgb "green" fs transparent solid 0.5 noborder, \
	 "SimulationData/WorkTotal_L80_k2_2.dat" with circles lc rgb "orange" fs transparent solid 0.5 noborder, \
	 "SimulationData/WorkTotal_L80_k2_4.dat" with circles lc rgb "red" fs transparent solid 0.5 noborder, \
	 "SimulationData/WorkTotal_L80_k2_8.dat" with circles lc rgb "purple" fs transparent solid 0.5 noborder, \
	 "WorkTheory/WorkTotalExact_80_k2_Var_0.5.dat" with line lt "dashed" lw 1.5 lc rgb "blue", \
	 "WorkTheory/WorkTotalExact_80_k2_Var_1.dat" with line lt "dashed" lw 1.5 lc rgb "green", \
	 "WorkTheory/WorkTotalExact_80_k2_Var_2.dat" with line lt "dashed" lw 1.5 lc rgb "orange", \
	 "WorkTheory/WorkTotalExact_80_k2_Var_4.dat" with line lt "dashed" lw 1.5 lc rgb "red", \
	 "WorkTheory/WorkTotalExact_80_k2_Var_8.dat" with line lt "dashed" lw 1.5 lc rgb "purple", \
	 "WorkTheory/WorkTotalTheory_80_k2_Var_0.5.dat" with line lt 1 lw 1.5 lc rgb "blue", \
	 "WorkTheory/WorkTotalTheory_80_k2_Var_1.dat" with line lt 1 lw 1.5 lc rgb "green", \
	 "WorkTheory/WorkTotalTheory_80_k2_Var_2.dat" with line lt 1 lw 1.5 lc rgb "orange", \
	 "WorkTheory/WorkTotalTheory_80_k2_Var_4.dat" with line lt 1 lw 1.5 lc rgb "red", \
	 "WorkTheory/WorkTotalTheory_80_k2_Var_8.dat" with line lt 1 lw 1.5 lc rgb "purple"	 	 


#set label 1 'i' @POS
#@BMARGIN; @RMARGIN
@BRMARGIN
@NOYTICS; @XTICS
plot "SimulationData/WorkTotal_L80_k4_05.dat" with circles lc rgb "blue" fs transparent solid 0.5 noborder, \
	 "SimulationData/WorkTotal_L80_k4_1.dat" with circles lc rgb "green" fs transparent solid 0.5 noborder, \
	 "SimulationData/WorkTotal_L80_k4_2.dat" with circles lc rgb "orange" fs transparent solid 0.5 noborder, \
	 "SimulationData/WorkTotal_L80_k4_4.dat" with circles lc rgb "red" fs transparent solid 0.5 noborder, \
	 "SimulationData/WorkTotal_L80_k4_8.dat" with circles lc rgb "purple" fs transparent solid 0.5 noborder, \
	 "WorkTheory/WorkTotalExact_80_k4_Var_0.5.dat" with line lt "dashed" lw 1.5 lc rgb "blue", \
	 "WorkTheory/WorkTotalExact_80_k4_Var_1.dat" with line lt "dashed" lw 1.5 lc rgb "green", \
	 "WorkTheory/WorkTotalExact_80_k4_Var_2.dat" with line lt "dashed" lw 1.5 lc rgb "orange", \
	 "WorkTheory/WorkTotalExact_80_k4_Var_4.dat" with line lt "dashed" lw 1.5 lc rgb "red", \
	 "WorkTheory/WorkTotalExact_80_k4_Var_8.dat" with line lt "dashed" lw 1.5 lc rgb "purple", \
	 "WorkTheory/WorkTotalTheory_80_k4_Var_0.5.dat" with line lt 1 lw 1.5 lc rgb "blue", \
	 "WorkTheory/WorkTotalTheory_80_k4_Var_1.dat" with line lt 1 lw 1.5 lc rgb "green", \
	 "WorkTheory/WorkTotalTheory_80_k4_Var_2.dat" with line lt 1 lw 1.5 lc rgb "orange", \
	 "WorkTheory/WorkTotalTheory_80_k4_Var_4.dat" with line lt 1 lw 1.5 lc rgb "red", \
	 "WorkTheory/WorkTotalTheory_80_k4_Var_8.dat" with line lt 1 lw 1.5 lc rgb "purple"


unset multiplot

#plot "WorkTotal_05.dat" with circles lc rgb "blue" fs transparent solid 0.75 noborder, \
#	 "WorkTotal_1.dat" with circles lc rgb "purple" fs transparent solid 0.75 noborder, \
#     "WorkTotal_2.dat" with circles lc rgb "green" fs transparent solid 0.75 noborder, \
#     "WorkTotal_4.dat" with circles lc rgb "red" fs transparent solid 0.75 noborder, \
#     "WorkTotalExact_50_k1_Var_1.dat" with line lt 1 lw 3 lc rgb "#7029FF", \
#     "WorkTotalExact_50_k1_Var_0.5.dat" with line lt 1 lw 3 lc "#5252FF", \
#     "WorkTotalExact_50_k1_Var_2.dat" with line lt 1 lw 3 lc "#66FF99", \
#     "WorkTotalExact_50_k1_Var_4.dat" with line lt 1 lw 3 lc "#FF6699"

#set title "Constant Velocity Ensemble"
#set xlabel "Protocol Time, (s)"
#set ylabel "Work, (units of k_BT)"

pause -1 "Hit any key to continue..."