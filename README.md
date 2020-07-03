README
================

Introduction
------------

    ##      url              timedelta     n_tokens_title n_tokens_content
    ##  Length:39644       Min.   :  8.0   Min.   : 2.0   Min.   :   0.0  
    ##  Class :character   1st Qu.:164.0   1st Qu.: 9.0   1st Qu.: 246.0  
    ##  Mode  :character   Median :339.0   Median :10.0   Median : 409.0  
    ##                     Mean   :354.5   Mean   :10.4   Mean   : 546.5  
    ##                     3rd Qu.:542.0   3rd Qu.:12.0   3rd Qu.: 716.0  
    ##                     Max.   :731.0   Max.   :23.0   Max.   :8474.0  
    ##                                                                    
    ##  n_unique_tokens    n_non_stop_words    n_non_stop_unique_tokens
    ##  Min.   :  0.0000   Min.   :   0.0000   Min.   :  0.0000        
    ##  1st Qu.:  0.4709   1st Qu.:   1.0000   1st Qu.:  0.6257        
    ##  Median :  0.5392   Median :   1.0000   Median :  0.6905        
    ##  Mean   :  0.5482   Mean   :   0.9965   Mean   :  0.6892        
    ##  3rd Qu.:  0.6087   3rd Qu.:   1.0000   3rd Qu.:  0.7546        
    ##  Max.   :701.0000   Max.   :1042.0000   Max.   :650.0000        
    ##                                                                 
    ##    num_hrefs      num_self_hrefs       num_imgs         num_videos   
    ##  Min.   :  0.00   Min.   :  0.000   Min.   :  0.000   Min.   : 0.00  
    ##  1st Qu.:  4.00   1st Qu.:  1.000   1st Qu.:  1.000   1st Qu.: 0.00  
    ##  Median :  8.00   Median :  3.000   Median :  1.000   Median : 0.00  
    ##  Mean   : 10.88   Mean   :  3.294   Mean   :  4.544   Mean   : 1.25  
    ##  3rd Qu.: 14.00   3rd Qu.:  4.000   3rd Qu.:  4.000   3rd Qu.: 1.00  
    ##  Max.   :304.00   Max.   :116.000   Max.   :128.000   Max.   :91.00  
    ##                                                                      
    ##  average_token_length  num_keywords    data_channel_is_lifestyle
    ##  Min.   :0.000        Min.   : 1.000   Min.   :0.00000          
    ##  1st Qu.:4.478        1st Qu.: 6.000   1st Qu.:0.00000          
    ##  Median :4.664        Median : 7.000   Median :0.00000          
    ##  Mean   :4.548        Mean   : 7.224   Mean   :0.05295          
    ##  3rd Qu.:4.855        3rd Qu.: 9.000   3rd Qu.:0.00000          
    ##  Max.   :8.042        Max.   :10.000   Max.   :1.00000          
    ##                                                                 
    ##  data_channel_is_entertainment data_channel_is_bus data_channel_is_socmed
    ##  Min.   :0.000                 Min.   :0.0000      Min.   :0.0000        
    ##  1st Qu.:0.000                 1st Qu.:0.0000      1st Qu.:0.0000        
    ##  Median :0.000                 Median :0.0000      Median :0.0000        
    ##  Mean   :0.178                 Mean   :0.1579      Mean   :0.0586        
    ##  3rd Qu.:0.000                 3rd Qu.:0.0000      3rd Qu.:0.0000        
    ##  Max.   :1.000                 Max.   :1.0000      Max.   :1.0000        
    ##                                                                          
    ##  data_channel_is_tech data_channel_is_world   kw_min_min       kw_max_min    
    ##  Min.   :0.0000       Min.   :0.0000        Min.   : -1.00   Min.   :     0  
    ##  1st Qu.:0.0000       1st Qu.:0.0000        1st Qu.: -1.00   1st Qu.:   445  
    ##  Median :0.0000       Median :0.0000        Median : -1.00   Median :   660  
    ##  Mean   :0.1853       Mean   :0.2126        Mean   : 26.11   Mean   :  1154  
    ##  3rd Qu.:0.0000       3rd Qu.:0.0000        3rd Qu.:  4.00   3rd Qu.:  1000  
    ##  Max.   :1.0000       Max.   :1.0000        Max.   :377.00   Max.   :298400  
    ##                                                                              
    ##    kw_avg_min        kw_min_max       kw_max_max       kw_avg_max    
    ##  Min.   :   -1.0   Min.   :     0   Min.   :     0   Min.   :     0  
    ##  1st Qu.:  141.8   1st Qu.:     0   1st Qu.:843300   1st Qu.:172847  
    ##  Median :  235.5   Median :  1400   Median :843300   Median :244572  
    ##  Mean   :  312.4   Mean   : 13612   Mean   :752324   Mean   :259282  
    ##  3rd Qu.:  357.0   3rd Qu.:  7900   3rd Qu.:843300   3rd Qu.:330980  
    ##  Max.   :42827.9   Max.   :843300   Max.   :843300   Max.   :843300  
    ##                                                                      
    ##    kw_min_avg     kw_max_avg       kw_avg_avg    self_reference_min_shares
    ##  Min.   :  -1   Min.   :     0   Min.   :    0   Min.   :     0           
    ##  1st Qu.:   0   1st Qu.:  3562   1st Qu.: 2382   1st Qu.:   639           
    ##  Median :1024   Median :  4356   Median : 2870   Median :  1200           
    ##  Mean   :1117   Mean   :  5657   Mean   : 3136   Mean   :  3999           
    ##  3rd Qu.:2057   3rd Qu.:  6020   3rd Qu.: 3600   3rd Qu.:  2600           
    ##  Max.   :3613   Max.   :298400   Max.   :43568   Max.   :843300           
    ##                                                                           
    ##  self_reference_max_shares self_reference_avg_sharess weekday_is_monday
    ##  Min.   :     0            Min.   :     0.0           Min.   :0.000    
    ##  1st Qu.:  1100            1st Qu.:   981.2           1st Qu.:0.000    
    ##  Median :  2800            Median :  2200.0           Median :0.000    
    ##  Mean   : 10329            Mean   :  6401.7           Mean   :0.168    
    ##  3rd Qu.:  8000            3rd Qu.:  5200.0           3rd Qu.:0.000    
    ##  Max.   :843300            Max.   :843300.0           Max.   :1.000    
    ##                                                                        
    ##  weekday_is_tuesday weekday_is_wednesday weekday_is_thursday weekday_is_friday
    ##  Min.   :0.0000     Min.   :0.0000       Min.   :0.0000      Min.   :0.0000   
    ##  1st Qu.:0.0000     1st Qu.:0.0000       1st Qu.:0.0000      1st Qu.:0.0000   
    ##  Median :0.0000     Median :0.0000       Median :0.0000      Median :0.0000   
    ##  Mean   :0.1864     Mean   :0.1875       Mean   :0.1833      Mean   :0.1438   
    ##  3rd Qu.:0.0000     3rd Qu.:0.0000       3rd Qu.:0.0000      3rd Qu.:0.0000   
    ##  Max.   :1.0000     Max.   :1.0000       Max.   :1.0000      Max.   :1.0000   
    ##                                                                               
    ##  weekday_is_saturday weekday_is_sunday   is_weekend         LDA_00       
    ##  Min.   :0.00000     Min.   :0.00000   Min.   :0.0000   Min.   :0.00000  
    ##  1st Qu.:0.00000     1st Qu.:0.00000   1st Qu.:0.0000   1st Qu.:0.02505  
    ##  Median :0.00000     Median :0.00000   Median :0.0000   Median :0.03339  
    ##  Mean   :0.06188     Mean   :0.06904   Mean   :0.1309   Mean   :0.18460  
    ##  3rd Qu.:0.00000     3rd Qu.:0.00000   3rd Qu.:0.0000   3rd Qu.:0.24096  
    ##  Max.   :1.00000     Max.   :1.00000   Max.   :1.0000   Max.   :0.92699  
    ##                                                                          
    ##      LDA_01            LDA_02            LDA_03            LDA_04       
    ##  Min.   :0.00000   Min.   :0.00000   Min.   :0.00000   Min.   :0.00000  
    ##  1st Qu.:0.02501   1st Qu.:0.02857   1st Qu.:0.02857   1st Qu.:0.02857  
    ##  Median :0.03334   Median :0.04000   Median :0.04000   Median :0.04073  
    ##  Mean   :0.14126   Mean   :0.21632   Mean   :0.22377   Mean   :0.23403  
    ##  3rd Qu.:0.15083   3rd Qu.:0.33422   3rd Qu.:0.37576   3rd Qu.:0.39999  
    ##  Max.   :0.92595   Max.   :0.92000   Max.   :0.92653   Max.   :0.92719  
    ##                                                                         
    ##  global_subjectivity global_sentiment_polarity global_rate_positive_words
    ##  Min.   :0.0000      Min.   :-0.39375          Min.   :0.00000           
    ##  1st Qu.:0.3962      1st Qu.: 0.05776          1st Qu.:0.02838           
    ##  Median :0.4535      Median : 0.11912          Median :0.03902           
    ##  Mean   :0.4434      Mean   : 0.11931          Mean   :0.03962           
    ##  3rd Qu.:0.5083      3rd Qu.: 0.17783          3rd Qu.:0.05028           
    ##  Max.   :1.0000      Max.   : 0.72784          Max.   :0.15549           
    ##                                                                          
    ##  global_rate_negative_words rate_positive_words rate_negative_words
    ##  Min.   :0.000000           Min.   :0.0000      Min.   :0.0000     
    ##  1st Qu.:0.009615           1st Qu.:0.6000      1st Qu.:0.1852     
    ##  Median :0.015337           Median :0.7105      Median :0.2800     
    ##  Mean   :0.016612           Mean   :0.6822      Mean   :0.2879     
    ##  3rd Qu.:0.021739           3rd Qu.:0.8000      3rd Qu.:0.3846     
    ##  Max.   :0.184932           Max.   :1.0000      Max.   :1.0000     
    ##                                                                    
    ##  avg_positive_polarity min_positive_polarity max_positive_polarity
    ##  Min.   :0.0000        Min.   :0.00000       Min.   :0.0000       
    ##  1st Qu.:0.3062        1st Qu.:0.05000       1st Qu.:0.6000       
    ##  Median :0.3588        Median :0.10000       Median :0.8000       
    ##  Mean   :0.3538        Mean   :0.09545       Mean   :0.7567       
    ##  3rd Qu.:0.4114        3rd Qu.:0.10000       3rd Qu.:1.0000       
    ##  Max.   :1.0000        Max.   :1.00000       Max.   :1.0000       
    ##                                                                   
    ##  avg_negative_polarity min_negative_polarity max_negative_polarity
    ##  Min.   :-1.0000       Min.   :-1.0000       Min.   :-1.0000      
    ##  1st Qu.:-0.3284       1st Qu.:-0.7000       1st Qu.:-0.1250      
    ##  Median :-0.2533       Median :-0.5000       Median :-0.1000      
    ##  Mean   :-0.2595       Mean   :-0.5219       Mean   :-0.1075      
    ##  3rd Qu.:-0.1869       3rd Qu.:-0.3000       3rd Qu.:-0.0500      
    ##  Max.   : 0.0000       Max.   : 0.0000       Max.   : 0.0000      
    ##                                                                   
    ##  title_subjectivity title_sentiment_polarity abs_title_subjectivity
    ##  Min.   :0.0000     Min.   :-1.00000         Min.   :0.0000        
    ##  1st Qu.:0.0000     1st Qu.: 0.00000         1st Qu.:0.1667        
    ##  Median :0.1500     Median : 0.00000         Median :0.5000        
    ##  Mean   :0.2824     Mean   : 0.07143         Mean   :0.3418        
    ##  3rd Qu.:0.5000     3rd Qu.: 0.15000         3rd Qu.:0.5000        
    ##  Max.   :1.0000     Max.   : 1.00000         Max.   :0.5000        
    ##                                                                    
    ##  abs_title_sentiment_polarity     shares              day      
    ##  Min.   :0.0000               Min.   :     1   Friday   :5701  
    ##  1st Qu.:0.0000               1st Qu.:   946   Monday   :6661  
    ##  Median :0.0000               Median :  1400   Saturday :2453  
    ##  Mean   :0.1561               Mean   :  3395   Sunday   :2737  
    ##  3rd Qu.:0.2500               3rd Qu.:  2800   Thursday :7267  
    ##  Max.   :1.0000               Max.   :843300   Tuesday  :7390  
    ##                                                Wednesday:7435

    ## [1] 39644    62

    ##      url              timedelta     n_tokens_title  n_tokens_content
    ##  Length:6661        Min.   : 10.0   Min.   : 2.00   Min.   :   0.0  
    ##  Class :character   1st Qu.:164.0   1st Qu.: 9.00   1st Qu.: 249.0  
    ##  Mode  :character   Median :332.0   Median :10.00   Median : 400.0  
    ##                     Mean   :351.6   Mean   :10.42   Mean   : 543.9  
    ##                     3rd Qu.:542.0   3rd Qu.:12.00   3rd Qu.: 720.0  
    ##                     Max.   :731.0   Max.   :18.00   Max.   :7764.0  
    ##                                                                     
    ##  n_unique_tokens  n_non_stop_words n_non_stop_unique_tokens   num_hrefs     
    ##  Min.   :0.0000   Min.   :0.0000   Min.   :0.0000           Min.   :  0.00  
    ##  1st Qu.:0.4742   1st Qu.:1.0000   1st Qu.:0.6289           1st Qu.:  4.00  
    ##  Median :0.5420   Median :1.0000   Median :0.6923           Median :  7.00  
    ##  Mean   :0.5314   Mean   :0.9715   Mean   :0.6743           Mean   : 10.74  
    ##  3rd Qu.:0.6087   3rd Qu.:1.0000   3rd Qu.:0.7551           3rd Qu.: 13.00  
    ##  Max.   :1.0000   Max.   :1.0000   Max.   :1.0000           Max.   :162.00  
    ##                                                                             
    ##  num_self_hrefs      num_imgs        num_videos     average_token_length
    ##  Min.   : 0.000   Min.   : 0.000   Min.   : 0.000   Min.   :0.000       
    ##  1st Qu.: 1.000   1st Qu.: 1.000   1st Qu.: 0.000   1st Qu.:4.479       
    ##  Median : 3.000   Median : 1.000   Median : 0.000   Median :4.656       
    ##  Mean   : 3.398   Mean   : 4.447   Mean   : 1.336   Mean   :4.547       
    ##  3rd Qu.: 4.000   3rd Qu.: 3.000   3rd Qu.: 1.000   3rd Qu.:4.841       
    ##  Max.   :51.000   Max.   :93.000   Max.   :75.000   Max.   :8.042       
    ##                                                                         
    ##   num_keywords    data_channel_is_lifestyle data_channel_is_entertainment
    ##  Min.   : 1.000   Min.   :0.00000           Min.   :0.0000               
    ##  1st Qu.: 6.000   1st Qu.:0.00000           1st Qu.:0.0000               
    ##  Median : 7.000   Median :0.00000           Median :0.0000               
    ##  Mean   : 7.141   Mean   :0.04834           Mean   :0.2039               
    ##  3rd Qu.: 9.000   3rd Qu.:0.00000           3rd Qu.:0.0000               
    ##  Max.   :10.000   Max.   :1.00000           Max.   :1.0000               
    ##                                                                          
    ##  data_channel_is_bus data_channel_is_socmed data_channel_is_tech
    ##  Min.   :0.0000      Min.   :0.00000        Min.   :0.0000      
    ##  1st Qu.:0.0000      1st Qu.:0.00000        1st Qu.:0.0000      
    ##  Median :0.0000      Median :0.00000        Median :0.0000      
    ##  Mean   :0.1731      Mean   :0.05059        Mean   :0.1854      
    ##  3rd Qu.:0.0000      3rd Qu.:0.00000        3rd Qu.:0.0000      
    ##  Max.   :1.0000      Max.   :1.00000        Max.   :1.0000      
    ##                                                                 
    ##  data_channel_is_world   kw_min_min       kw_max_min       kw_avg_min     
    ##  Min.   :0.0000        Min.   : -1.00   Min.   :     0   Min.   :   -1.0  
    ##  1st Qu.:0.0000        1st Qu.: -1.00   1st Qu.:   440   1st Qu.:  136.0  
    ##  Median :0.0000        Median : -1.00   Median :   648   Median :  229.2  
    ##  Mean   :0.2036        Mean   : 26.28   Mean   :  1240   Mean   :  318.8  
    ##  3rd Qu.:0.0000        3rd Qu.:  4.00   3rd Qu.:  1000   3rd Qu.:  354.1  
    ##  Max.   :1.0000        Max.   :318.00   Max.   :298400   Max.   :42827.9  
    ##                                                                           
    ##    kw_min_max       kw_max_max       kw_avg_max       kw_min_avg    
    ##  Min.   :     0   Min.   :     0   Min.   :     0   Min.   :  -1.0  
    ##  1st Qu.:     0   1st Qu.:843300   1st Qu.:173688   1st Qu.:   0.0  
    ##  Median :  1300   Median :843300   Median :244636   Median : 975.4  
    ##  Mean   : 11781   Mean   :748525   Mean   :258792   Mean   :1074.8  
    ##  3rd Qu.:  7100   3rd Qu.:843300   3rd Qu.:332686   3rd Qu.:1978.7  
    ##  Max.   :843300   Max.   :843300   Max.   :843300   Max.   :3602.1  
    ##                                                                     
    ##    kw_max_avg       kw_avg_avg    self_reference_min_shares
    ##  Min.   :     0   Min.   :    0   Min.   :     0           
    ##  1st Qu.:  3531   1st Qu.: 2361   1st Qu.:   671           
    ##  Median :  4273   Median : 2841   Median :  1200           
    ##  Mean   :  5580   Mean   : 3076   Mean   :  3901           
    ##  3rd Qu.:  5939   3rd Qu.: 3540   3rd Qu.:  2600           
    ##  Max.   :298400   Max.   :43568   Max.   :690400           
    ##                                                            
    ##  self_reference_max_shares self_reference_avg_sharess weekday_is_monday
    ##  Min.   :     0            Min.   :     0             Min.   :1        
    ##  1st Qu.:  1100            1st Qu.:  1014             1st Qu.:1        
    ##  Median :  2900            Median :  2200             Median :1        
    ##  Mean   : 10074            Mean   :  6351             Mean   :1        
    ##  3rd Qu.:  8000            3rd Qu.:  5200             3rd Qu.:1        
    ##  Max.   :843300            Max.   :690400             Max.   :1        
    ##                                                                        
    ##  weekday_is_tuesday weekday_is_wednesday weekday_is_thursday weekday_is_friday
    ##  Min.   :0          Min.   :0            Min.   :0           Min.   :0        
    ##  1st Qu.:0          1st Qu.:0            1st Qu.:0           1st Qu.:0        
    ##  Median :0          Median :0            Median :0           Median :0        
    ##  Mean   :0          Mean   :0            Mean   :0           Mean   :0        
    ##  3rd Qu.:0          3rd Qu.:0            3rd Qu.:0           3rd Qu.:0        
    ##  Max.   :0          Max.   :0            Max.   :0           Max.   :0        
    ##                                                                               
    ##  weekday_is_saturday weekday_is_sunday   is_weekend     LDA_00       
    ##  Min.   :0           Min.   :0         Min.   :0    Min.   :0.01818  
    ##  1st Qu.:0           1st Qu.:0         1st Qu.:0    1st Qu.:0.02520  
    ##  Median :0           Median :0         Median :0    Median :0.03345  
    ##  Mean   :0           Mean   :0         Mean   :0    Mean   :0.18954  
    ##  3rd Qu.:0           3rd Qu.:0         3rd Qu.:0    3rd Qu.:0.25776  
    ##  Max.   :0           Max.   :0         Max.   :0    Max.   :0.91999  
    ##                                                                      
    ##      LDA_01            LDA_02            LDA_03            LDA_04       
    ##  Min.   :0.01819   Min.   :0.01819   Min.   :0.01819   Min.   :0.01818  
    ##  1st Qu.:0.02504   1st Qu.:0.02857   1st Qu.:0.02857   1st Qu.:0.02857  
    ##  Median :0.03337   Median :0.04000   Median :0.04000   Median :0.04005  
    ##  Mean   :0.15297   Mean   :0.20648   Mean   :0.21816   Mean   :0.23285  
    ##  3rd Qu.:0.17249   3rd Qu.:0.31581   3rd Qu.:0.35101   3rd Qu.:0.40040  
    ##  Max.   :0.91997   Max.   :0.92000   Max.   :0.92653   Max.   :0.92708  
    ##                                                                         
    ##  global_subjectivity global_sentiment_polarity global_rate_positive_words
    ##  Min.   :0.0000      Min.   :-0.38021          Min.   :0.00000           
    ##  1st Qu.:0.3949      1st Qu.: 0.05588          1st Qu.:0.02846           
    ##  Median :0.4516      Median : 0.11813          Median :0.03851           
    ##  Mean   :0.4413      Mean   : 0.11721          Mean   :0.03932           
    ##  3rd Qu.:0.5051      3rd Qu.: 0.17503          3rd Qu.:0.04985           
    ##  Max.   :1.0000      Max.   : 0.57551          Max.   :0.13636           
    ##                                                                          
    ##  global_rate_negative_words rate_positive_words rate_negative_words
    ##  Min.   :0.000000           Min.   :0.0000      Min.   :0.0000     
    ##  1st Qu.:0.009749           1st Qu.:0.6000      1st Qu.:0.1864     
    ##  Median :0.015447           Median :0.7083      Median :0.2830     
    ##  Mean   :0.016821           Mean   :0.6806      Mean   :0.2907     
    ##  3rd Qu.:0.021818           3rd Qu.:0.8000      3rd Qu.:0.3846     
    ##  Max.   :0.092160           Max.   :1.0000      Max.   :1.0000     
    ##                                                                    
    ##  avg_positive_polarity min_positive_polarity max_positive_polarity
    ##  Min.   :0.0000        Min.   :0.00000       Min.   :0.0000       
    ##  1st Qu.:0.3056        1st Qu.:0.05000       1st Qu.:0.6000       
    ##  Median :0.3584        Median :0.10000       Median :0.8000       
    ##  Mean   :0.3545        Mean   :0.09525       Mean   :0.7603       
    ##  3rd Qu.:0.4121        3rd Qu.:0.10000       3rd Qu.:1.0000       
    ##  Max.   :1.0000        Max.   :1.00000       Max.   :1.0000       
    ##                                                                   
    ##  avg_negative_polarity min_negative_polarity max_negative_polarity
    ##  Min.   :-1.0000       Min.   :-1.000        Min.   :-1.0000      
    ##  1st Qu.:-0.3292       1st Qu.:-0.700        1st Qu.:-0.1250      
    ##  Median :-0.2531       Median :-0.500        Median :-0.1000      
    ##  Mean   :-0.2594       Mean   :-0.521        Mean   :-0.1058      
    ##  3rd Qu.:-0.1861       3rd Qu.:-0.300        3rd Qu.:-0.0500      
    ##  Max.   : 0.0000       Max.   : 0.000        Max.   : 0.0000      
    ##                                                                   
    ##  title_subjectivity title_sentiment_polarity abs_title_subjectivity
    ##  Min.   :0.0000     Min.   :-1.00000         Min.   :0.0000        
    ##  1st Qu.:0.0000     1st Qu.: 0.00000         1st Qu.:0.1500        
    ##  Median :0.1000     Median : 0.00000         Median :0.5000        
    ##  Mean   :0.2754     Mean   : 0.06549         Mean   :0.3408        
    ##  3rd Qu.:0.5000     3rd Qu.: 0.13636         3rd Qu.:0.5000        
    ##  Max.   :1.0000     Max.   : 1.00000         Max.   :0.5000        
    ##                                                                    
    ##  abs_title_sentiment_polarity     shares              day      
    ##  Min.   :0.0000               Min.   :     1   Friday   :   0  
    ##  1st Qu.:0.0000               1st Qu.:   919   Monday   :6661  
    ##  Median :0.0000               Median :  1400   Saturday :   0  
    ##  Mean   :0.1509               Mean   :  3647   Sunday   :   0  
    ##  3rd Qu.:0.2500               3rd Qu.:  2700   Thursday :   0  
    ##  Max.   :1.0000               Max.   :690400   Tuesday  :   0  
    ##                                                Wednesday:   0

    ## [1] 6661   62
