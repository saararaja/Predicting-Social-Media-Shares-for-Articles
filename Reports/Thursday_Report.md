
Project 2: Thursday Data
========================

Introduction:
-------------

In this project I will be using the `OnlineNewsPopularity.csv` data, which is a data set about various articles that are published along with various article and publishing attributes. The goal of this project is to accurately predict the number of times that a particular article will be "shared" on social media given its attributes.

The data set contains articles that are published on all 7 days of the week. In this report, I will *only* be considering articles that were published on a **Thursday**. In order to predict the number of shares, I will first build a Linear Regression model and then a Random Forest model on training data. I will then compare the performance of both on a test data set and select the final predictive model.

Data Summary
------------

Overall, the Online News Popularity data has *39644* observations and *62* variables. There are a total of *7267* observations for articles that were published on a Thursday, and that is the subset of observations that I will be using for this report. From the initial variables, I will be considering *46* of them as potentially having an effect on number of shares.

There are 5 groups of variables that have similar themes in this data set. The variables within each group likely have high correlations with each other. The variable groups are about:

1.  Number of words/keywords/media

2.  Digital channel type

3.  Shares by keyword

4.  Typical shares of articles in Mashable

5.  Sentiment and Polarity

**Correlation Plots for Number of Word Variables:**

As seen below, many of the variables are highly correlated and might need to be removed.

![](/Users/Saara/Documents/NC%20State/ST558/Project%202/Project2/Reports/Thursday_Report_files/figure-markdown_github/Var_Explore-1.png)

**Data Channel Type:**

A correlation plot of the data channel variables shows that each of them is mutually exclusive and therefore can be considered dummy variables for one categorical variable.

**Shares by Keyword Variables:**

As seen below, many of the variables seem correlated and might need to be removed.

![](/Users/Saara/Documents/NC%20State/ST558/Project%202/Project2/Reports/Thursday_Report_files/figure-markdown_github/Var_Explore3-1.png)

**Mashable Shares Variables:**

These variables seem to have very similar distributions. It is not clear whether there will be any relationship with overall shares.

![](/Users/Saara/Documents/NC%20State/ST558/Project%202/Project2/Reports/Thursday_Report_files/figure-markdown_github/Var_Explore4-1.png)

**Sentiment/Polarity Variables:**

When comparing variables measuring positive and negative polarities, there seems to be moderate to strong correlations.

![](/Users/Saara/Documents/NC%20State/ST558/Project%202/Project2/Reports/Thursday_Report_files/figure-markdown_github/Var_Explore5-1.png)![](/Users/Saara/Documents/NC%20State/ST558/Project%202/Project2/Reports/Thursday_Report_files/figure-markdown_github/Var_Explore5-2.png)

Modeling
--------

First, I will split the data into training and test sets. The training data set will contain 70% of the data observations, and the test set will contain the remaining 30%.

Dimensions of the train and test sets:

    ## [1] 5086   46

    ## [1] 2181   46

### Linear Model

I will first begin by fitting a linear regression model with ALL of the variables.

