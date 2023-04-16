#' 機器學習預測模型
#' 方便快速替換不同模型
#' @param train_set 訓練集
#' @param test_set 測試集
#' @param equation 方程式
#' @param mode SVM, randomForest (default), rpart(DT), glm
#' @param pred_type 預測回傳值的類型 (response, class ...)
#' @return 回傳預測結果
#' @export

ML_prediction<- function(train_set, test_set, response, variables, mode="randomForest", pred_type = "class"){
    formula_ <- formula(paste0(c(response,paste0(variables,collapse="+")),collapse="~"))
    algorithm <- get(mode)
    model <- algorithm(formula_ , train_set)
    pred_train <- predict(model, train_set, type = pred_type)
    
    conf_mat <- table(real = train_set$"response" , predict= pred_train ) #confusion matrix
    accuracy <- sum(diag(conf_mat)) / sum(conf_mat)
    pred_test <- predict(model, test_set, type = pred_type)
    return(list("pred"=pred_test,"validated_accuracy"=accuracy))        
 } 


#' 將樣本分成訓練集與測試集
#' @param df 原始數據
#' @param trainset_prob 輸入訓練集的比例
#' @return 回傳訓練集與測試集
#' @export

splitsample <- function(df,trainset_prob){
    sample <- sample(c(TRUE, FALSE), nrow(df), replace=TRUE, prob=c(trainset_prob,1-trainset_prob))
    train  <- df[sample, ]
    test   <- df[!sample, ]
    list_ <- list("train_set" = train  , "test_set" = test   )
    return(list_)
}