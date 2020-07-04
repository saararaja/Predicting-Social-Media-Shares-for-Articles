
Project 2: Tuesday Data
=======================

Introduction:
-------------

In this project I will be using the `OnlineNewsPopularity.csv` data, which is a data set about various articles that are published along with various article and publishing attributes. The goal of this project is to accurately predict the number of times that a particular article will be "shared" on social media given its attributes.

The data set contains articles that are published on all 7 days of the week. In this report, I will *only* be considering articles that were published on a **Tuesday**. In order to predict the number of shares, I will first build a Linear Regression model and then a Random Forest model on training data. I will then compare the performance of both on a test data set and select the final predictive model.

Data Summary
------------

Overall, the Online News Popularity data has *39644* observations and *62* variables. There are a total of *7390* observations for articles that were published on a Tuesday, and that is the subset of observations that I will be using for this report. From the initial variables, I will be considering *46* of them as potentially having an effect on number of shares.

There are 5 groups of variables that have similar themes in this data set. The variables within each group likely have high correlations with each other. The variable groups are about:

1.  Number of words/keywords/media

2.  Digital channel type

3.  Shares by keyword

4.  Typical shares of articles in Mashable

5.  Sentiment and Polarity

**Correlation Plots for Number of Word Variables:**

As seen below, many of the variables are highly correlated and might need to be removed.

![](/Users/Saara/Documents/NC%20State/ST558/Project%202/Project2/Reports/Tuesday_Report_files/figure-markdown_github/Var_Explore-1.png)

**Data Channel Type:**

A correlation plot of the data channel variables shows that each of them is mutually exclusive and therefore can be considered dummy variables for one categorical variable.

**Shares by Keyword Variables:**

As seen below, many of the variables seem correlated and might need to be removed.

![](/Users/Saara/Documents/NC%20State/ST558/Project%202/Project2/Reports/Tuesday_Report_files/figure-markdown_github/Var_Explore3-1.png)

**Mashable Shares Variables:**

These variables seem to have very similar distributions. It is not clear whether there will be any relationship with overall shares.

![](/Users/Saara/Documents/NC%20State/ST558/Project%202/Project2/Reports/Tuesday_Report_files/figure-markdown_github/Var_Explore4-1.png)

**Sentiment/Polarity Variables:**

When comparing variables measuring positive and negative polarities, there seems to be moderate to strong correlations.

![](/Users/Saara/Documents/NC%20State/ST558/Project%202/Project2/Reports/Tuesday_Report_files/figure-markdown_github/Var_Explore5-1.png)![](/Users/Saara/Documents/NC%20State/ST558/Project%202/Project2/Reports/Tuesday_Report_files/figure-markdown_github/Var_Explore5-2.png)

Modeling
--------

First, I will split the data into training and test sets. The training data set will contain 70% of the data observations, and the test set will contain the remaining 30%.

Dimensions of the train and test sets:

    ## [1] 5173   46

    ## [1] 2217   46

### Linear Model

I will first begin by fitting a linear regression model with ALL of the variables.

