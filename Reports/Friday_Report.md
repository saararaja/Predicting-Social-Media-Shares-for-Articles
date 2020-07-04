
Project 2: Friday Data
======================

Introduction:
-------------

In this project I will be using the `OnlineNewsPopularity.csv` data, which is a data set about various articles that are published along with various article and publishing attributes. The goal of this project is to accurately predict the number of times that a particular article will be "shared" on social media given its attributes.

The data set contains articles that are published on all 7 days of the week. In this report, I will *only* be considering articles that were published on a **Friday**. In order to predict the number of shares, I will first build a Linear Regression model and then a Random Forest model on training data. I will then compare the performance of both on a test data set and select the final predictive model.

Data Summary
------------

Overall, the Online News Popularity data has *39644* observations and *62* variables. There are a total of *5701* observations for articles that were published on a Friday, and that is the subset of observations that I will be using for this report. From the initial variables, I will be considering *46* of them as potentially having an effect on number of shares.

There are 5 groups of variables that have similar themes in this data set. The variables within each group likely have high correlations with each other. The variable groups are about:

1.  Number of words/keywords/media

2.  Digital channel type

3.  Shares by keyword

4.  Typical shares of articles in Mashable

5.  Sentiment and Polarity

**Correlation Plots for Number of Word Variables:**

As seen below, many of the variables are highly correlated and might need to be removed.

![](/Users/Saara/Documents/NC%20State/ST558/Project%202/Project2/Reports/Friday_Report_files/figure-markdown_github/Var_Explore-1.png)

**Data Channel Type:**

A correlation plot of the data channel variables shows that each of them is mutually exclusive and therefore can be considered dummy variables for one categorical variable.

**Shares by Keyword Variables:**

As seen below, many of the variables seem correlated and might need to be removed.

![](/Users/Saara/Documents/NC%20State/ST558/Project%202/Project2/Reports/Friday_Report_files/figure-markdown_github/Var_Explore3-1.png)

**Mashable Shares Variables:**

These variables seem to have very similar distributions. It is not clear whether there will be any relationship with overall shares.

![](/Users/Saara/Documents/NC%20State/ST558/Project%202/Project2/Reports/Friday_Report_files/figure-markdown_github/Var_Explore4-1.png)

**Sentiment/Polarity Variables:**

When comparing variables measuring positive and negative polarities, there seems to be moderate to strong correlations.

![](/Users/Saara/Documents/NC%20State/ST558/Project%202/Project2/Reports/Friday_Report_files/figure-markdown_github/Var_Explore5-1.png)![](/Users/Saara/Documents/NC%20State/ST558/Project%202/Project2/Reports/Friday_Report_files/figure-markdown_github/Var_Explore5-2.png)

Modeling
--------

First, I will split the data into training and test sets. The training data set will contain 70% of the data observations, and the test set will contain the remaining 30%.

Dimensions of the train and test sets:

    ## [1] 3990   46

    ## [1] 1711   46

### Linear Model

I will first begin by fitting a linear regression model with ALL of the variables.

