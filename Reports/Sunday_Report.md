
Project 2: Sunday Data
======================

Introduction:
-------------

In this project I will be using the `OnlineNewsPopularity.csv` data, which is a data set about various articles that are published along with various article and publishing attributes. The goal of this project is to accurately predict the number of times that a particular article will be "shared" on social media given its attributes.

The data set contains articles that are published on all 7 days of the week. In this report, I will *only* be considering articles that were published on a **Sunday**. In order to predict the number of shares, I will first build a Linear Regression model and then a Random Forest model on training data. I will then compare the performance of both on a test data set and select the final predictive model.

Data Summary
------------

Overall, the Online News Popularity data has *39644* observations and *62* variables. There are a total of *2737* observations for articles that were published on a Sunday, and that is the subset of observations that I will be using for this report. From the initial variables, I will be considering *46* of them as potentially having an effect on number of shares.

There are 5 groups of variables that have similar themes in this data set. The variables within each group likely have high correlations with each other. The variable groups are about:

1.  Number of words/keywords/media

2.  Digital channel type

3.  Shares by keyword

4.  Typical shares of articles in Mashable

5.  Sentiment and Polarity

**Correlation Plots for Number of Word Variables:**

As seen below, many of the variables are highly correlated and might need to be removed.

![](/Users/Saara/Documents/NC%20State/ST558/Project%202/Project2/Reports/Sunday_Report_files/figure-markdown_github/Var_Explore-1.png)

**Data Channel Type:**

A correlation plot of the data channel variables shows that each of them is mutually exclusive and therefore can be considered dummy variables for one categorical variable.

**Shares by Keyword Variables:**

As seen below, many of the variables seem correlated and might need to be removed.

![](/Users/Saara/Documents/NC%20State/ST558/Project%202/Project2/Reports/Sunday_Report_files/figure-markdown_github/Var_Explore3-1.png)

**Mashable Shares Variables:**

These variables seem to have very similar distributions. It is not clear whether there will be any relationship with overall shares.

![](/Users/Saara/Documents/NC%20State/ST558/Project%202/Project2/Reports/Sunday_Report_files/figure-markdown_github/Var_Explore4-1.png)

**Sentiment/Polarity Variables:**

When comparing variables measuring positive and negative polarities, there seems to be moderate to strong correlations.

![](/Users/Saara/Documents/NC%20State/ST558/Project%202/Project2/Reports/Sunday_Report_files/figure-markdown_github/Var_Explore5-1.png)![](/Users/Saara/Documents/NC%20State/ST558/Project%202/Project2/Reports/Sunday_Report_files/figure-markdown_github/Var_Explore5-2.png)

Modeling
--------

First, I will split the data into training and test sets. The training data set will contain 70% of the data observations, and the test set will contain the remaining 30%.

Dimensions of the train and test sets:

    ## [1] 1915   46

    ## [1] 822  46

### Linear Model

I will first begin by fitting a linear regression model with ALL of the variables.

