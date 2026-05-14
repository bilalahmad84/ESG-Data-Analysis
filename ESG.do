 
* generaing variable for matched variable for analysis
encode _merge, gen(coded)
* Keeping the matched data for analysis
keep if coded == 2
* Formatting year variable
format year %ty
** Setting up the data as panel data ( I converted the SEDOL to a numeric variable as stata does not 
declare string variable as panel)
encode SEDOL, gen(sedol)
xtset sedol year
* Handling missing values of RDExpense as there are signficant missing values in this variable
summarize RDExpense, meanonly
replace RDExpense = r(mean) if missing(RDExpense)
* summary statistics
summarize esg ccsir_ pcc_ IDV UAI gdp_per_capita population_growth Firmsize Leverage RDExpense
* Correlation
correlate esg ccsir_ pcc_ IDV UAI gdp_per_capita population_growth Firmsize Leverage ROA RDExpense
* ICB Industry observations
tab ICBindustryname
* Country observations
tab COUNTRY 
* annova of esg score with country
anova esg country_num
** Normality test: histrogram of standardized residuals of ESG score
* Perform ANOVA and save the residuals
anova esg country_num
predict res, residuals
* Calculate the standardized residuals
egen mean_res = mean(res)
egen sd_res = sd(res)
gen std_res = (res - mean_res) / sd_res
* Plot the histogram of standardized residuals
histogram std_res, normal
* Normality test: normal P-P plot of standardized residuals of ESG score
* Sort the standardized residuals
sort std_res
* Generate expected normal values
gen p = ( _n - 0.5) / _N
gen norm_inv = invnormal(p)
* Create the P-P plot
twoway scatter std_res norm_inv || line norm_inv norm_inv, legend(off)
* Homoscedasticity test: scatterplot of standardized residuals against predicted values 
* Perform ANOVA and save the residuals and predicted values
anova esg country_num
predict res, residuals
predict pred, xb
* Calculate the standardized residuals
egen mean_res = mean(res)
egen sd_res = sd(res)
gen std_res = (res - mean_res) / sd_res
* Plot the scatterplot of standardized residuals against predicted values
scatter std_res pred, yline(0)
* Regression with only control variables ( First I will lag variables and run random effects and fixed 
effects regression and run the hausman test)
* Sort the data by panel identifier and year
sort sedol year
* Create lagged variables
by sedol: gen gdp_per_capita_lag1 = L1.gdp_per_capita
by sedol: gen population_growth_lag1 = L1.population_growth
by sedol: gen Firmsize_lag1 = L1.Firmsize
by sedol: gen Leverage_lag1 = L1.Leverage
by sedol: gen ROA_lag1 = L1.ROA
by sedol: gen RDExpense_lag1 = L1.RDExpense
xtreg esg gdp_per_capita_lag1 population_growth_lag1 Firmsize_lag1 Leverage_lag1 ROA_lag1 
RDExpense_lag1 industry_name, re
est store re
xtreg esg gdp_per_capita_lag1 population_growth_lag1 Firmsize_lag1 Leverage_lag1 ROA_lag1 
RDExpense_lag1 industry_name, fe
est store fe
hausman fe re
** ///// The results of hausman test revealed that we should be using fixed effect model for our 
regression with control variables. 
xtreg esg ccsir_lag1 pcc_lag1 IDV_lag1 UAI_lag1 gdp_per_capita_lag1 population_growth_lag1 Firmsize_lag1 
Leverage_lag1 ROA_lag1 RDExpense_lag1, fe
xtreg esg i.industry_name, be
* Creating lagged variable for independent variables and moderators to run the second regression
sort sedol year
by sedol: gen ccsir_lag1 = L1.ccsir_
by sedol: gen pcc_lag1 = L1.pcc_
by sedol: gen IDV_lag1 = L1.IDV
by sedol: gen UAI_lag1 = L1.UAI
xtreg esg ccsir_lag1 UAI_lag1 IDV_lag1 pcc_lag1 gdp_per_capita_lag1 population_growth_lag1 Firmsize_lag1 
Leverage_lag1 ROA_lag1 RDExpense_lag1 industry_name,fe
est store fe
xtreg esg ccsir_lag1 UAI_lag1 IDV_lag1 pcc_lag1 gdp_per_capita_lag1 population_growth_lag1 Firmsize_lag1 
Leverage_lag1 ROA_lag1 RDExpense_lag1 industry_name,re
est store re
hausman fe re
* running regression based on hausman test
xtreg esg ccsir_lag1 UAI_lag1 IDV_lag1 pcc_lag1 gdp_per_capita_lag1 population_growth_lag1 Firmsize_lag1 
Leverage_lag1 ROA_lag1 RDExpense_lag1,fe
xtreg esg i.industry_name, be