Here is the summary of the first linear model. Looking at the t statistics and p-values, the majority of predictors are not statistically significant for predicting shares. The model overall is statistically significant, but has an incredibly low adjusted-R<sup>2</sup> value (0.0239).

    ## 
    ## Call:
    ## lm(formula = shares ~ ., data = dTrain)
    ## 
    ## Residuals:
    ##    Min     1Q Median     3Q    Max 
    ## -36000  -2344   -980    426 301709 
    ## 
    ## Coefficients: (1 not defined because of singularities)
    ##                                 Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)                   -4.777e+03  2.061e+03  -2.318  0.02051 *  
    ## n_tokens_title                 1.764e+02  7.163e+01   2.462  0.01383 *  
    ## n_tokens_content              -1.721e-01  6.252e-01  -0.275  0.78311    
    ## n_unique_tokens                9.282e+03  4.932e+03   1.882  0.05989 .  
    ## n_non_stop_words              -1.362e+03  4.196e+03  -0.324  0.74557    
    ## n_non_stop_unique_tokens      -6.401e+03  4.150e+03  -1.542  0.12303    
    ## num_hrefs                      1.309e+01  1.822e+01   0.719  0.47239    
    ## num_self_hrefs                 1.907e+01  5.094e+01   0.374  0.70818    
    ## num_imgs                       2.157e+01  2.253e+01   0.958  0.33833    
    ## num_videos                     1.465e+01  4.142e+01   0.354  0.72356    
    ## average_token_length          -5.570e+01  6.219e+02  -0.090  0.92864    
    ## num_keywords                  -2.019e+02  9.210e+01  -2.192  0.02841 *  
    ## data_channel_is_lifestyle     -5.248e+02  8.345e+02  -0.629  0.52941    
    ## data_channel_is_entertainment -5.051e+02  6.226e+02  -0.811  0.41720    
    ## data_channel_is_bus            4.051e+02  6.624e+02   0.612  0.54083    
    ## data_channel_is_socmed        -8.246e+02  8.045e+02  -1.025  0.30538    
    ## data_channel_is_tech           2.309e+02  6.714e+02   0.344  0.73089    
    ## data_channel_is_world          3.623e+02  7.137e+02   0.508  0.61169    
    ## kw_min_min                     1.058e+01  4.374e+00   2.418  0.01562 *  
    ## kw_max_min                    -3.993e-01  1.777e-01  -2.248  0.02463 *  
    ## kw_avg_min                     4.605e+00  1.148e+00   4.012 6.10e-05 ***
    ## kw_min_max                    -1.273e-03  2.664e-03  -0.478  0.63270    
    ## kw_max_max                     2.243e-03  1.530e-03   1.466  0.14268    
    ## kw_avg_max                    -1.669e-04  2.104e-03  -0.079  0.93677    
    ## kw_min_avg                    -9.637e-01  1.937e-01  -4.976 6.71e-07 ***
    ## kw_max_avg                    -2.392e-01  7.332e-02  -3.263  0.00111 ** 
    ## kw_avg_avg                     2.334e+00  3.799e-01   6.144 8.69e-10 ***
    ## self_reference_min_shares      5.047e-02  1.805e-02   2.796  0.00520 ** 
    ## self_reference_max_shares      5.632e-02  9.705e-03   5.804 6.88e-09 ***
    ## self_reference_avg_sharess    -1.018e-01  2.516e-02  -4.047 5.27e-05 ***
    ## global_subjectivity            5.906e+03  2.194e+03   2.692  0.00712 ** 
    ## global_sentiment_polarity     -2.863e+03  4.320e+03  -0.663  0.50747    
    ## global_rate_positive_words    -1.850e+03  1.830e+04  -0.101  0.91951    
    ## global_rate_negative_words    -3.840e+04  3.576e+04  -1.074  0.28293    
    ## rate_positive_words           -1.027e+03  2.873e+03  -0.358  0.72061    
    ## rate_negative_words                   NA         NA      NA       NA    
    ## avg_positive_polarity         -2.330e+03  3.509e+03  -0.664  0.50678    
    ## min_positive_polarity         -2.914e+03  2.911e+03  -1.001  0.31696    
    ## max_positive_polarity          9.105e+02  1.087e+03   0.838  0.40223    
    ## avg_negative_polarity          5.565e+03  3.254e+03   1.710  0.08733 .  
    ## min_negative_polarity         -2.288e+03  1.177e+03  -1.945  0.05183 .  
    ## max_negative_polarity         -4.778e+03  2.680e+03  -1.783  0.07462 .  
    ## title_subjectivity            -7.179e+02  6.776e+02  -1.059  0.28946    
    ## title_sentiment_polarity      -1.381e+03  6.409e+02  -2.155  0.03125 *  
    ## abs_title_subjectivity        -7.987e+02  9.190e+02  -0.869  0.38479    
    ## abs_title_sentiment_polarity   2.067e+03  1.015e+03   2.035  0.04185 *  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 10360 on 5041 degrees of freedom
    ## Multiple R-squared:  0.06327,    Adjusted R-squared:  0.05509 
    ## F-statistic: 7.738 on 44 and 5041 DF,  p-value: < 2.2e-16

I will now update the linear regression model, only including the statistically significant predictors. Hopefully this will increase the predictivity of the model.

