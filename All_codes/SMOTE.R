#SMOTE
SMOTEData <- SMOTE(LB ~ .,data, perc.over = 100,perc.under=200)
table(SMOTEData$LB)
