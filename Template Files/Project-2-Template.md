
Project 2: Monday Data
======================

Introduction:
-------------

In this project I will be using the `OnlineNewsPopularity.csv` data, which is a data set about various articles that are published along with various article and publishing attributes. The goal of this project is to accurately predict the number of times that a particular article will be "shared" on social media given its attributes.

The data set contains articles that are published on all 7 days of the week. In this report, I will *only* be considering articles that were published on a **Monday**. In order to predict the number of shares, I will first build a Linear Regression model and then a Random Forest model on training data. I will then compare the performance of both on a test data set and select the final predictive model.

Data Summary
------------

    ##  n_tokens_title  n_tokens_content n_unique_tokens  n_non_stop_words
    ##  Min.   : 2.00   Min.   :   0.0   Min.   :0.0000   Min.   :0.0000  
    ##  1st Qu.: 9.00   1st Qu.: 249.0   1st Qu.:0.4742   1st Qu.:1.0000  
    ##  Median :10.00   Median : 400.0   Median :0.5420   Median :1.0000  
    ##  Mean   :10.42   Mean   : 543.9   Mean   :0.5314   Mean   :0.9715  
    ##  3rd Qu.:12.00   3rd Qu.: 720.0   3rd Qu.:0.6087   3rd Qu.:1.0000  
    ##  Max.   :18.00   Max.   :7764.0   Max.   :1.0000   Max.   :1.0000  
    ##  n_non_stop_unique_tokens   num_hrefs      num_self_hrefs      num_imgs     
    ##  Min.   :0.0000           Min.   :  0.00   Min.   : 0.000   Min.   : 0.000  
    ##  1st Qu.:0.6289           1st Qu.:  4.00   1st Qu.: 1.000   1st Qu.: 1.000  
    ##  Median :0.6923           Median :  7.00   Median : 3.000   Median : 1.000  
    ##  Mean   :0.6743           Mean   : 10.74   Mean   : 3.398   Mean   : 4.447  
    ##  3rd Qu.:0.7551           3rd Qu.: 13.00   3rd Qu.: 4.000   3rd Qu.: 3.000  
    ##  Max.   :1.0000           Max.   :162.00   Max.   :51.000   Max.   :93.000  
    ##    num_videos     average_token_length  num_keywords   
    ##  Min.   : 0.000   Min.   :0.000        Min.   : 1.000  
    ##  1st Qu.: 0.000   1st Qu.:4.479        1st Qu.: 6.000  
    ##  Median : 0.000   Median :4.656        Median : 7.000  
    ##  Mean   : 1.336   Mean   :4.547        Mean   : 7.141  
    ##  3rd Qu.: 1.000   3rd Qu.:4.841        3rd Qu.: 9.000  
    ##  Max.   :75.000   Max.   :8.042        Max.   :10.000  
    ##  data_channel_is_lifestyle data_channel_is_entertainment data_channel_is_bus
    ##  Min.   :0.00000           Min.   :0.0000                Min.   :0.0000     
    ##  1st Qu.:0.00000           1st Qu.:0.0000                1st Qu.:0.0000     
    ##  Median :0.00000           Median :0.0000                Median :0.0000     
    ##  Mean   :0.04834           Mean   :0.2039                Mean   :0.1731     
    ##  3rd Qu.:0.00000           3rd Qu.:0.0000                3rd Qu.:0.0000     
    ##  Max.   :1.00000           Max.   :1.0000                Max.   :1.0000     
    ##  data_channel_is_socmed data_channel_is_tech data_channel_is_world
    ##  Min.   :0.00000        Min.   :0.0000       Min.   :0.0000       
    ##  1st Qu.:0.00000        1st Qu.:0.0000       1st Qu.:0.0000       
    ##  Median :0.00000        Median :0.0000       Median :0.0000       
    ##  Mean   :0.05059        Mean   :0.1854       Mean   :0.2036       
    ##  3rd Qu.:0.00000        3rd Qu.:0.0000       3rd Qu.:0.0000       
    ##  Max.   :1.00000        Max.   :1.0000       Max.   :1.0000       
    ##    kw_min_min       kw_max_min       kw_avg_min        kw_min_max    
    ##  Min.   : -1.00   Min.   :     0   Min.   :   -1.0   Min.   :     0  
    ##  1st Qu.: -1.00   1st Qu.:   440   1st Qu.:  136.0   1st Qu.:     0  
    ##  Median : -1.00   Median :   648   Median :  229.2   Median :  1300  
    ##  Mean   : 26.28   Mean   :  1240   Mean   :  318.8   Mean   : 11781  
    ##  3rd Qu.:  4.00   3rd Qu.:  1000   3rd Qu.:  354.1   3rd Qu.:  7100  
    ##  Max.   :318.00   Max.   :298400   Max.   :42827.9   Max.   :843300  
    ##    kw_max_max       kw_avg_max       kw_min_avg       kw_max_avg    
    ##  Min.   :     0   Min.   :     0   Min.   :  -1.0   Min.   :     0  
    ##  1st Qu.:843300   1st Qu.:173688   1st Qu.:   0.0   1st Qu.:  3531  
    ##  Median :843300   Median :244636   Median : 975.4   Median :  4273  
    ##  Mean   :748525   Mean   :258792   Mean   :1074.8   Mean   :  5580  
    ##  3rd Qu.:843300   3rd Qu.:332686   3rd Qu.:1978.7   3rd Qu.:  5939  
    ##  Max.   :843300   Max.   :843300   Max.   :3602.1   Max.   :298400  
    ##    kw_avg_avg    self_reference_min_shares self_reference_max_shares
    ##  Min.   :    0   Min.   :     0            Min.   :     0           
    ##  1st Qu.: 2361   1st Qu.:   671            1st Qu.:  1100           
    ##  Median : 2841   Median :  1200            Median :  2900           
    ##  Mean   : 3076   Mean   :  3901            Mean   : 10074           
    ##  3rd Qu.: 3540   3rd Qu.:  2600            3rd Qu.:  8000           
    ##  Max.   :43568   Max.   :690400            Max.   :843300           
    ##  self_reference_avg_sharess global_subjectivity global_sentiment_polarity
    ##  Min.   :     0             Min.   :0.0000      Min.   :-0.38021         
    ##  1st Qu.:  1014             1st Qu.:0.3949      1st Qu.: 0.05588         
    ##  Median :  2200             Median :0.4516      Median : 0.11813         
    ##  Mean   :  6351             Mean   :0.4413      Mean   : 0.11721         
    ##  3rd Qu.:  5200             3rd Qu.:0.5051      3rd Qu.: 0.17503         
    ##  Max.   :690400             Max.   :1.0000      Max.   : 0.57551         
    ##  global_rate_positive_words global_rate_negative_words rate_positive_words
    ##  Min.   :0.00000            Min.   :0.000000           Min.   :0.0000     
    ##  1st Qu.:0.02846            1st Qu.:0.009749           1st Qu.:0.6000     
    ##  Median :0.03851            Median :0.015447           Median :0.7083     
    ##  Mean   :0.03932            Mean   :0.016821           Mean   :0.6806     
    ##  3rd Qu.:0.04985            3rd Qu.:0.021818           3rd Qu.:0.8000     
    ##  Max.   :0.13636            Max.   :0.092160           Max.   :1.0000     
    ##  rate_negative_words avg_positive_polarity min_positive_polarity
    ##  Min.   :0.0000      Min.   :0.0000        Min.   :0.00000      
    ##  1st Qu.:0.1864      1st Qu.:0.3056        1st Qu.:0.05000      
    ##  Median :0.2830      Median :0.3584        Median :0.10000      
    ##  Mean   :0.2907      Mean   :0.3545        Mean   :0.09525      
    ##  3rd Qu.:0.3846      3rd Qu.:0.4121        3rd Qu.:0.10000      
    ##  Max.   :1.0000      Max.   :1.0000        Max.   :1.00000      
    ##  max_positive_polarity avg_negative_polarity min_negative_polarity
    ##  Min.   :0.0000        Min.   :-1.0000       Min.   :-1.000       
    ##  1st Qu.:0.6000        1st Qu.:-0.3292       1st Qu.:-0.700       
    ##  Median :0.8000        Median :-0.2531       Median :-0.500       
    ##  Mean   :0.7603        Mean   :-0.2594       Mean   :-0.521       
    ##  3rd Qu.:1.0000        3rd Qu.:-0.1861       3rd Qu.:-0.300       
    ##  Max.   :1.0000        Max.   : 0.0000       Max.   : 0.000       
    ##  max_negative_polarity title_subjectivity title_sentiment_polarity
    ##  Min.   :-1.0000       Min.   :0.0000     Min.   :-1.00000        
    ##  1st Qu.:-0.1250       1st Qu.:0.0000     1st Qu.: 0.00000        
    ##  Median :-0.1000       Median :0.1000     Median : 0.00000        
    ##  Mean   :-0.1058       Mean   :0.2754     Mean   : 0.06549        
    ##  3rd Qu.:-0.0500       3rd Qu.:0.5000     3rd Qu.: 0.13636        
    ##  Max.   : 0.0000       Max.   :1.0000     Max.   : 1.00000        
    ##  abs_title_subjectivity abs_title_sentiment_polarity     shares      
    ##  Min.   :0.0000         Min.   :0.0000               Min.   :     1  
    ##  1st Qu.:0.1500         1st Qu.:0.0000               1st Qu.:   919  
    ##  Median :0.5000         Median :0.0000               Median :  1400  
    ##  Mean   :0.3408         Mean   :0.1509               Mean   :  3647  
    ##  3rd Qu.:0.5000         3rd Qu.:0.2500               3rd Qu.:  2700  
    ##  Max.   :0.5000         Max.   :1.0000               Max.   :690400

Overall, the Online News Popularity data has *39644* observations and *62* variables. There are a total of *6661* observations for articles that were published on a Monday, and that is the subset of observations that I will be using for this report.
