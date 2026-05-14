 # 📊 ESG Data Analysis — Panel Data Econometric Study

> A structured panel data econometric analysis investigating the determinants of
> **ESG (Environmental, Social, and Governance)** performance across firms and countries.
> Conducted as an independent consultancy project.

---

## 📋 Project Overview

This project applies rigorous **panel data econometric techniques** in Stata to examine
what drives ESG performance across firms and institutional contexts. The analysis covers
firm-level, macroeconomic, and cultural determinants of ESG scores, using fixed and random
effects models with robust diagnostic testing.

---

## 🎯 Research Objectives

- Investigate **determinants of ESG performance** across firms and countries
- Examine the role of **cultural dimensions** (individualism, uncertainty avoidance)
- Assess the impact of **firm characteristics** (size, leverage, profitability, R&D)
- Evaluate **macroeconomic factors** (GDP per capita, population growth)
- Apply **panel data econometrics** with rigorous model selection and diagnostics

---

## 🔬 Research Design

| Component | Detail |
|-----------|--------|
| **Study Type** | Panel data econometric analysis |
| **Outcome Variable** | ESG score |
| **Key Explanatory Variables** | CSR indicators, cultural dimensions (IDV, UAI) |
| **Control Variables** | Firm size, leverage, ROA, R&D expenditure, GDP per capita, population growth |
| **Statistical Methods** | Fixed effects, random effects, Hausman test, ANOVA, correlation, marginal effects |
| **Software** | Stata |

---

## 🛠️ Analytical Workflow

### 1. 📥 Data Preparation & Cleaning
- Excluded selected countries to maintain sample comparability
- Retained only matched observations from merged datasets
- Converted SEDOL codes to numeric format for panel data setup
- Declared dataset as panel data using firm-year structure (`xtset`)

### 2. 🔧 Handling Missing Data
- Addressed missing values in **R&D expenditure** through mean imputation
- Preserved sample size while maintaining data integrity

### 3. 📊 Descriptive Statistics & Diagnostics
- Summary statistics and correlation matrices for all key variables
- Industry and country-level distributions
- **ANOVA** to assess ESG score differences across countries

### 4. 🔍 Regression Diagnostics
- **Normality check** — histogram and P-P plot of standardized residuals
- **Homoscedasticity check** — residual vs fitted value scatter plots
- Ensured all key regression assumptions were evaluated

### 5. ⏳ Lag Structure for Endogeneity
- Generated lagged independent and control variables
- Addressed potential **endogeneity and temporal ordering** issues

### 6. 📐 Model Selection
- Estimated both **fixed effects** and **random effects** panel regressions
- Applied **Hausman specification test** — results confirmed preference for fixed effects model

### 7. 📈 Final Regressions
- Fixed effects regression with core explanatory variables and controls
- Industry effects examined using **between-effects models**
- Produced reliable and policy-relevant insights into ESG drivers

---

## 📌 Key Variables

| Variable | Description |
|----------|-------------|
| `esg` | ESG performance score (outcome) |
| `ccsir_` | CSR-related indicator |
| `pcc_` | CSR indicator |
| `IDV` | Cultural dimension — Individualism |
| `UAI` | Cultural dimension — Uncertainty Avoidance |
| `gdp_per_capita` | Macroeconomic control |
| `population_growth` | Macroeconomic control |
| `Firmsize` | Firm-level control |
| `Leverage` | Firm-level control |
| `ROA` | Return on assets — profitability |
| `RDExpense` | R&D expenditure |

---

## 📁 Repository Structure
