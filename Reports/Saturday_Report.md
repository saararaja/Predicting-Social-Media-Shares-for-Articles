
Project 2: Saturday Data
========================

Introduction:
-------------

In this project I will be using the `OnlineNewsPopularity.csv` data, which is a data set about various articles that are published along with various article and publishing attributes. The goal of this project is to accurately predict the number of times that a particular article will be "shared" on social media given its attributes.

The data set contains articles that are published on all 7 days of the week. In this report, I will *only* be considering articles that were published on a **Saturday**. In order to predict the number of shares, I will first build a Linear Regression model and then a Random Forest model on training data. I will then compare the performance of both on a test data set and select the final predictive model.

Data Summary
------------

Overall, the Online News Popularity data has *39644* observations and *62* variables. There are a total of *2453* observations for articles that were published on a Saturday, and that is the subset of observations that I will be using for this report. From the initial variables, I will be considering *46* of them as potentially having an effect on number of shares.

There are 5 groups of variables that have similar themes in this data set. The variables within each group likely have high correlations with each other. The variable groups are about:

1.  Number of words/keywords/media

2.  Digital channel type

3.  Shares by keyword

4.  Typical shares of articles in Mashable

5.  Sentiment and Polarity

**Correlation Plots for Number of Word Variables:**

As seen below, many of the variables are highly correlated and might need to be removed.

![](/Users/Saara/Documents/NC%20State/ST558/Project%202/Project2/Reports/Saturday_Report_files/figure-markdown_github/Var_Explore-1.png)

**Data Channel Type:**

A correlation plot of the data channel variables shows that each of them is mutually exclusive and therefore can be considered dummy variables for one categorical variable.

**Shares by Keyword Variables:**

As seen below, many of the variables seem correlated and might need to be removed.

![](/Users/Saara/Documents/NC%20State/ST558/Project%202/Project2/Reports/Saturday_Report_files/figure-markdown_github/Var_Explore3-1.png)

**Mashable Shares Variables:**

These variables seem to have very similar distributions. It is not clear whether there will be any relationship with overall shares.

![](/Users/Saara/Documents/NC%20State/ST558/Project%202/Project2/Reports/Saturday_Report_files/figure-markdown_github/Var_Explore4-1.png)

**Sentiment/Polarity Variables:**

When comparing variables measuring positive and negative polarities, there seems to be moderate to strong correlations.

![](/Users/Saara/Documents/NC%20State/ST558/Project%202/Project2/Reports/Saturday_Report_files/figure-markdown_github/Var_Explore5-1.png)![](/Users/Saara/Documents/NC%20State/ST558/Project%202/Project2/Reports/Saturday_Report_files/figure-markdown_github/Var_Explore5-2.png)

Modeling
--------

First, I will split the data into training and test sets. The training data set will contain 70% of the data observations, and the test set will contain the remaining 30%.

Dimensions of the train and test sets:

    ## [1] 1717   46

    ## [1] 736  46

### Linear Model

I will first begin by fitting a linear regression model with ALL of the variables.