Here is the summary of the first linear model. Looking at the t statistics and p-values, the majority of predictors are not statistically significant for predicting shares. The model overall is statistically significant, but has an incredibly low adjusted-R<sup>2</sup> value (0.0239).

    ## 
    ## Call:
    ## lm(formula = shares ~ ., data = dTrain)
    ## 
    ## Residuals:
    ##    Min     1Q Median     3Q    Max 
    ## -16172  -2158  -1069    114 434916 
    ## 
    ## Coefficients:
    ##                                 Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)                   -1.157e+03  1.844e+03  -0.627 0.530438    
    ## n_tokens_title                 1.388e+02  6.499e+01   2.135 0.032776 *  
    ## n_tokens_content               8.880e-01  5.734e-01   1.549 0.121543    
    ## n_unique_tokens                5.526e+03  4.439e+03   1.245 0.213221    
    ## n_non_stop_words              -1.691e+03  1.540e+03  -1.097 0.272497    
    ## n_non_stop_unique_tokens      -3.245e+03  3.644e+03  -0.890 0.373251    
    ## num_hrefs                      2.155e+01  1.493e+01   1.443 0.148948    
    ## num_self_hrefs                -9.102e+01  4.665e+01  -1.951 0.051091 .  
    ## num_imgs                       3.257e+01  2.132e+01   1.528 0.126689    
    ## num_videos                     1.546e+01  3.726e+01   0.415 0.678238    
    ## average_token_length          -3.195e+02  5.181e+02  -0.617 0.537502    
    ## num_keywords                   7.104e+01  8.440e+01   0.842 0.399999    
    ## data_channel_is_lifestyle      6.432e+02  8.082e+02   0.796 0.426183    
    ## data_channel_is_entertainment -1.015e+03  5.624e+02  -1.805 0.071162 .  
    ## data_channel_is_bus           -5.561e+02  6.100e+02  -0.912 0.362055    
    ## data_channel_is_socmed         2.743e+02  7.191e+02   0.381 0.702895    
    ## data_channel_is_tech          -1.782e+02  6.025e+02  -0.296 0.767458    
    ## data_channel_is_world         -4.923e+02  6.484e+02  -0.759 0.447701    
    ## kw_min_min                    -1.513e+00  4.091e+00  -0.370 0.711427    
    ## kw_max_min                    -1.136e-01  1.955e-01  -0.581 0.561385    
    ## kw_avg_min                     3.127e-01  1.167e+00   0.268 0.788733    
    ## kw_min_max                    -3.892e-03  2.727e-03  -1.427 0.153538    
    ## kw_max_max                    -1.122e-03  1.446e-03  -0.776 0.437961    
    ## kw_avg_max                     2.189e-03  1.876e-03   1.167 0.243185    
    ## kw_min_avg                    -3.807e-01  1.734e-01  -2.195 0.028196 *  
    ## kw_max_avg                    -2.215e-01  6.158e-02  -3.597 0.000325 ***
    ## kw_avg_avg                     1.551e+00  3.436e-01   4.514 6.51e-06 ***
    ## self_reference_min_shares      1.692e-02  2.360e-02   0.717 0.473358    
    ## self_reference_max_shares     -6.686e-03  1.450e-02  -0.461 0.644704    
    ## self_reference_avg_sharess     1.404e-02  3.551e-02   0.395 0.692679    
    ## global_subjectivity            3.968e+03  1.941e+03   2.044 0.040996 *  
    ## global_sentiment_polarity     -3.918e+03  3.930e+03  -0.997 0.318825    
    ## global_rate_positive_words    -2.940e+03  1.680e+04  -0.175 0.861124    
    ## global_rate_negative_words    -3.592e+04  3.227e+04  -1.113 0.265711    
    ## rate_positive_words           -5.422e+02  3.049e+03  -0.178 0.858844    
    ## rate_negative_words            1.611e+03  3.548e+03   0.454 0.649846    
    ## avg_positive_polarity         -2.578e+03  3.178e+03  -0.811 0.417266    
    ## min_positive_polarity          2.473e+03  2.679e+03   0.923 0.355967    
    ## max_positive_polarity          2.590e+03  9.632e+02   2.689 0.007180 ** 
    ## avg_negative_polarity         -1.407e+02  2.902e+03  -0.048 0.961331    
    ## min_negative_polarity          1.194e+03  1.057e+03   1.129 0.258902    
    ## max_negative_polarity         -8.417e+02  2.395e+03  -0.351 0.725275    
    ## title_subjectivity            -7.617e+02  6.251e+02  -1.218 0.223114    
    ## title_sentiment_polarity       4.889e+02  5.748e+02   0.851 0.395032    
    ## abs_title_subjectivity         3.752e+02  8.195e+02   0.458 0.647119    
    ## abs_title_sentiment_polarity   1.186e+03  9.073e+02   1.307 0.191166    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 9404 on 5127 degrees of freedom
    ## Multiple R-squared:  0.03372,    Adjusted R-squared:  0.02524 
    ## F-statistic: 3.976 on 45 and 5127 DF,  p-value: < 2.2e-16

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
    ##  -8608  -2129  -1303   -210 437012 
    ## 
    ## Coefficients:
    ##                                 Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)                   -7.186e+02  1.158e+03  -0.620   0.5350    
    ## data_channel_is_entertainment -5.886e+02  3.456e+02  -1.703   0.0886 .  
    ## kw_min_min                    -2.943e-01  4.077e+00  -0.072   0.9425    
    ## kw_max_max                    -9.706e-05  1.371e-03  -0.071   0.9436    
    ## kw_avg_max                     1.474e-05  1.384e-03   0.011   0.9915    
    ## kw_max_avg                    -2.031e-01  4.567e-02  -4.448 8.86e-06 ***
    ## kw_avg_avg                     1.597e+00  2.197e-01   7.268 4.20e-13 ***
    ## min_positive_polarity          1.968e+03  1.930e+03   1.020   0.3079    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 9438 on 5165 degrees of freedom
    ## Multiple R-squared:  0.01943,    Adjusted R-squared:  0.0181 
    ## F-statistic: 14.62 on 7 and 5165 DF,  p-value: < 2.2e-16

