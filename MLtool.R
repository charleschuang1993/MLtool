#' 機器學習預測模型
#' 方便快速替換不同模型
#' @param train_set
#' @param test_set
#' @param equation
#' @param mode SVM, randomForest (default), rpart(DT), glm
#' @param pred_type 
#' @return 回傳預測結果
#' @export

ML_prediction<- function(train_set, test_set, equation, mode="randomForest", pred_type = "class"){
    formula_ <- formula(equation)
    algorithm <- get(mode)
    model <- algorithm(formula_ , train_set)
    pred <- predict(model, test_set, type = pred_type)
    conf_mat <- table(real = test_set$ethnicity_v2 , predict=pred) #confusion matrix
    accuracy <- sum(diag(conf_mat)) / sum(conf_mat)
    return(list("pred"=pred,"accuracy"=accuracy))        
 } 