Here is the summary of the first linear model. Looking at the t statistics and p-values, the majority of predictors are not statistically significant for predicting shares. The model overall is statistically significant, but has an incredibly low adjusted-R<sup>2</sup> value (0.0239).

    ## 
    ## Call:
    ## lm(formula = shares ~ ., data = dTrain)
    ## 
    ## Residuals:
    ##    Min     1Q Median     3Q    Max 
    ## -11050  -2295  -1133     36 227614 
    ## 
    ## Coefficients: (1 not defined because of singularities)
    ##                                 Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)                    2.338e+03  1.944e+03   1.202 0.229323    
    ## n_tokens_title                 1.476e+01  6.929e+01   0.213 0.831326    
    ## n_tokens_content               1.382e+00  5.674e-01   2.436 0.014911 *  
    ## n_unique_tokens                1.001e+04  4.641e+03   2.158 0.031010 *  
    ## n_non_stop_words              -4.791e+03  3.941e+03  -1.215 0.224274    
    ## n_non_stop_unique_tokens      -6.105e+03  3.959e+03  -1.542 0.123154    
    ## num_hrefs                     -5.379e+00  1.608e+01  -0.334 0.738064    
    ## num_self_hrefs                -4.501e+01  4.383e+01  -1.027 0.304421    
    ## num_imgs                      -1.687e+01  2.127e+01  -0.793 0.427607    
    ## num_videos                    -3.519e+00  3.728e+01  -0.094 0.924802    
    ## average_token_length          -1.229e+02  5.786e+02  -0.212 0.831835    
    ## num_keywords                  -1.032e+01  9.078e+01  -0.114 0.909459    
    ## data_channel_is_lifestyle     -1.856e+03  8.083e+02  -2.296 0.021747 *  
    ## data_channel_is_entertainment -1.994e+03  5.971e+02  -3.339 0.000848 ***
    ## data_channel_is_bus           -1.993e+03  6.520e+02  -3.056 0.002259 ** 
    ## data_channel_is_socmed        -9.130e+02  7.753e+02  -1.178 0.239032    
    ## data_channel_is_tech          -1.343e+03  6.374e+02  -2.107 0.035143 *  
    ## data_channel_is_world         -2.173e+03  6.736e+02  -3.225 0.001269 ** 
    ## kw_min_min                     2.854e+00  4.191e+00   0.681 0.495926    
    ## kw_max_min                    -6.301e-02  1.330e-01  -0.474 0.635793    
    ## kw_avg_min                    -5.947e-01  6.516e-01  -0.913 0.361476    
    ## kw_min_max                     1.244e-03  3.371e-03   0.369 0.712183    
    ## kw_max_max                     1.133e-03  1.487e-03   0.762 0.445876    
    ## kw_avg_max                    -2.281e-03  2.004e-03  -1.138 0.255219    
    ## kw_min_avg                    -4.255e-01  1.878e-01  -2.266 0.023522 *  
    ## kw_max_avg                     2.779e-03  7.246e-02   0.038 0.969413    
    ## kw_avg_avg                     1.161e+00  3.644e-01   3.186 0.001453 ** 
    ## self_reference_min_shares     -2.612e-02  2.213e-02  -1.180 0.237987    
    ## self_reference_max_shares     -3.266e-02  1.458e-02  -2.240 0.025150 *  
    ## self_reference_avg_sharess     7.217e-02  3.445e-02   2.095 0.036272 *  
    ## global_subjectivity            3.392e+03  2.005e+03   1.692 0.090711 .  
    ## global_sentiment_polarity     -1.811e+03  3.868e+03  -0.468 0.639573    
    ## global_rate_positive_words    -1.224e+04  1.724e+04  -0.710 0.477775    
    ## global_rate_negative_words    -5.750e+03  3.167e+04  -0.182 0.855935    
    ## rate_positive_words            1.263e+03  2.659e+03   0.475 0.634873    
    ## rate_negative_words                   NA         NA      NA       NA    
    ## avg_positive_polarity          3.804e+03  3.306e+03   1.151 0.249871    
    ## min_positive_polarity         -4.560e+03  2.675e+03  -1.705 0.088365 .  
    ## max_positive_polarity         -7.532e+01  1.038e+03  -0.073 0.942149    
    ## avg_negative_polarity          1.537e+03  3.047e+03   0.505 0.613888    
    ## min_negative_polarity         -1.636e+03  1.113e+03  -1.470 0.141550    
    ## max_negative_polarity          3.709e+01  2.533e+03   0.015 0.988318    
    ## title_subjectivity             1.648e+02  6.684e+02   0.246 0.805325    
    ## title_sentiment_polarity       1.171e+03  6.099e+02   1.920 0.054958 .  
    ## abs_title_subjectivity        -2.563e+02  8.793e+02  -0.291 0.770743    
    ## abs_title_sentiment_polarity  -9.911e+02  9.785e+02  -1.013 0.311165    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 8793 on 3945 degrees of freedom
    ## Multiple R-squared:  0.04441,    Adjusted R-squared:  0.03375 
    ## F-statistic: 4.167 on 44 and 3945 DF,  p-value: < 2.2e-16

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
    ## -27356  -2226  -1456   -348 230614 
    ## 
    ## Coefficients:
    ##                                 Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)                   -4.024e+02  1.201e+03  -0.335   0.7375    
    ## data_channel_is_entertainment -3.652e+02  3.755e+02  -0.973   0.3309    
    ## kw_min_min                     2.255e+00  4.172e+00   0.541   0.5889    
    ## kw_max_max                     3.217e-04  1.437e-03   0.224   0.8228    
    ## kw_avg_max                    -1.196e-03  1.507e-03  -0.794   0.4274    
    ## kw_max_avg                    -1.476e-01  4.898e-02  -3.014   0.0026 ** 
    ## kw_avg_avg                     1.548e+00  2.260e-01   6.850  8.5e-12 ***
    ## min_positive_polarity         -1.149e+03  1.867e+03  -0.616   0.5382    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 8854 on 3982 degrees of freedom
    ## Multiple R-squared:  0.02203,    Adjusted R-squared:  0.02031 
    ## F-statistic: 12.82 on 7 and 3982 DF,  p-value: < 2.2e-16

