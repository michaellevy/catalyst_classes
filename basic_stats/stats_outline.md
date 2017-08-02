**Caveats Slide**


`load()`

## Summary statistics

Functions:

- mean, median, mode
- sd, var, mad
- rsd

Plot density curve with vlines

**NHST Slide**

## t-tests

- One sample
	- Null: Average age is 50
	- Plot
	- t.test
	- alternative
	- p-value
	- Confidence interval

- Two sample
	- Null: Sexes come in at same age
	- Plot
	- t.test two vectors
	- t.test formula

**Exercise: Difference Between Groups**

## ANOVA for > 2 categories

- `aov(cholesterol ~ ECG)`
- `summary()`
- `tidy()`
- TukeyHSD
- `aov(cholesterol ~ ECG + sex)`

## chi-squared

- `table`, `plot`, `chisq.test`
- Even distribution among categories: sex
- Independence of categories: pain_type x sex

## Correlation

- plot cholesterol vs. age -- guess $\rho$
- `cor(x, y)`
- `cor.test(x, y)`
- `cor(df)`
- `corrplot`

## Linear regression

### Simple

- Again: cholesterol vs. age
	- `summary()`
	- same p-value plus:
		- interpretable coef
		- residuals
- `geom_smooth(method = "lm")`

### Multiple 

- Add sex
- Add chest_pain_type to show how multi-categories work

**Exercise w/ MCQ: Predictors of Cholesterol**

https://goo.gl/forms/yoh3FV0dVhE9yNtz2

## Interaction effects

- age * sex
- ggplot

## Model selection

- Lasso is very similar

## Predictions

- `predict` on original data
- `predict` on single new observation
	- interval = "prediction"
	- interval = "confidence"
- `expand.grid`

## GLM

- any narrowing ~ age * sex

**Exercise: Predicting number of vessels with narrowing**

- Point out rows with missingness are dropped