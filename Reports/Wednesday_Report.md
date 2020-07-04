
Project 2: Wednesday Data
=========================

Introduction:
-------------

In this project I will be using the `OnlineNewsPopularity.csv` data, which is a data set about various articles that are published along with various article and publishing attributes. The goal of this project is to accurately predict the number of times that a particular article will be "shared" on social media given its attributes.

The data set contains articles that are published on all 7 days of the week. In this report, I will *only* be considering articles that were published on a **Wednesday**. In order to predict the number of shares, I will first build a Linear Regression model and then a Random Forest model on training data. I will then compare the performance of both on a test data set and select the final predictive model.

Data Summary
------------

Overall, the Online News Popularity data has *39644* observations and *62* variables. There are a total of *7435* observations for articles that were published on a Wednesday, and that is the subset of observations that I will be using for this report. From the initial variables, I will be considering *46* of them as potentially having an effect on number of shares.

There are 5 groups of variables that have similar themes in this data set. The variables within each group likely have high correlations with each other. The variable groups are about:

1.  Number of words/keywords/media

2.  Digital channel type

3.  Shares by keyword

4.  Typical shares of articles in Mashable

5.  Sentiment and Polarity

**Correlation Plots for Number of Word Variables:**

As seen below, many of the variables are highly correlated and might need to be removed.

![](/Users/Saara/Documents/NC%20State/ST558/Project%202/Project2/Reports/Wednesday_Report_files/figure-markdown_github/Var_Explore-1.png)

**Data Channel Type:**

A correlation plot of the data channel variables shows that each of them is mutually exclusive and therefore can be considered dummy variables for one categorical variable.

**Shares by Keyword Variables:**

As seen below, many of the variables seem correlated and might need to be removed.

![](/Users/Saara/Documents/NC%20State/ST558/Project%202/Project2/Reports/Wednesday_Report_files/figure-markdown_github/Var_Explore3-1.png)

**Mashable Shares Variables:**

These variables seem to have very similar distributions. It is not clear whether there will be any relationship with overall shares.

![](/Users/Saara/Documents/NC%20State/ST558/Project%202/Project2/Reports/Wednesday_Report_files/figure-markdown_github/Var_Explore4-1.png)

**Sentiment/Polarity Variables:**

When comparing variables measuring positive and negative polarities, there seems to be moderate to strong correlations.

![](/Users/Saara/Documents/NC%20State/ST558/Project%202/Project2/Reports/Wednesday_Report_files/figure-markdown_github/Var_Explore5-1.png)![](/Users/Saara/Documents/NC%20State/ST558/Project%202/Project2/Reports/Wednesday_Report_files/figure-markdown_github/Var_Explore5-2.png)

Modeling
--------

First, I will split the data into training and test sets. The training data set will contain 70% of the data observations, and the test set will contain the remaining 30%.

Dimensions of the train and test sets:

    ## [1] 5204   46

    ## [1] 2231   46

### Linear Model

I will first begin by fitting a linear regression model with ALL of the variables.