Here is the summary for the second iteration of the model. The adjusted-R<sup>2</sup> still is low despite the majority of the predictors being statistically significant now.

    ## 
    ## Call:
    ## lm(formula = shares ~ data_channel_is_entertainment + kw_min_min + 
    ##     kw_max_max + kw_avg_max + kw_max_avg + kw_avg_avg + min_positive_polarity, 
    ##     data = dTrain)
    ## 
    ## Residuals:
    ##    Min     1Q Median     3Q    Max 
    ## -27466  -2101  -1162   -219 301691 
    ## 
    ## Coefficients:
    ##                                 Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)                   -2.626e+03  1.250e+03  -2.100  0.03573 *  
    ## data_channel_is_entertainment -3.720e+02  3.912e+02  -0.951  0.34176    
    ## kw_min_min                     1.215e+01  4.396e+00   2.765  0.00572 ** 
    ## kw_max_max                     1.699e-03  1.473e-03   1.153  0.24898    
    ## kw_avg_max                    -7.620e-04  1.532e-03  -0.497  0.61891    
    ## kw_max_avg                     3.803e-02  5.112e-02   0.744  0.45688    
    ## kw_avg_avg                     1.423e+00  2.443e-01   5.825 6.08e-09 ***
    ## min_positive_polarity         -1.239e+03  2.100e+03  -0.590  0.55505    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 10490 on 5078 degrees of freedom
    ## Multiple R-squared:  0.03202,    Adjusted R-squared:  0.03069 
    ## F-statistic:    24 on 7 and 5078 DF,  p-value: < 2.2e-16

Looking at the plots for the model, it seems that there are leverage points affecting the predictions. ![](/Users/Saara/Documents/NC%20State/ST558/Project%202/Project2/Reports/Thursday_Report_files/figure-markdown_github/unnamed-chunk-2-1.png)

I will now remove the leverage points and create the final linear model. As seen below, the adjusted R<sup>2</sup> has improved a bit for about a 6% explanation of variability, but the RSE has reduced quite a bit. I am assuming that a non-linear model will perform much better for this prediction.

    ## 
    ## Call:
    ## lm(formula = shares ~ data_channel_is_entertainment + kw_min_min + 
    ##     kw_max_max + kw_avg_max + kw_max_avg + kw_avg_avg + min_positive_polarity, 
    ##     data = dTrain, weights = as.numeric(w))
    ## 
    ## Weighted Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -5300.6 -1379.2  -765.1    74.1 31316.2 
    ## 
    ## Coefficients:
    ##                                 Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)                   -1.378e+02  3.817e+02  -0.361  0.71816    
    ## data_channel_is_entertainment -5.697e+02  1.183e+02  -4.815 1.52e-06 ***
    ## kw_min_min                     2.360e+00  1.343e+00   1.757  0.07890 .  
    ## kw_max_max                     4.596e-04  4.492e-04   1.023  0.30635    
    ## kw_avg_max                    -2.225e-03  4.693e-04  -4.741 2.19e-06 ***
    ## kw_max_avg                    -6.966e-02  2.286e-02  -3.047  0.00233 ** 
    ## kw_avg_avg                     1.085e+00  8.102e-02  13.393  < 2e-16 ***
    ## min_positive_polarity         -9.999e+02  6.375e+02  -1.568  0.11685    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 3147 on 4995 degrees of freedom
    ## Multiple R-squared:  0.07093,    Adjusted R-squared:  0.06963 
    ## F-statistic: 54.48 on 7 and 4995 DF,  p-value: < 2.2e-16

### Non-Linear Models

First, I will fit a simple Regression Tree in order to predict shares. Here is the code below:

``` r
set.seed(100)
trctrl <- trainControl(method="repeatedcv", number=10, repeats = 3)
metric = 'RMSE'
tree_fit <- train(shares ~., data = dTrain, method = "rpart", metric = metric, trControl = trctrl,
                 preProcess = c("center", "scale") )
```

I will also fit a bagged tree to predict shares. Here is the code for that:

``` r
bag_fit <- train(shares ~., data = dTrain, method = "treebag", metric = metric, trControl = trctrl,
                 preProcess = c("center", "scale") )
```

Test Set Prediction
-------------------

I will fit each of the 3 models (Linear Regression, Regression Tree, Bagged Tree) on the test data set.

Here are the corresponding RMSE values:

-   The RMSE for the Linear Regression model on the test set is 5557.8891323.

-   The RMSE for the Regression Tree model on the test set is 5638.5807407.

-   The RMSE for the Bagged Tree model on the test set is 5811.8151995.

Conclusion
----------

Comparing the linear and non-linear methods based on test MSE, the Linear Regression model performed the best in predicting number of shares, despite having a high MSE and low adjusted R<sup>2</sup> on its own.