Here is the summary of the first linear model. Looking at the t statistics and p-values, the majority of predictors are not statistically significant for predicting shares. The model overall is statistically significant, but has an incredibly low adjusted-R<sup>2</sup> value (0.0239).

    ## 
    ## Call:
    ## lm(formula = shares ~ ., data = dTrain)
    ## 
    ## Residuals:
    ##    Min     1Q Median     3Q    Max 
    ## -16813  -3141  -1259    804 599709 
    ## 
    ## Coefficients: (1 not defined because of singularities)
    ##                                 Estimate Std. Error t value Pr(>|t|)   
    ## (Intercept)                    5.760e+02  5.568e+03   0.103  0.91762   
    ## n_tokens_title                 3.086e+02  2.028e+02   1.521  0.12835   
    ## n_tokens_content              -1.299e+00  1.445e+00  -0.899  0.36892   
    ## n_unique_tokens               -7.903e+03  1.417e+04  -0.558  0.57715   
    ## n_non_stop_words               1.469e+03  1.169e+04   0.126  0.89998   
    ## n_non_stop_unique_tokens       2.078e+03  1.192e+04   0.174  0.86160   
    ## num_hrefs                      3.486e+01  4.357e+01   0.800  0.42384   
    ## num_self_hrefs                -1.202e+02  9.246e+01  -1.300  0.19364   
    ## num_imgs                       1.450e+01  5.789e+01   0.250  0.80228   
    ## num_videos                    -6.599e+00  1.144e+02  -0.058  0.95401   
    ## average_token_length           3.981e+02  1.799e+03   0.221  0.82483   
    ## num_keywords                   1.403e+02  2.586e+02   0.543  0.58753   
    ## data_channel_is_lifestyle     -4.219e+03  1.989e+03  -2.121  0.03404 * 
    ## data_channel_is_entertainment -4.460e+03  1.665e+03  -2.678  0.00748 **
    ## data_channel_is_bus           -3.207e+03  1.983e+03  -1.617  0.10603   
    ## data_channel_is_socmed        -4.873e+03  2.195e+03  -2.220  0.02657 * 
    ## data_channel_is_tech          -4.306e+03  1.724e+03  -2.497  0.01262 * 
    ## data_channel_is_world         -5.155e+03  1.905e+03  -2.706  0.00688 **
    ## kw_min_min                     2.370e+01  1.214e+01   1.952  0.05111 . 
    ## kw_max_min                    -1.463e-01  7.669e-01  -0.191  0.84873   
    ## kw_avg_min                     1.835e-01  4.642e+00   0.040  0.96847   
    ## kw_min_max                     6.196e-03  8.159e-03   0.759  0.44770   
    ## kw_max_max                    -6.155e-04  4.475e-03  -0.138  0.89062   
    ## kw_avg_max                    -6.724e-03  6.206e-03  -1.083  0.27875   
    ## kw_min_avg                     5.243e-01  5.041e-01   1.040  0.29852   
    ## kw_max_avg                    -3.328e-02  1.641e-01  -0.203  0.83930   
    ## kw_avg_avg                     4.455e-01  9.891e-01   0.450  0.65245   
    ## self_reference_min_shares      6.434e-02  8.856e-02   0.727  0.46760   
    ## self_reference_max_shares      5.803e-03  4.611e-02   0.126  0.89987   
    ## self_reference_avg_sharess     2.529e-02  1.163e-01   0.217  0.82794   
    ## global_subjectivity           -6.853e+03  6.215e+03  -1.103  0.27026   
    ## global_sentiment_polarity     -4.567e+03  1.202e+04  -0.380  0.70410   
    ## global_rate_positive_words    -3.731e+04  4.661e+04  -0.801  0.42350   
    ## global_rate_negative_words     8.234e+04  7.552e+04   1.090  0.27572   
    ## rate_positive_words            7.771e+03  7.402e+03   1.050  0.29394   
    ## rate_negative_words                   NA         NA      NA       NA   
    ## avg_positive_polarity          3.734e+03  9.902e+03   0.377  0.70616   
    ## min_positive_polarity         -1.300e+04  8.269e+03  -1.572  0.11605   
    ## max_positive_polarity         -1.513e+03  3.100e+03  -0.488  0.62556   
    ## avg_negative_polarity          2.954e+03  8.522e+03   0.347  0.72891   
    ## min_negative_polarity          1.346e+02  3.039e+03   0.044  0.96467   
    ## max_negative_polarity         -5.771e+03  6.982e+03  -0.827  0.40858   
    ## title_subjectivity             4.485e+02  1.870e+03   0.240  0.81050   
    ## title_sentiment_polarity       1.118e+03  1.833e+03   0.610  0.54203   
    ## abs_title_subjectivity         5.837e+03  2.500e+03   2.335  0.01967 * 
    ## abs_title_sentiment_polarity   1.569e+03  2.769e+03   0.567  0.57104   
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 16540 on 1672 degrees of freedom
    ## Multiple R-squared:  0.03552,    Adjusted R-squared:  0.01014 
    ## F-statistic: 1.399 on 44 and 1672 DF,  p-value: 0.04377

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
    ## -10585  -2659  -1415   -186 607591 
    ## 
    ## Coefficients:
    ##                                 Estimate Std. Error t value Pr(>|t|)   
    ## (Intercept)                    1.727e+03  3.569e+03   0.484  0.62843   
    ## data_channel_is_entertainment -1.143e+03  1.083e+03  -1.055  0.29141   
    ## kw_min_min                     2.344e+01  1.195e+01   1.961  0.05003 . 
    ## kw_max_max                    -1.917e-03  4.222e-03  -0.454  0.64981   
    ## kw_avg_max                    -1.333e-03  4.323e-03  -0.308  0.75794   
    ## kw_max_avg                    -2.132e-01  1.118e-01  -1.907  0.05674 . 
    ## kw_avg_avg                     1.748e+00  6.231e-01   2.805  0.00509 **
    ## min_positive_polarity         -4.984e+03  5.858e+03  -0.851  0.39499   
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 16530 on 1709 degrees of freedom
    ## Multiple R-squared:  0.01612,    Adjusted R-squared:  0.01209 
    ## F-statistic: 4.001 on 7 and 1709 DF,  p-value: 0.0002372