Here is the summary of the first linear model. Looking at the t statistics and p-values, the majority of predictors are not statistically significant for predicting shares. The model overall is statistically significant, but has an incredibly low adjusted-R<sup>2</sup> value (0.0239).

    ## 
    ## Call:
    ## lm(formula = shares ~ ., data = dTrain)
    ## 
    ## Residuals:
    ##    Min     1Q Median     3Q    Max 
    ## -23713  -2606  -1079    417 833222 
    ## 
    ## Coefficients: (1 not defined because of singularities)
    ##                                 Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)                   -3.177e+02  3.206e+03  -0.099 0.921079    
    ## n_tokens_title                 1.129e+02  1.129e+02   1.000 0.317336    
    ## n_tokens_content               4.242e+00  9.667e-01   4.389 1.16e-05 ***
    ## n_unique_tokens                8.170e+03  7.597e+03   1.075 0.282239    
    ## n_non_stop_words               2.027e+03  6.623e+03   0.306 0.759615    
    ## n_non_stop_unique_tokens      -3.878e+03  6.428e+03  -0.603 0.546322    
    ## num_hrefs                      8.780e+01  3.028e+01   2.900 0.003749 ** 
    ## num_self_hrefs                -2.390e+02  8.042e+01  -2.972 0.002977 ** 
    ## num_imgs                      -1.704e+01  3.777e+01  -0.451 0.651897    
    ## num_videos                    -6.727e+01  6.847e+01  -0.983 0.325889    
    ## average_token_length          -2.728e+02  9.490e+02  -0.287 0.773775    
    ## num_keywords                   1.099e+02  1.468e+02   0.748 0.454283    
    ## data_channel_is_lifestyle     -2.530e+03  1.301e+03  -1.944 0.051940 .  
    ## data_channel_is_entertainment -1.968e+03  1.000e+03  -1.967 0.049190 *  
    ## data_channel_is_bus           -1.880e+03  1.062e+03  -1.771 0.076629 .  
    ## data_channel_is_socmed        -9.918e+02  1.304e+03  -0.760 0.447049    
    ## data_channel_is_tech          -8.947e+02  1.063e+03  -0.842 0.400105    
    ## data_channel_is_world         -2.386e+03  1.144e+03  -2.086 0.037001 *  
    ## kw_min_min                     9.621e-01  6.923e+00   0.139 0.889471    
    ## kw_max_min                     8.936e-02  3.044e-01   0.294 0.769081    
    ## kw_avg_min                    -8.330e-01  1.845e+00  -0.452 0.651577    
    ## kw_min_max                    -5.497e-03  4.119e-03  -1.335 0.182072    
    ## kw_max_max                    -2.241e-03  2.385e-03  -0.940 0.347341    
    ## kw_avg_max                     2.833e-03  3.243e-03   0.874 0.382371    
    ## kw_min_avg                    -1.398e-01  3.044e-01  -0.459 0.646144    
    ## kw_max_avg                    -1.653e-01  9.607e-02  -1.721 0.085400 .  
    ## kw_avg_avg                     1.304e+00  5.762e-01   2.264 0.023640 *  
    ## self_reference_min_shares     -9.410e-03  2.360e-02  -0.399 0.690091    
    ## self_reference_max_shares     -1.444e-03  1.479e-02  -0.098 0.922227    
    ## self_reference_avg_sharess     1.658e-02  3.280e-02   0.506 0.613166    
    ## global_subjectivity            1.104e+03  3.391e+03   0.325 0.744845    
    ## global_sentiment_polarity      8.546e+03  6.949e+03   1.230 0.218852    
    ## global_rate_positive_words     3.775e+03  2.883e+04   0.131 0.895838    
    ## global_rate_negative_words     3.429e+04  5.809e+04   0.590 0.555042    
    ## rate_positive_words           -3.799e+03  4.729e+03  -0.803 0.421776    
    ## rate_negative_words                   NA         NA      NA       NA    
    ## avg_positive_polarity         -8.945e+03  5.497e+03  -1.627 0.103732    
    ## min_positive_polarity          1.084e+03  4.407e+03   0.246 0.805700    
    ## max_positive_polarity          2.949e+02  1.709e+03   0.173 0.863029    
    ## avg_negative_polarity         -1.291e+04  5.009e+03  -2.577 0.009989 ** 
    ## min_negative_polarity          6.181e+03  1.853e+03   3.335 0.000859 ***
    ## max_negative_polarity          5.317e+03  4.201e+03   1.266 0.205690    
    ## title_subjectivity            -1.432e+02  1.091e+03  -0.131 0.895618    
    ## title_sentiment_polarity      -3.234e+02  1.002e+03  -0.323 0.746996    
    ## abs_title_subjectivity         3.320e+02  1.457e+03   0.228 0.819821    
    ## abs_title_sentiment_polarity   1.696e+03  1.581e+03   1.072 0.283551    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 16400 on 5159 degrees of freedom
    ## Multiple R-squared:  0.02147,    Adjusted R-squared:  0.01313 
    ## F-statistic: 2.573 on 44 and 5159 DF,  p-value: 6.592e-08

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
    ## -13438  -2321  -1428   -351 838397 
    ## 
    ## Coefficients:
    ##                                 Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)                    2.066e+02  1.917e+03   0.108  0.91418    
    ## data_channel_is_entertainment -5.326e+02  6.077e+02  -0.876  0.38083    
    ## kw_min_min                     6.945e-01  6.888e+00   0.101  0.91968    
    ## kw_max_max                    -1.246e-03  2.287e-03  -0.545  0.58609    
    ## kw_avg_max                    -5.931e-04  2.341e-03  -0.253  0.80000    
    ## kw_max_avg                    -2.396e-01  7.113e-02  -3.369  0.00076 ***
    ## kw_avg_avg                     1.919e+00  3.629e-01   5.289 1.28e-07 ***
    ## min_positive_polarity         -3.366e+03  3.158e+03  -1.066  0.28662    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 16450 on 5196 degrees of freedom
    ## Multiple R-squared:  0.007991,   Adjusted R-squared:  0.006655 
    ## F-statistic:  5.98 on 7 and 5196 DF,  p-value: 5.916e-07