Here is the summary of the first linear model. Looking at the t statistics and p-values, the majority of predictors are not statistically significant for predicting shares. The model overall is statistically significant, but has an incredibly low adjusted-R<sup>2</sup> value (0.0239).

    ## 
    ## Call:
    ## lm(formula = shares ~ ., data = dTrain)
    ## 
    ## Residuals:
    ##    Min     1Q Median     3Q    Max 
    ##  -8405  -2406  -1141    263  78918 
    ## 
    ## Coefficients: (1 not defined because of singularities)
    ##                                 Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)                   -2.905e+03  1.937e+03  -1.500 0.133869    
    ## n_tokens_title                 1.247e+02  6.943e+01   1.795 0.072739 .  
    ## n_tokens_content               2.954e-01  4.317e-01   0.684 0.493835    
    ## n_unique_tokens                7.643e+03  4.329e+03   1.766 0.077640 .  
    ## n_non_stop_words               2.327e+03  3.882e+03   0.599 0.549069    
    ## n_non_stop_unique_tokens      -4.082e+03  3.767e+03  -1.084 0.278723    
    ## num_hrefs                      1.366e-01  1.545e+01   0.009 0.992949    
    ## num_self_hrefs                -2.614e+01  3.521e+01  -0.742 0.457916    
    ## num_imgs                       1.131e+01  1.866e+01   0.606 0.544645    
    ## num_videos                     4.582e+01  4.368e+01   1.049 0.294354    
    ## average_token_length          -7.538e+02  5.412e+02  -1.393 0.163850    
    ## num_keywords                   1.035e+02  9.199e+01   1.125 0.260617    
    ## data_channel_is_lifestyle     -2.480e+02  6.586e+02  -0.377 0.706534    
    ## data_channel_is_entertainment  3.609e+02  5.420e+02   0.666 0.505557    
    ## data_channel_is_bus            1.247e+03  6.381e+02   1.954 0.050877 .  
    ## data_channel_is_socmed         1.530e+03  7.552e+02   2.026 0.042922 *  
    ## data_channel_is_tech           1.247e+03  6.113e+02   2.040 0.041512 *  
    ## data_channel_is_world          2.572e+02  6.557e+02   0.392 0.694923    
    ## kw_min_min                     5.022e+00  3.757e+00   1.337 0.181388    
    ## kw_max_min                     2.968e-01  2.046e-01   1.451 0.147075    
    ## kw_avg_min                    -1.831e+00  1.341e+00  -1.365 0.172324    
    ## kw_min_max                    -1.229e-03  3.833e-03  -0.321 0.748522    
    ## kw_max_max                     9.481e-04  1.412e-03   0.671 0.502047    
    ## kw_avg_max                    -1.878e-03  2.289e-03  -0.821 0.411928    
    ## kw_min_avg                    -7.007e-01  1.811e-01  -3.869 0.000113 ***
    ## kw_max_avg                    -2.734e-01  6.547e-02  -4.176 3.10e-05 ***
    ## kw_avg_avg                     2.035e+00  3.530e-01   5.765 9.51e-09 ***
    ## self_reference_min_shares      6.721e-04  2.469e-02   0.027 0.978290    
    ## self_reference_max_shares     -2.809e-03  7.979e-03  -0.352 0.724813    
    ## self_reference_avg_sharess     5.954e-03  3.127e-02   0.190 0.849022    
    ## global_subjectivity           -4.979e+01  1.991e+03  -0.025 0.980051    
    ## global_sentiment_polarity      9.067e+03  3.913e+03   2.317 0.020614 *  
    ## global_rate_positive_words    -2.946e+04  1.546e+04  -1.906 0.056818 .  
    ## global_rate_negative_words    -1.427e+04  3.475e+04  -0.411 0.681401    
    ## rate_positive_words           -2.019e+03  2.835e+03  -0.712 0.476468    
    ## rate_negative_words                   NA         NA      NA       NA    
    ## avg_positive_polarity         -9.162e+02  3.306e+03  -0.277 0.781688    
    ## min_positive_polarity         -3.083e+03  2.655e+03  -1.161 0.245685    
    ## max_positive_polarity         -4.768e+01  1.096e+03  -0.044 0.965305    
    ## avg_negative_polarity         -1.633e+03  2.964e+03  -0.551 0.581721    
    ## min_negative_polarity         -9.756e+02  1.073e+03  -0.910 0.363161    
    ## max_negative_polarity          2.065e+03  2.428e+03   0.851 0.395014    
    ## title_subjectivity             1.642e+03  6.840e+02   2.401 0.016470 *  
    ## title_sentiment_polarity      -1.251e+02  5.712e+02  -0.219 0.826677    
    ## abs_title_subjectivity         2.128e+03  8.728e+02   2.438 0.014866 *  
    ## abs_title_sentiment_polarity  -8.364e+02  9.345e+02  -0.895 0.370875    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 6114 on 1870 degrees of freedom
    ## Multiple R-squared:  0.0631, Adjusted R-squared:  0.04106 
    ## F-statistic: 2.862 on 44 and 1870 DF,  p-value: 1.949e-09

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
    ##  -7547  -2335  -1484     68  80197 
    ## 
    ## Coefficients:
    ##                                 Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)                    1.445e+01  1.136e+03   0.013   0.9899    
    ## data_channel_is_entertainment  2.084e+02  3.602e+02   0.579   0.5630    
    ## kw_min_min                     4.799e+00  3.705e+00   1.295   0.1953    
    ## kw_max_max                     1.008e-03  1.347e-03   0.748   0.4544    
    ## kw_avg_max                    -1.671e-03  1.620e-03  -1.031   0.3025    
    ## kw_max_avg                    -1.169e-01  5.161e-02  -2.266   0.0236 *  
    ## kw_avg_avg                     1.227e+00  2.239e-01   5.478 4.87e-08 ***
    ## min_positive_polarity         -1.134e+03  1.834e+03  -0.618   0.5364    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 6176 on 1907 degrees of freedom
    ## Multiple R-squared:  0.02528,    Adjusted R-squared:  0.0217 
    ## F-statistic: 7.066 on 7 and 1907 DF,  p-value: 2.376e-08

Looking at the plots for the model, it seems that there are leverage points affecting the predictions. ![](/Users/Saara/Documents/NC%20State/ST558/Project%202/Project2/Reports/Sunday_Report_files/figure-markdown_github/unnamed-chunk-2-1.png)

I will now remove the leverage points and create the final linear model. As seen below, the adjusted R<sup>2</sup> has improved a bit for about a 6% explanation of variability, but the RSE has reduced quite a bit. I am assuming that a non-linear model will perform much better for this prediction.

    ## 
    ## Call:
    ## lm(formula = shares ~ data_channel_is_entertainment + kw_min_min + 
    ##     kw_max_max + kw_avg_max + kw_max_avg + kw_avg_avg + min_positive_polarity, 
    ##     data = dTrain, weights = as.numeric(w))
    ## 
    ## Weighted Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -4282.4 -1514.4  -825.5   447.4 18717.1 
    ## 
    ## Coefficients:
    ##                                 Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)                    1.217e+03  5.297e+02   2.298 0.021664 *  
    ## data_channel_is_entertainment  3.872e+01  1.665e+02   0.232 0.816209    
    ## kw_min_min                    -1.825e-01  1.724e+00  -0.106 0.915691    
    ## kw_max_max                     4.998e-04  6.280e-04   0.796 0.426190    
    ## kw_avg_max                    -3.012e-03  7.610e-04  -3.958 7.84e-05 ***
    ## kw_max_avg                    -7.377e-02  3.171e-02  -2.326 0.020117 *  
    ## kw_avg_avg                     8.561e-01  1.106e-01   7.740 1.63e-14 ***
    ## min_positive_polarity         -3.091e+03  8.931e+02  -3.460 0.000552 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 2801 on 1838 degrees of freedom
    ## Multiple R-squared:  0.05243,    Adjusted R-squared:  0.04882 
    ## F-statistic: 14.53 on 7 and 1838 DF,  p-value: < 2.2e-16

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

-   The RMSE for the Linear Regression model on the test set is 6120.7987846.

-   The RMSE for the Regression Tree model on the test set is 6146.8241442.

-   The RMSE for the Bagged Tree model on the test set is 6143.6147571.

Conclusion
----------

Comparing the linear and non-linear methods based on test MSE, the Linear Regression model performed the best in predicting number of shares, despite having a high MSE and low adjusted R<sup>2</sup> on its own.
