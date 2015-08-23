install.packages("AppliedPredictiveModeling")
install.packages("caret")

library(AppliedPredictiveModeling)
library(caret)
data(AlzheimerDisease)


library(AppliedPredictiveModeling)
data(concrete)
library(caret)
set.seed(1000)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]

qplot(Superplasticizer, data=training)
ggplot(data=training, aes(x=Superplasticizer)) + geom_histogram() + theme_bw()