Looking at the plots for the model, it seems that there are leverage points affecting the predictions. ![](/Users/Saara/Documents/NC%20State/ST558/Project%202/Project2/Reports/Wednesday_Report_files/figure-markdown_github/unnamed-chunk-2-1.png)

I will now remove the leverage points and create the final linear model. As seen below, the adjusted R<sup>2</sup> has improved a bit for about a 6% explanation of variability, but the RSE has reduced quite a bit. I am assuming that a non-linear model will perform much better for this prediction.

    ## 
    ## Call:
    ## lm(formula = shares ~ data_channel_is_entertainment + kw_min_min + 
    ##     kw_max_max + kw_avg_max + kw_max_avg + kw_avg_avg + min_positive_polarity, 
    ##     data = dTrain, weights = as.numeric(w))
    ## 
    ## Weighted Residuals:
    ##    Min     1Q Median     3Q    Max 
    ##  -5598  -1500   -916      9  44672 
    ## 
    ## Coefficients:
    ##                                 Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)                   -5.415e+02  4.328e+02  -1.251 0.210938    
    ## data_channel_is_entertainment -4.307e+02  1.364e+02  -3.159 0.001594 ** 
    ## kw_min_min                     5.125e+00  1.552e+00   3.302 0.000965 ***
    ## kw_max_max                     9.649e-04  5.146e-04   1.875 0.060829 .  
    ## kw_avg_max                    -1.536e-03  5.286e-04  -2.906 0.003674 ** 
    ## kw_max_avg                    -1.421e-01  1.737e-02  -8.180 3.55e-16 ***
    ## kw_avg_avg                     1.204e+00  8.360e-02  14.399  < 2e-16 ***
    ## min_positive_polarity         -2.063e+03  7.217e+02  -2.859 0.004272 ** 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 3675 on 5148 degrees of freedom
    ## Multiple R-squared:  0.05439,    Adjusted R-squared:  0.05311 
    ## F-statistic:  42.3 on 7 and 5148 DF,  p-value: < 2.2e-16

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

-   The RMSE for the Linear Regression model on the test set is 8481.7390519.

-   The RMSE for the Regression Tree model on the test set is 8573.1972298.

-   The RMSE for the Bagged Tree model on the test set is 8906.5301409.

Conclusion
----------

Comparing the linear and non-linear methods based on test MSE, the Linear Regression model performed the best in predicting number of shares, despite having a high MSE and low adjusted R<sup>2</sup> on its own.
