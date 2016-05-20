---
title       : R Shiny application & Titanic prediction
subtitle    : Would you survive from the Titanic disaster?
author      : Molina Rafidison
job         : Data products
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## WHY

The reason why this application was made:  
    
- To try out reproducible data products  
- To understand how R Shiny works  
- To test machine learning in an application  
- To have fun and play!  

Feel free to play with it at the [following link](http://theyanike.shinyapps.io/titanic-app).  
  
**Note: The accuracy of the model used for the prediction is not 100% accurate.**
  
This project is included in the Data products course from the Data Science Specialization.  
It is supplied by John Hopkins University on Coursera.

--- .class #what 

## WHAT

The application is based on the `Titanic` dataset availaible in the `datasets` package.


```r
library(datasets); data(Titanic)

Titanic <- as.data.frame(Titanic)
rows <- rep(1:nrow(Titanic) ,Titanic[ , 5])
Titanic <- Titanic[rows, -5]

head(Titanic, 2)
```

```
##     Class  Sex   Age Survived
## 3     3rd Male Child       No
## 3.1   3rd Male Child       No
```

The application tells whether one would have survived from the Titanic disaster based on the gender, the age and the class prefered. It aims to be simple and fun!

--- .class #how

## HOW

The output is computed thanks to a machine learning algorithm, `randomForest`.

The model is trained on the original dataset and it then computes the predicted result according to the player's inputs.  
The inputs are converted to be run in the following algorithm:


```r
rfModel <- randomForest(Survived ~ ., data = Titanic, mtry = 2)
```

The first answer is a "Yes" if one survives or a "No" if not.
The second is the probability to survive if "Yes" or to die if "No".

--- .class #play 

## WANT TO PLAY?

The intructions are very simple!

Don't pay attention to the first results that are displayed. They correspond to the default inputs.  
  
1. Follow the three steps in the left sidebar of the application. You will have to enter a gender, an age and a class.
2. Then click on the 'Embark' button to submit your inputs. For information, there is no data collected on this page.
3. See how your inputs are converted on the right and read the answer you were waiting for! 

Good luck!

