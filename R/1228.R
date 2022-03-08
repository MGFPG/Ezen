par(mfrow = c(1,2))

barplot(VADeaths, beside = T, col = rainbow(5),
        main = "미국 버지니아 주 하위계층 사망비율")

legend(19,71,c("50-54","55-59","60-64","65-69","70-74"),
       cex = 0.8, fill = rainbow(5))
       
barplot(VADeaths, beside = F, col = rainbow(5))

title(main = "미국 버지니아 주 하위계층 사망비율", font.main = 4)
legend(3.8,200,c("50-54","55-59","60-64","65-69","70-74"),
       cex = 0.8, fill = rainbow(5))




library(rpart)
weather = read.csv("C:/Users/USER/Documents/weather_y.csv", header=TRUE)
#단계2 : 데이터 샘플링
weather.df <- weather[, c(-1,-14)]
nrow(weather.df)
idx <- sample(1:nrow(weather.df), nrow(weather.df)*0.7)
weather_train <- weather.df[idx, ]
weather_test <- weather.df[-idx, ]
#단계3 : 분류모델 생성
weather_model <- rpart(RainTomorrow ~ ., data = weather.df)
weather_model # Humidity 중요변수
#단계4 : 예측치 생성 : 검정데이터 이용
weater_pred <- predict(weather_model, weather_test)
weater_pred
#단계5 : 예측 확률 범주화('Yes Rain', 'No Rain')
weater_class <- ifelse(weater_pred[,1] >=0.5, 'No Rain', 'Rain')
#단계6 : 혼돈 행렬(confusion matrix) 생성 및 분류정확도 구하기
table(weater_class, weather_test$RainTomorrow)

