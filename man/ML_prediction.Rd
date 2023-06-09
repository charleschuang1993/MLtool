% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MLtool.R
\name{ML_prediction}
\alias{ML_prediction}
\title{機器學習預測模型
方便快速替換不同模型}
\usage{
ML_prediction(
  train_set,
  test_set,
  response,
  variables,
  mode = "randomForest",
  pred_type = "class"
)
}
\arguments{
\item{train_set}{訓練集}

\item{test_set}{測試集}

\item{mode}{SVM, randomForest (default), rpart(DT), glm}

\item{pred_type}{預測回傳值的類型 (response, class ...)}

\item{equation}{方程式}
}
\value{
回傳預測結果
}
\description{
機器學習預測模型
方便快速替換不同模型
}