Looking at the plots for the model, it seems that there are leverage points affecting the predictions. ![](/Users/Saara/Documents/NC%20State/ST558/Project%202/Project2/Reports/Saturday_Report_files/figure-markdown_github/unnamed-chunk-2-1.png)

I will now remove the leverage points and create the final linear model. As seen below, the adjusted R<sup>2</sup> has improved a bit for about a 6% explanation of variability, but the RSE has reduced quite a bit. I am assuming that a non-linear model will perform much better for this prediction.

    ## 
    ## Call:
    ## lm(formula = shares ~ data_channel_is_entertainment + kw_min_min + 
    ##     kw_max_max + kw_avg_max + kw_max_avg + kw_avg_avg + min_positive_polarity, 
    ##     data = dTrain, weights = as.numeric(w))
    ## 
    ## Weighted Residuals:
    ##    Min     1Q Median     3Q    Max 
    ##  -5212  -1889  -1187     59  42900 
    ## 
    ## Coefficients:
    ##                                 Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)                    1.756e+03  9.419e+02   1.865   0.0624 .  
    ## data_channel_is_entertainment -6.776e+02  2.849e+02  -2.378   0.0175 *  
    ## kw_min_min                     4.239e+00  3.163e+00   1.340   0.1803    
    ## kw_max_max                     2.478e-04  1.115e-03   0.222   0.8241    
    ## kw_avg_max                    -1.216e-03  1.149e-03  -1.058   0.2901    
    ## kw_max_avg                    -6.714e-02  2.958e-02  -2.270   0.0234 *  
    ## kw_avg_avg                     6.953e-01  1.656e-01   4.200 2.81e-05 ***
    ## min_positive_polarity         -1.245e+03  1.552e+03  -0.802   0.4226    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 4339 on 1695 degrees of freedom
    ## Multiple R-squared:  0.02174,    Adjusted R-squared:  0.0177 
    ## F-statistic: 5.381 on 7 and 1695 DF,  p-value: 4.103e-06

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

-   The RMSE for the Linear Regression model on the test set is 5415.0648116.

-   The RMSE for the Regression Tree model on the test set is 5480.7911326.

-   The RMSE for the Bagged Tree model on the test set is 7798.6495045.

Conclusion
----------

Comparing the linear and non-linear methods based on test MSE, the Linear Regression model performed the best in predicting number of shares, despite having a high MSE and low adjusted R<sup>2</sup> on its own.
