README
================

Introduction
------------

    ##      url              timedelta     n_tokens_title n_tokens_content n_unique_tokens    n_non_stop_words   
    ##  Length:39644       Min.   :  8.0   Min.   : 2.0   Min.   :   0.0   Min.   :  0.0000   Min.   :   0.0000  
    ##  Class :character   1st Qu.:164.0   1st Qu.: 9.0   1st Qu.: 246.0   1st Qu.:  0.4709   1st Qu.:   1.0000  
    ##  Mode  :character   Median :339.0   Median :10.0   Median : 409.0   Median :  0.5392   Median :   1.0000  
    ##                     Mean   :354.5   Mean   :10.4   Mean   : 546.5   Mean   :  0.5482   Mean   :   0.9965  
    ##                     3rd Qu.:542.0   3rd Qu.:12.0   3rd Qu.: 716.0   3rd Qu.:  0.6087   3rd Qu.:   1.0000  
    ##                     Max.   :731.0   Max.   :23.0   Max.   :8474.0   Max.   :701.0000   Max.   :1042.0000  
    ##                                                                                                           
    ##  n_non_stop_unique_tokens   num_hrefs      num_self_hrefs       num_imgs         num_videos    average_token_length
    ##  Min.   :  0.0000         Min.   :  0.00   Min.   :  0.000   Min.   :  0.000   Min.   : 0.00   Min.   :0.000       
    ##  1st Qu.:  0.6257         1st Qu.:  4.00   1st Qu.:  1.000   1st Qu.:  1.000   1st Qu.: 0.00   1st Qu.:4.478       
    ##  Median :  0.6905         Median :  8.00   Median :  3.000   Median :  1.000   Median : 0.00   Median :4.664       
    ##  Mean   :  0.6892         Mean   : 10.88   Mean   :  3.294   Mean   :  4.544   Mean   : 1.25   Mean   :4.548       
    ##  3rd Qu.:  0.7546         3rd Qu.: 14.00   3rd Qu.:  4.000   3rd Qu.:  4.000   3rd Qu.: 1.00   3rd Qu.:4.855       
    ##  Max.   :650.0000         Max.   :304.00   Max.   :116.000   Max.   :128.000   Max.   :91.00   Max.   :8.042       
    ##                                                                                                                    
    ##   num_keywords    data_channel_is_lifestyle data_channel_is_entertainment data_channel_is_bus data_channel_is_socmed
    ##  Min.   : 1.000   Min.   :0.00000           Min.   :0.000                 Min.   :0.0000      Min.   :0.0000        
    ##  1st Qu.: 6.000   1st Qu.:0.00000           1st Qu.:0.000                 1st Qu.:0.0000      1st Qu.:0.0000        
    ##  Median : 7.000   Median :0.00000           Median :0.000                 Median :0.0000      Median :0.0000        
    ##  Mean   : 7.224   Mean   :0.05295           Mean   :0.178                 Mean   :0.1579      Mean   :0.0586        
    ##  3rd Qu.: 9.000   3rd Qu.:0.00000           3rd Qu.:0.000                 3rd Qu.:0.0000      3rd Qu.:0.0000        
    ##  Max.   :10.000   Max.   :1.00000           Max.   :1.000                 Max.   :1.0000      Max.   :1.0000        
    ##                                                                                                                     
    ##  data_channel_is_tech data_channel_is_world   kw_min_min       kw_max_min       kw_avg_min        kw_min_max       kw_max_max    
    ##  Min.   :0.0000       Min.   :0.0000        Min.   : -1.00   Min.   :     0   Min.   :   -1.0   Min.   :     0   Min.   :     0  
    ##  1st Qu.:0.0000       1st Qu.:0.0000        1st Qu.: -1.00   1st Qu.:   445   1st Qu.:  141.8   1st Qu.:     0   1st Qu.:843300  
    ##  Median :0.0000       Median :0.0000        Median : -1.00   Median :   660   Median :  235.5   Median :  1400   Median :843300  
    ##  Mean   :0.1853       Mean   :0.2126        Mean   : 26.11   Mean   :  1154   Mean   :  312.4   Mean   : 13612   Mean   :752324  
    ##  3rd Qu.:0.0000       3rd Qu.:0.0000        3rd Qu.:  4.00   3rd Qu.:  1000   3rd Qu.:  357.0   3rd Qu.:  7900   3rd Qu.:843300  
    ##  Max.   :1.0000       Max.   :1.0000        Max.   :377.00   Max.   :298400   Max.   :42827.9   Max.   :843300   Max.   :843300  
    ##                                                                                                                                  
    ##    kw_avg_max       kw_min_avg     kw_max_avg       kw_avg_avg    self_reference_min_shares self_reference_max_shares
    ##  Min.   :     0   Min.   :  -1   Min.   :     0   Min.   :    0   Min.   :     0            Min.   :     0           
    ##  1st Qu.:172847   1st Qu.:   0   1st Qu.:  3562   1st Qu.: 2382   1st Qu.:   639            1st Qu.:  1100           
    ##  Median :244572   Median :1024   Median :  4356   Median : 2870   Median :  1200            Median :  2800           
    ##  Mean   :259282   Mean   :1117   Mean   :  5657   Mean   : 3136   Mean   :  3999            Mean   : 10329           
    ##  3rd Qu.:330980   3rd Qu.:2057   3rd Qu.:  6020   3rd Qu.: 3600   3rd Qu.:  2600            3rd Qu.:  8000           
    ##  Max.   :843300   Max.   :3613   Max.   :298400   Max.   :43568   Max.   :843300            Max.   :843300           
    ##                                                                                                                      
    ##  self_reference_avg_sharess weekday_is_monday weekday_is_tuesday weekday_is_wednesday weekday_is_thursday weekday_is_friday
    ##  Min.   :     0.0           Min.   :0.000     Min.   :0.0000     Min.   :0.0000       Min.   :0.0000      Min.   :0.0000   
    ##  1st Qu.:   981.2           1st Qu.:0.000     1st Qu.:0.0000     1st Qu.:0.0000       1st Qu.:0.0000      1st Qu.:0.0000   
    ##  Median :  2200.0           Median :0.000     Median :0.0000     Median :0.0000       Median :0.0000      Median :0.0000   
    ##  Mean   :  6401.7           Mean   :0.168     Mean   :0.1864     Mean   :0.1875       Mean   :0.1833      Mean   :0.1438   
    ##  3rd Qu.:  5200.0           3rd Qu.:0.000     3rd Qu.:0.0000     3rd Qu.:0.0000       3rd Qu.:0.0000      3rd Qu.:0.0000   
    ##  Max.   :843300.0           Max.   :1.000     Max.   :1.0000     Max.   :1.0000       Max.   :1.0000      Max.   :1.0000   
    ##                                                                                                                            
    ##  weekday_is_saturday weekday_is_sunday   is_weekend         LDA_00            LDA_01            LDA_02            LDA_03       
    ##  Min.   :0.00000     Min.   :0.00000   Min.   :0.0000   Min.   :0.00000   Min.   :0.00000   Min.   :0.00000   Min.   :0.00000  
    ##  1st Qu.:0.00000     1st Qu.:0.00000   1st Qu.:0.0000   1st Qu.:0.02505   1st Qu.:0.02501   1st Qu.:0.02857   1st Qu.:0.02857  
    ##  Median :0.00000     Median :0.00000   Median :0.0000   Median :0.03339   Median :0.03334   Median :0.04000   Median :0.04000  
    ##  Mean   :0.06188     Mean   :0.06904   Mean   :0.1309   Mean   :0.18460   Mean   :0.14126   Mean   :0.21632   Mean   :0.22377  
    ##  3rd Qu.:0.00000     3rd Qu.:0.00000   3rd Qu.:0.0000   3rd Qu.:0.24096   3rd Qu.:0.15083   3rd Qu.:0.33422   3rd Qu.:0.37576  
    ##  Max.   :1.00000     Max.   :1.00000   Max.   :1.0000   Max.   :0.92699   Max.   :0.92595   Max.   :0.92000   Max.   :0.92653  
    ##                                                                                                                                
    ##      LDA_04        global_subjectivity global_sentiment_polarity global_rate_positive_words global_rate_negative_words
    ##  Min.   :0.00000   Min.   :0.0000      Min.   :-0.39375          Min.   :0.00000            Min.   :0.000000          
    ##  1st Qu.:0.02857   1st Qu.:0.3962      1st Qu.: 0.05776          1st Qu.:0.02838            1st Qu.:0.009615          
    ##  Median :0.04073   Median :0.4535      Median : 0.11912          Median :0.03902            Median :0.015337          
    ##  Mean   :0.23403   Mean   :0.4434      Mean   : 0.11931          Mean   :0.03962            Mean   :0.016612          
    ##  3rd Qu.:0.39999   3rd Qu.:0.5083      3rd Qu.: 0.17783          3rd Qu.:0.05028            3rd Qu.:0.021739          
    ##  Max.   :0.92719   Max.   :1.0000      Max.   : 0.72784          Max.   :0.15549            Max.   :0.184932          
    ##                                                                                                                       
    ##  rate_positive_words rate_negative_words avg_positive_polarity min_positive_polarity max_positive_polarity avg_negative_polarity
    ##  Min.   :0.0000      Min.   :0.0000      Min.   :0.0000        Min.   :0.00000       Min.   :0.0000        Min.   :-1.0000      
    ##  1st Qu.:0.6000      1st Qu.:0.1852      1st Qu.:0.3062        1st Qu.:0.05000       1st Qu.:0.6000        1st Qu.:-0.3284      
    ##  Median :0.7105      Median :0.2800      Median :0.3588        Median :0.10000       Median :0.8000        Median :-0.2533      
    ##  Mean   :0.6822      Mean   :0.2879      Mean   :0.3538        Mean   :0.09545       Mean   :0.7567        Mean   :-0.2595      
    ##  3rd Qu.:0.8000      3rd Qu.:0.3846      3rd Qu.:0.4114        3rd Qu.:0.10000       3rd Qu.:1.0000        3rd Qu.:-0.1869      
    ##  Max.   :1.0000      Max.   :1.0000      Max.   :1.0000        Max.   :1.00000       Max.   :1.0000        Max.   : 0.0000      
    ##                                                                                                                                 
    ##  min_negative_polarity max_negative_polarity title_subjectivity title_sentiment_polarity abs_title_subjectivity
    ##  Min.   :-1.0000       Min.   :-1.0000       Min.   :0.0000     Min.   :-1.00000         Min.   :0.0000        
    ##  1st Qu.:-0.7000       1st Qu.:-0.1250       1st Qu.:0.0000     1st Qu.: 0.00000         1st Qu.:0.1667        
    ##  Median :-0.5000       Median :-0.1000       Median :0.1500     Median : 0.00000         Median :0.5000        
    ##  Mean   :-0.5219       Mean   :-0.1075       Mean   :0.2824     Mean   : 0.07143         Mean   :0.3418        
    ##  3rd Qu.:-0.3000       3rd Qu.:-0.0500       3rd Qu.:0.5000     3rd Qu.: 0.15000         3rd Qu.:0.5000        
    ##  Max.   : 0.0000       Max.   : 0.0000       Max.   :1.0000     Max.   : 1.00000         Max.   :0.5000        
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

    ##      url              timedelta   n_tokens_title  n_tokens_content n_unique_tokens  n_non_stop_words n_non_stop_unique_tokens
    ##  Length:7435        Min.   :  8   Min.   : 4.00   Min.   :   0     Min.   :0.0000   Min.   :0.0000   Min.   :0.0000          
    ##  Class :character   1st Qu.:169   1st Qu.: 9.00   1st Qu.: 242     1st Qu.:0.4726   1st Qu.:1.0000   1st Qu.:0.6285          
    ##  Mode  :character   Median :344   Median :10.00   Median : 401     Median :0.5409   Median :1.0000   Median :0.6930          
    ##                     Mean   :359   Mean   :10.44   Mean   : 530     Mean   :0.5319   Mean   :0.9691   Mean   :0.6751          
    ##                     3rd Qu.:547   3rd Qu.:12.00   3rd Qu.: 699     3rd Qu.:0.6114   3rd Qu.:1.0000   3rd Qu.:0.7571          
    ##                     Max.   :729   Max.   :18.00   Max.   :7185     Max.   :0.9714   Max.   :1.0000   Max.   :1.0000          
    ##                                                                                                                              
    ##    num_hrefs      num_self_hrefs     num_imgs         num_videos     average_token_length  num_keywords   
    ##  Min.   :  0.00   Min.   : 0.00   Min.   :  0.000   Min.   : 0.000   Min.   :0.000        Min.   : 1.000  
    ##  1st Qu.:  4.00   1st Qu.: 1.00   1st Qu.:  1.000   1st Qu.: 0.000   1st Qu.:4.476        1st Qu.: 6.000  
    ##  Median :  7.00   Median : 2.00   Median :  1.000   Median : 0.000   Median :4.663        Median : 7.000  
    ##  Mean   : 10.12   Mean   : 3.13   Mean   :  4.117   Mean   : 1.238   Mean   :4.541        Mean   : 7.145  
    ##  3rd Qu.: 12.00   3rd Qu.: 4.00   3rd Qu.:  3.000   3rd Qu.: 1.000   3rd Qu.:4.852        3rd Qu.: 9.000  
    ##  Max.   :150.00   Max.   :43.00   Max.   :111.000   Max.   :73.000   Max.   :7.696        Max.   :10.000  
    ##                                                                                                           
    ##  data_channel_is_lifestyle data_channel_is_entertainment data_channel_is_bus data_channel_is_socmed data_channel_is_tech
    ##  Min.   :0.00000           Min.   :0.0000                Min.   :0.0000      Min.   :0.00000        Min.   :0.0000      
    ##  1st Qu.:0.00000           1st Qu.:0.0000                1st Qu.:0.0000      1st Qu.:0.00000        1st Qu.:0.0000      
    ##  Median :0.00000           Median :0.0000                Median :0.0000      Median :0.00000        Median :0.0000      
    ##  Mean   :0.05219           Mean   :0.1742                Mean   :0.1709      Mean   :0.05595        Mean   :0.1906      
    ##  3rd Qu.:0.00000           3rd Qu.:0.0000                3rd Qu.:0.0000      3rd Qu.:0.00000        3rd Qu.:0.0000      
    ##  Max.   :1.00000           Max.   :1.0000                Max.   :1.0000      Max.   :1.00000        Max.   :1.0000      
    ##                                                                                                                         
    ##  data_channel_is_world   kw_min_min      kw_max_min       kw_avg_min        kw_min_max       kw_max_max       kw_avg_max    
    ##  Min.   :0.0000        Min.   : -1.0   Min.   :     0   Min.   :   -1.0   Min.   :     0   Min.   : 17100   Min.   :  2240  
    ##  1st Qu.:0.0000        1st Qu.: -1.0   1st Qu.:   442   1st Qu.:  140.3   1st Qu.:     0   1st Qu.:766850   1st Qu.:172550  
    ##  Median :0.0000        Median : -1.0   Median :   654   Median :  236.1   Median :  1300   Median :843300   Median :245811  
    ##  Mean   :0.2105        Mean   : 26.8   Mean   :  1163   Mean   :  313.5   Mean   : 14791   Mean   :747462   Mean   :260980  
    ##  3rd Qu.:0.0000        3rd Qu.:  4.0   3rd Qu.:  1000   3rd Qu.:  355.8   3rd Qu.:  7600   3rd Qu.:843300   3rd Qu.:334690  
    ##  Max.   :1.0000        Max.   :294.0   Max.   :111300   Max.   :18687.8   Max.   :843300   Max.   :843300   Max.   :843300  
    ##                                                                                                                             
    ##    kw_min_avg     kw_max_avg       kw_avg_avg      self_reference_min_shares self_reference_max_shares self_reference_avg_sharess
    ##  Min.   :  -1   Min.   :  1953   Min.   :  424.3   Min.   :     0            Min.   :     0            Min.   :     0            
    ##  1st Qu.:   0   1st Qu.:  3531   1st Qu.: 2363.5   1st Qu.:   625            1st Qu.:  1000            1st Qu.:   959            
    ##  Median :1006   Median :  4272   Median : 2832.9   Median :  1200            Median :  2800            Median :  2200            
    ##  Mean   :1095   Mean   :  5588   Mean   : 3097.3   Mean   :  3883            Mean   : 10418            Mean   :  6505            
    ##  3rd Qu.:2000   3rd Qu.:  5927   3rd Qu.: 3536.2   3rd Qu.:  2700            3rd Qu.:  8000            3rd Qu.:  5100            
    ##  Max.   :3613   Max.   :135125   Max.   :21000.7   Max.   :690400            Max.   :837700            Max.   :690400            
    ##                                                                                                                                  
    ##  weekday_is_monday weekday_is_tuesday weekday_is_wednesday weekday_is_thursday weekday_is_friday weekday_is_saturday
    ##  Min.   :0         Min.   :0          Min.   :1            Min.   :0           Min.   :0         Min.   :0          
    ##  1st Qu.:0         1st Qu.:0          1st Qu.:1            1st Qu.:0           1st Qu.:0         1st Qu.:0          
    ##  Median :0         Median :0          Median :1            Median :0           Median :0         Median :0          
    ##  Mean   :0         Mean   :0          Mean   :1            Mean   :0           Mean   :0         Mean   :0          
    ##  3rd Qu.:0         3rd Qu.:0          3rd Qu.:1            3rd Qu.:0           3rd Qu.:0         3rd Qu.:0          
    ##  Max.   :0         Max.   :0          Max.   :1            Max.   :0           Max.   :0         Max.   :0          
    ##                                                                                                                     
    ##  weekday_is_sunday   is_weekend     LDA_00            LDA_01            LDA_02            LDA_03            LDA_04       
    ##  Min.   :0         Min.   :0    Min.   :0.01818   Min.   :0.01819   Min.   :0.01819   Min.   :0.01820   Min.   :0.01818  
    ##  1st Qu.:0         1st Qu.:0    1st Qu.:0.02516   1st Qu.:0.02503   1st Qu.:0.02857   1st Qu.:0.02857   1st Qu.:0.02858  
    ##  Median :0         Median :0    Median :0.03350   Median :0.03335   Median :0.04002   Median :0.04000   Median :0.05000  
    ##  Mean   :0         Mean   :0    Mean   :0.19185   Mean   :0.13725   Mean   :0.21711   Mean   :0.21560   Mean   :0.23819  
    ##  3rd Qu.:0         3rd Qu.:0    3rd Qu.:0.26595   3rd Qu.:0.14944   3rd Qu.:0.33277   3rd Qu.:0.34732   3rd Qu.:0.41225  
    ##  Max.   :0         Max.   :0    Max.   :0.92000   Max.   :0.91998   Max.   :0.92000   Max.   :0.91998   Max.   :0.92712  
    ##                                                                                                                          
    ##  global_subjectivity global_sentiment_polarity global_rate_positive_words global_rate_negative_words rate_positive_words
    ##  Min.   :0.0000      Min.   :-0.37500          Min.   :0.00000            Min.   :0.000000           Min.   :0.0000     
    ##  1st Qu.:0.3944      1st Qu.: 0.05973          1st Qu.:0.02822            1st Qu.:0.009406           1st Qu.:0.6000     
    ##  Median :0.4514      Median : 0.11983          Median :0.03881            Median :0.014989           Median :0.7143     
    ##  Mean   :0.4414      Mean   : 0.11929          Mean   :0.03944            Mean   :0.016247           Mean   :0.6847     
    ##  3rd Qu.:0.5053      3rd Qu.: 0.17736          3rd Qu.:0.04984            3rd Qu.:0.021456           3rd Qu.:0.8039     
    ##  Max.   :1.0000      Max.   : 0.57374          Max.   :0.15549            Max.   :0.085897           Max.   :1.0000     
    ##                                                                                                                         
    ##  rate_negative_words avg_positive_polarity min_positive_polarity max_positive_polarity avg_negative_polarity
    ##  Min.   :0.0000      Min.   :0.0000        Min.   :0.00000       Min.   :0.0000        Min.   :-1.0000      
    ##  1st Qu.:0.1818      1st Qu.:0.3064        1st Qu.:0.05000       1st Qu.:0.6000        1st Qu.:-0.3272      
    ##  Median :0.2759      Median :0.3582        Median :0.10000       Median :0.8000        Median :-0.2500      
    ##  Mean   :0.2844      Mean   :0.3522        Mean   :0.09522       Mean   :0.7506        Mean   :-0.2569      
    ##  3rd Qu.:0.3824      3rd Qu.:0.4086        3rd Qu.:0.10000       3rd Qu.:1.0000        3rd Qu.:-0.1833      
    ##  Max.   :1.0000      Max.   :1.0000        Max.   :1.00000       Max.   :1.0000        Max.   : 0.0000      
    ##                                                                                                             
    ##  min_negative_polarity max_negative_polarity title_subjectivity title_sentiment_polarity abs_title_subjectivity
    ##  Min.   :-1.0000       Min.   :-1.0000       Min.   :0.000      Min.   :-1.00000         Min.   :0.0000        
    ##  1st Qu.:-0.7000       1st Qu.:-0.1250       1st Qu.:0.000      1st Qu.: 0.00000         1st Qu.:0.1667        
    ##  Median :-0.5000       Median :-0.1000       Median :0.100      Median : 0.00000         Median :0.5000        
    ##  Mean   :-0.5146       Mean   :-0.1072       Mean   :0.275      Mean   : 0.06378         Mean   :0.3450        
    ##  3rd Qu.:-0.3000       3rd Qu.:-0.0500       3rd Qu.:0.500      3rd Qu.: 0.13636         3rd Qu.:0.5000        
    ##  Max.   : 0.0000       Max.   : 0.0000       Max.   :1.000      Max.   : 1.00000         Max.   :0.5000        
    ##                                                                                                                
    ##  abs_title_sentiment_polarity     shares                day      
    ##  Min.   :0.0000               Min.   :    23.0   Friday   :   0  
    ##  1st Qu.:0.0000               1st Qu.:   887.5   Monday   :   0  
    ##  Median :0.0000               Median :  1300.0   Saturday :   0  
    ##  Mean   :0.1504               Mean   :  3303.4   Sunday   :   0  
    ##  3rd Qu.:0.2500               3rd Qu.:  2600.0   Thursday :   0  
    ##  Max.   :1.0000               Max.   :843300.0   Tuesday  :   0  
    ##                                                  Wednesday:7435

    ## [1] 7435   62
