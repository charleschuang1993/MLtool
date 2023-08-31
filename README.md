# MLtool

> 用於同時評估用來建模預測的不同演算法，直接帶入演算法名稱即可獲得預測結果，藉此大量迭代，提高效率。
> 未來會再新增評估損失函數、調參效果等。

- ### example

```
mode <- "randomForest"  # randomForest package
equation <- "response~."
pred_type<- "class"
pred_result_ <- ML_prediction(train_set, test_set, equation, pred_type)

```