Looking at the plots for the model, it seems that there are leverage points affecting the predictions. ![](/Users/Saara/Documents/NC%20State/ST558/Project%202/Project2/Reports/Tuesday_Report_files/figure-markdown_github/unnamed-chunk-2-1.png)

I will now remove the leverage points and create the final linear model. As seen below, the adjusted R<sup>2</sup> has improved a bit for about a 6% explanation of variability, but the RSE has reduced quite a bit. I am assuming that a non-linear model will perform much better for this prediction.

    ## 
    ## Call:
    ## lm(formula = shares ~ data_channel_is_entertainment + kw_min_min + 
    ##     kw_max_max + kw_avg_max + kw_max_avg + kw_avg_avg + min_positive_polarity, 
    ##     data = dTrain, weights = as.numeric(w))
    ## 
    ## Weighted Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -5234.6 -1373.6  -812.3    83.8 25165.4 
    ## 
    ## Coefficients:
    ##                                 Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)                    7.459e+02  3.671e+02   2.032   0.0422 *  
    ## data_channel_is_entertainment -5.876e+02  1.098e+02  -5.350 9.20e-08 ***
    ## kw_min_min                    -1.193e+00  1.290e+00  -0.924   0.3553    
    ## kw_max_max                    -1.778e-04  4.343e-04  -0.409   0.6824    
    ## kw_avg_max                    -2.061e-03  4.416e-04  -4.667 3.14e-06 ***
    ## kw_max_avg                    -1.151e-01  1.755e-02  -6.556 6.06e-11 ***
    ## kw_avg_avg                     1.027e+00  7.247e-02  14.167  < 2e-16 ***
    ## min_positive_polarity         -8.970e+02  6.240e+02  -1.438   0.1506    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 2969 on 5082 degrees of freedom
    ## Multiple R-squared:  0.05921,    Adjusted R-squared:  0.05791 
    ## F-statistic: 45.69 on 7 and 5082 DF,  p-value: < 2.2e-16

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

-   The RMSE for the Linear Regression model on the test set is 1.034122910^{4}.

-   The RMSE for the Regression Tree model on the test set is 1.040822110^{4}.

-   The RMSE for the Bagged Tree model on the test set is 1.040688510^{4}.

Conclusion
----------

Comparing the linear and non-linear methods based on test MSE, the Linear Regression model performed the best in predicting number of shares, despite having a high MSE and low adjusted R<sup>2</sup> on its own.