Looking at the plots for the model, it seems that there are leverage points affecting the predictions. ![](/Users/Saara/Documents/NC%20State/ST558/Project%202/Project2/Reports/Friday_Report_files/figure-markdown_github/unnamed-chunk-2-1.png)

I will now remove the leverage points and create the final linear model. As seen below, the adjusted R<sup>2</sup> has improved a bit for about a 6% explanation of variability, but the RSE has reduced quite a bit. I am assuming that a non-linear model will perform much better for this prediction.

    ## 
    ## Call:
    ## lm(formula = shares ~ data_channel_is_entertainment + kw_min_min + 
    ##     kw_max_max + kw_avg_max + kw_max_avg + kw_avg_avg + min_positive_polarity, 
    ##     data = dTrain, weights = as.numeric(w))
    ## 
    ## Weighted Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -4537.1 -1377.1  -777.5   176.5 25916.6 
    ## 
    ## Coefficients:
    ##                                 Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)                    7.927e+02  4.034e+02   1.965 0.049500 *  
    ## data_channel_is_entertainment -5.537e+02  1.258e+02  -4.403 1.09e-05 ***
    ## kw_min_min                     1.088e+00  1.396e+00   0.779 0.435836    
    ## kw_max_max                    -5.486e-05  4.815e-04  -0.114 0.909295    
    ## kw_avg_max                    -1.882e-03  5.116e-04  -3.680 0.000237 ***
    ## kw_max_avg                    -9.675e-02  2.166e-02  -4.466 8.19e-06 ***
    ## kw_avg_avg                     9.789e-01  8.049e-02  12.162  < 2e-16 ***
    ## min_positive_polarity         -1.818e+03  6.591e+02  -2.759 0.005829 ** 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 2929 on 3898 degrees of freedom
    ## Multiple R-squared:  0.06061,    Adjusted R-squared:  0.05893 
    ## F-statistic: 35.93 on 7 and 3898 DF,  p-value: < 2.2e-16

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

-   The RMSE for the Linear Regression model on the test set is 5842.5499568.

-   The RMSE for the Regression Tree model on the test set is 5892.3879557.

-   The RMSE for the Bagged Tree model on the test set is 5882.4349044.

Conclusion
----------

Comparing the linear and non-linear methods based on test MSE, the Linear Regression model performed the best in predicting number of shares, despite having a high MSE and low adjusted R<sup>2</sup> on its own.
