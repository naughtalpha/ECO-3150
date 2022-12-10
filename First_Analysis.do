*==============================================================================*
*Term Paper DO File

*Connor Naughton


*==============================================================================*
import excel "https://github.com/naughtalpha/ECO-3150/blob/main/Term_Paper_Data_5.xlsx?raw=true", ///
		firstrow clear
		
label variable States "50 US States"
label variable Poverty "Poverty Rate (%)"
label variable MINWAGE "Minimum Wage ($)"
label variable LABPART "Labor Participation Rate (%)"
label variable INCCAP "Income Per Capita ($)"
label variable UNRATE "Unemployment Rate (%)"
label variable EDGDP "Real GDP: Educational Services ($)"


set scheme s1color

format EDGDP %9.2fc

*Correlation matrix

correlate 
*Do a scater for every variable against the dependent variable for appendix*
twoway scatter Poverty MINWAGE, ///
	   title("Poverty and Minimum Wage") ///
	   xlabel(, grid) ylabel(, grid) ///
	 ||lfit Poverty MINWAGE, ///
	   lcolor(green%50)
	   
twoway scatter Poverty LABPART, ///
	   title("Poverty and Labor Participation") ///
	   xlabel(, grid) ylabel(, grid) ///
	 ||lfit Poverty LABPART, ///
	   lcolor(green%50)
	   
twoway scatter Poverty INCCAP, ///
	   title("Poverty and Income Per Capita") ///
	   xlabel(, grid) ylabel(, grid) ///
	 ||lfit Poverty INCCAP, ///
	   lcolor(green%50)	
	   
twoway scatter Poverty UNRATE, ///
	   title("Poverty and Unemployment Rate") ///
	   xlabel(, grid) ylabel(, grid) ///
	 ||lfit Poverty UNRATE, ///
	   lcolor(green%50)	
	   
twoway scatter Poverty EDGDP, ///
	   title("Poverty and GDP: Educational Services") ///
	   xlabel(, grid) ylabel(, grid) ///
	 ||lfit Poverty INCCAP, ///
	   lcolor(green%50)	

	   
regress Poverty MINWAGE

*Regressions 


*Model 1
regress Poverty MINWAGE /// add unemployment rate, Labor participation rate
*Income per capita, MAYBE educational services ///
estat ic
vif
*Model 2


*Model 3
regress Poverty MINWAGE UNRATE LABPART INCAP EDGDP
estat ic
vif


quietly regress Poverty MINWAGE EDGDP
predict resid1, residuals
label variable resid1 "Residuals (Model 1)"
estimates store M1, title (Model 1)

quietly regress Poverty MINWAGE
predict resid2, residuals
label variable resid2 "Residuals (Model 2)"
estimates store M2, title (Model 2)

quietly regress Poverty EDGDP
predict resid3, residuals
label variable resid3 "Residuals (Model 3)"
estimates store M3, title (Model 3)

quietly regress Poverty 
predict resid3, residuals
label variable resid3 "Residuals (Model 3)"
estimates store M3, title (Model 3)




correl Poverty MINWAGE EDGDP 

graph matrix Poverty EDGDP

summarize Poverty MINWAGE EDGDP 
summarize Poverty MINWAGE EDGDP, format 

correlate

no solution explain whats happenes

	   
	   
quietly regress Poverty MINWAGE EDGDP
predict resid1, residuals
label variable resid1 "Residuals (Model 1)"
estimates store M1, title (Model 1)

quietly regress Poverty MINWAGE
predict resid2, residuals
label variable resid2 "Residuals (Model 2)"
estimates store M2, title (Model 2)

quietly regress Poverty EDGDP
predict resid3, residuals
label variable resid3 "Residuals (Model 3)"
estimates store M3, title (Model 3)


twoway scatter resid1 Poverty, ///
	   mcolor(blue%50) ///
	   yline(0, lcolor(black)) ///
	|| scatter resid2 Poverty, ///
	   mcolor(red%50) ///
	|| scatter resid3 Poverty, ///
	   mcolor(gray%50) ///
	   legend(rows(1) size(small))
	   
	   
regress Poverty MINWAGE 



