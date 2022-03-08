# 실습: 변수와 데이터프레임 생성
# 단계 1: 과목 변수 생성, 숫자가 의미하는 것은 동일한 시험지로 시험을 보았을 떄
#획득한 점수이다. 이 점수를 바탕으로 S1,S2가 서로 얼마나 관련성이 있는 학과인지를
#알 수 있다. 즉 두 문제 번호당 획즉 점수가 비슷할 수록 두 과목으로 관계는 서로 연관성이
#있다고 말할 수 있다.

s1 <- c(1, 2, 1, 2, 3, 4, 2, 3, 4, 5)
s2 <- c(1, 3, 1, 2, 3, 4, 2, 4, 3, 4)
s3 <- c(2, 3, 2, 3, 2, 3, 5, 3, 4, 2)
s4 <- c(2, 4, 2, 3, 2, 3, 5, 3, 4, 1)
s5 <- c(4, 5, 4, 5, 2, 1, 5, 2, 4, 3)
s6 <- c(4, 3, 4, 4, 2, 1, 5, 2, 4, 2)
name <- 1:10

# 단계 2: 과목 데이터프레임 생성
subject <- data.frame(s1, s2, s3, s4, s5, s6)
str(subject)



# 실습: 변수의 주성분 분석
# 단계 1: 주성분 부석으로 요인 수 알아보기 
pc <- prcomp(subject)
summary(pc)
plot(pc)

# 단계 2: 고유값으로 요인 수 분석
en <- eigen(cor(subject))
names(en)

en$values
en$vectors

plot(en$values, type = "o")



# 실습: 변수 간의 상관관계 분석과 요인분석
# 단계 1: 상관관계 분석 - 벼수 간의 상관성으로 공통요인 추출
cor(subject)

# 단계 2: 요인분석 - 요인회전법 적용(Varimax 회전법이 기본)
# 단계 2-1: 주성분 분석의 가정에 의해서 2개 요인으로 분석
result <- factanal(subject, factors = 2, rotation = "varimax")
result 

# 단계 2: 요인분석 - 요인회전법 적용(Varimax 회전법이 기본)
# 단계 2-2: 고유값으로 가정한 3개 요인으로 분석
result <- factanal(subject, 
                   factor = 3, 
                   rotation = "varimax", 
                   scores = "regression")
result


# 단계 3: 다양한 방법으로 요인적재량 보기 
attributes(result)

result$loadings

print(result, digits = 2, cutoff = 0.5)

print(result$loadings, cutoff = 0)


# 실습: 요인점수를 이용한 요인적재량 시각화 
# 단계 1: Factor1과 Factor2 요인적재량 시각화 
plot(result$scores[ , c(1:2)],
     main = "Factor1과 Factor2 요인점수 행렬")

text(result$scores[ , 1], result$scores[ , 2],
     labels = name, cex = 0.7, pos = 3, col = "blue")

# 단게 2: 요인적재량 추가
points(result$loadings[ , c(1:2)], pch = 19, col = "red")

text(result$loadings[ , 1], result$loadings[ , 2],
     labels = rownames(result$loadings),
     cex = 0.8, pos = 3, col = "red")

# 단계 3: Factor1과 Factor3 요인적재량 시각화
plot(result$scores[ , c(1, 3)],
     main = "Factor1과 Factor3 요인점수 행렬")
text(result$scores[ , 1], result$scores[ , 3],
     labels = name, cex = 0.7, pos = 3, col = "blue")

# 단계 4: 요인적재량 추가 
points(result$loadings[ , c(1, 3)], pch = 19, col = "red")
text(result$loadings[ , 1], result$loadings[ , 3],
     labels = rownames(result$loadings), 
     cex = 0.8, pos= 3, col = "red")



# 실습: 3차원 산점도로 요인적재량 시각화 
# 단계 1: 3차원 산점도 패키지 로딩
install.packages("scatterplot3d")
library(scatterplot3d)

# 단계 2: 요인점수별 분류 및 3차원 프레임 생성
Factor1 <- result$scores[ , 1]
Factor2 <- result$scores[ , 2]
Factor3 <- result$scores[ , 3]

d3 <- scatterplot3d(Factor1, Factor2, Factor3, type = 'p')

# 단계 3: 요인적재량 표시
loadings1 <- result$loadings[ , 1]
loadings2 <- result$loadings[ , 2]
loadings3 <- result$loadings[ , 3]
d3$points3d(loadings1, loadings2, loadings3, 
            bg = 'red', pch = 21, cex = 2, type = 'h')



# 실습: 요인별 변수 묶기
# 단계 1: 요인별 과목 변수 이용 데이터프레임 생성
app <- data.frame(subject$s5, subject$s6)
soc <- data.frame(subject$s3, subject$s4)
nat <- data.frame(subject$s1, subject$s2)

# 단계 2: 요인별 산술평균 계산
app_science <- round((app$subject.s5 + app$subject.s6) / ncol(app), 2)
soc_science <- round((soc$subject.s3 + soc$subject.s4) / ncol(soc), 2)
nat_science <- round((nat$subject.s1 + nat$subject.s2) / ncol(nat), 2)

# 단계 3: 상관관계 분석
subject_factor_df <- data.frame(app_science, soc_science, nat_science)
cor(subject_factor_df)


# 실습: 기술 통계량 구하기 
# 단계 1: 데잍 가져오기 
product <- read.csv("C:/Users/USER/Documents/product.csv", header = TRUE)
head(product)

# 단계 2: 기술 통계량
summary(product)
sd(product$제품_친밀도); sd(product$제품_적절성); sd(product$제품_만족도)


# 실습: 상관계수 보기 
# 단계 1: 변수 간의 상관계수 보기 
cor(product$제품_친밀도, product$제품_적절성)
cor(product$제품_친밀도, product$제품_만족도)

# 단계 2: 제품_적절성과 제품_만족도의 상관계수 보기 
cor(product$제품_적절성, product$제품_만족도)

# 단계 3: (제품_적절성 + 제품_친밀도)와 제품_만족도의 상관계수 보기 
cor(product$제품_적절성 + product$제품_친밀도, product$제품_만족도)


# 실습: 주사위 적합도 검정
chisq.test(c(4, 6, 17, 16, 8, 9))


# 실습: 변수 리코딩과 데이터프레임 생성하기 

# 단계 1: 실습 파일 가져오기 

data <- read.csv("cleanDescriptive.csv", header = TRUE)

head(data)

# 단계 2: 변수 리코딩

x <- data$level2

y <- data$pass2


# 단계 3: 데이터프레임 생성

result <- data.frame(Level = x, Pass = y)

dim(result)


# 실습: 교차 분할표 작성

# 단계 1: 기본함수를 이용한 교차 분할표 작성

table(result)

# 단계 2: 교차 분할표 작성을 위한 패키지 설치

install.packages("gmodels")

library(gmodels)

install.packages("ggplot2")

library(ggplot2)

# 단계 3: 패키지를 이용한 교차 분할표 작성

CrossTable(x = diamonds$color, y = diamonds$cut)


# 실습: 패키지를 이용한 교차 분할표 작성: 부모의 학력수준과 자녀 대학 진학여부

x <- data$level2

y <- data$pass2

CrossTable(x, y)


# 실습: CrossTable() 함수를 이용한 카이제곱 검정

CrossTable(x = diamonds$cut, 
           
           y = diamonds$color, chisq = TRUE)


# 실습: 5개의 스포츠음료에 대한 선호도에 차이가 있는지 검정
data <- textConnection(
  "스포츠음료종류 관측도수
  1 41
  2 30
  3 51
  4 71
  5 61
  ")
x <- read.table(data, header = T)
x

chisq.test(x$관측도수)


# 실습: 부모의 학력수준과 자녀의 대학 진학여부의 독립성(관련성) 검정
setwd("C:/Users/USER/Documents")
data <- read.csv("cleanDescriptive.csv", header = TRUE)
x <- data$level2
y <- data$pass2
CrossTable(x, y, chisq = TRUE)


# 실습: 교육센터에서 교육방법에 따라 교육생들의 만족도에 차이가 있는지 검정
# 단계 1: 데이터 가져오기 
setwd("C:/Users/USER/Documents")
data <- read.csv("homogenity.csv")
head(data)

data <- subset(data, !is.na(survey), c(method, survey))

# 단계 2: 코딩 변경(변수 리코딩)
data$method2[data$method == 1] <- "방법1"
data$method2[data$method == 2] <- "방법2"
data$method2[data$method == 3] <- "방법3"

data$survey2[data$survey == 1] <- "1.매우만족"
data$survey2[data$survey == 2] <- "2.만족"
data$survey2[data$survey == 3] <- "3.보통"
data$survey2[data$survey == 4] <- "4.불만족"
data$survey2[data$survey == 5] <- "5.매우불만족"

# 단계 3: 교차 분할표 작성
table(data$method2, data$survey2)


# 단계 4: 동질성 검정 - 모든 특성치에 대한 추론검정
chisq.test(data$method2, data$survey2)

# 실습: 전체 벼수 간의 상관계수 보기 
cor(product, method = "pearson")


# 실습: 방향성 있는 색상으로 표현
install.packages("corrgram")
library(corrgram)
corrgram(product)
corrgram(product, upper.panel = panel.conf)
corrgram(product, lower.panel = panel.conf)


# 실습: 차트에 밀도곡선, 상관성, 유의확률(별표) 추가하기 
# 단계 1: 패키지 설치 
install.packages("PerformanceAnalytics")
library(PerformanceAnalytics)

# 단게 2: 상관성, p값(*), 정규분포(모수 검정 조건) 시각화 
chart.Correlation(product, histogram = , pch = "+")



# 실습: 서열척도 대상 상관계수
cor(product, method = "spearman")




# 실습: 단순 선형 회귀분석 수행
# 단계 1: 데이터 가져오기 
product <- read.csv("C:/Rwork/Part-III/product.csv", header = TRUE)
str(product)

# 단계 2: 독립변수와 종속변수 생성
y = product$제품_만족도 
x = product$제품_적절성
df <- data.frame(x, y)

# 단계 3: 단순 선형회귀 모델 생성
result.lm <- lm(formula = y ~ x, data = df)

# 단계 4: 회귀분석의 절편과 기울기
result.lm

# 단계 5: 모델의 적합값과 잔차 보기 
names(result.lm)

# 단계 5-1: 적합값 보기 
fitted.values(result.lm)[1:2]

# 단계 5-2: 관측값 보기 
head(df, 1)

# 단계 5-3: 회귀방정식을 적용하여 모델의 적합값 계산
Y = 0.7789 + 0.7393 * 4
Y

# 단계 5-4: 잔차(오차) 계산
3 - 3.735963


# eksrP 5-5: 모델의 잔차 보기 
residuals(result.lm)[1:2]

# 단계 5-6: 모델의 잔차와 회귀방정식에 의한 적합값으로부터 관측값 계산
-0.7359630 + 3.735963


# 실습: 선형 회귀분석 모델 시각화
# 단계 1: x, y 산점도 그리기 
plot(formula = y ~ x, data = product)


# 단계 2: 선형 회귀모델 생성
result.lm <- lm(formula = y ~ x, data = product)

# 단계 3: 회귀선
abline(result.lm, col = "red")


# 실습: 선형 회귀분석 결과보기 
summary(result.lm)


# 실습: 다중 회귀분ㄴ석
# 단계 1: 변수 모델링
y = product$제품_만족도
x1 = product$제품_친밀도
x2 = product$제품_적절성
df <- data.frame(x1, x2, y)

# 단계 2: 다중 회귀분석
result.lm <- lm(formula = y ~x1 + x2, data = df)
result.lm


# 실습: 다중 공선성 문제 확인
# 단계 1: 패키지 설치
install.packages("car")
library(car)

# 단계 2: 분산팽창요인(VIF)
vif(result.lm)


# 실습: 다중 회귀분석 결과보기 
summary(result.lm)



# 실습: 다중 공선성 ㅁ누제 확인
# 단계 1: 패키지 설치 및 데이터 로딩
install.packages("car")
library(car)

data(iris)

# 단계 2: iris 데이터 셋으로 다중 회귀분석
model <- lm(formula = Sepal.Length ~ Sepal.Width + 
              Petal.Length + Petal.Width, data = iris)
vif(model)
sqrt(vif(model)) > 2


# 단계 3: iris 변수 간의 상관계수 구하기 
cor(iris[ , -5])


# 실습: 데이터 셋 생성과 회귀모델 생성
# 단계 1: 학습데이터와 검저엗이터 표본 추출
x <-sample(1:nrow(iris), 0.7 * nrow(iris))
train <- iris[x, ]
test <- iris[-x, ]

# 단계 2: 변수 제거 및 다중 회귀분석
model <- lm(formula = Sepal.Length ~ Sepal.Width + Petal.Length, data = train)
model
summary(model)



# 실습: 회귀방정식 도출
# 단계 1: 회귀방정식을 위한 절편과 기울기 보기
model

# 단계 2: 회귀방정식 도출
head(train, 1)
# 다중 회귀방정식 적용
Y = 2.3826 +  0.5684 * 2.9 + 0.4576 * 4.6
Y
6.6 - Y



# 실습: 검정데이터의 독립변수를 이용한 예측치 생성
pred <- predict(model, test)
pred



# 실습: 상관계수를 이용한 회귀모델 평가
cor(pred, test$Sepal.Length)


# 실습: 회귀분석의 기본 가정 충족으로 회귀분석 수행
# 단계 1: 회귀모델 생성
# 단계 1-1: 벼수 모델링
formula = Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width

# 단계 1-2: 회귀모델 생성
model <- lm(formula = formula, data = iris)
model

# 단계 2: 잔차(오차) 부석
# 단계 2-1: 독립성 검정 - 더빈 왓슨 값으로 확인
install.packages('lmtest')
library(lmtest)
dwtest(model)


# 단계 2-2: 등분산성 검정 - 잔차와 적합값의 분포
plot(model, which = 1)

# 단계 2-3: 잔차의 정규성 검정
attributes(model)
res <- residuals(model)
shapiro.test(res)
par(mfrow = c(1, 2))
hist(res, freq = F)
qqnorm(res)


# 단계 3: 다중 공선성 검사
library(car)
sqrt(vif(model)) > 2

# 단계 4: 회귀모델 생성과 평가 
formula = Sepal.Length ~ Sepal.Width + Petal.Length
model <- lm(formula = formula, data = iris)
summary(model)


# 실습: 날씨 관련 요인 변수로 비(rain) 유뮤 예측
# 단계 1: 데이터 가져오기 
weather = read.csv("C:/Rwork/Part-IV/weather.csv", stringsAsFactors = F)
dim(weather)
head(weather)
str(weather)

# 단계 2: 변수 선택과 더비 벼수 생성
weather_df <- weather[ , c(-1, -6, -8, -14)]
str(weather_df)

weather_df$RainTomorrow[weather_df$RainTomorrow == 'Yes'] <- 1
weather_df$RainTomorrow[weather_df$RainTomorrow == 'No'] <- 0
weather_df$RainTomorrow <- as.numeric(weather_df$RainTomorrow)
head(weather_df)

# 단계 3: 학습데이터와 검정데이터 생성(7:3 비율)
idx <- sample(1:nrow(weather_df), nrow(weather_df) * 0.7)
train <- weather_df[idx, ]
test <- weather_df[-idx, ]

# 단계 4: 로지스틱 회귀모델 생성
weather_model <- glm(RainTomorrow ~ ., data = train, family = 'binomial')
weather_model
summary(weather_model)


# 단계 5: 로지스틱 회귀모델 예측치 생성
pred <- predict(weather_model, newdata = test, type = "response")
pred

# 시그모이드 함수
result_pred <- ifelse(pred >= 0.5, 1, 0)
result_pred

table(result_pred)


# 단계 6: 모델 평가 - 분류정확도 계산
table(result_pred, test$RainTomorrow)

# 단계 7: ROC Curve를 이용한 모델 평가
install.packages("ROCR")
library(ROCR)

pr <- prediction(pred, test$RainTomorrow)
prf <- performance(pr, measure = "tpr", x.maeasure = "fpr")
plot(prf)


# 실습: 의사결정 트리 생성: ctree() 함수 이용 
# 단계 1: party 패키지 설치 
install.packages("party")
library(party)

# 단계 2: airquality 데이터 셋 로딩
#install.packages("datasets")
library(datasets)
str(airquality)

# 단계 3: formula 생성
formula <- Temp ~ Solar.R + Wind + Ozone

# 단계 4: 분류모델 생성 - formula를 이용하여 분류모델 생성
air_ctree <- ctree(formula, data = airquality)
air_ctree

# 단계 5: 분류분석 결과
plot(air_ctree)



# 실습: 학습데이터와 검정데이터 샘플링으로 분류분석 수행
# 단계 1: 학습데이터와 검정데이터 샘플링
#set.seed(1234)
idx <- sample(1:nrow(iris), nrow(iris) * 0.7)
train <- iris[idx, ]
test <- iris[-idx, ]

# 단계 2: formula(공식) 생성
formula <- Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width

# 단계 3: 학습데이터 이용 분류모델 생성
iris_ctree <- ctree(formula, data = train)
iris_ctree

# 단계 4: 분류모델 플로팅
# 단계 4-1: 간단한 형식으로 시각화 
plot(iris_ctree, type = "simple")

# 단계 4-2: 의사결정 트리로 플로팅
plot(iris_ctree)


# 단계 5: 분류모델 평가
# 단계 5-1: 모델의 예측치 생성과 혼돈 매트릭스 생성
pred <- predict(iris_ctree, test)

table(pred, test$Species)

# 단계 5-2: 분류 정확도 - 96%
(14 + 16 + 13) / nrow(test)


# 실습: K겹 교차 검정 샘플링으로 분류 분석하기 
# 단계 1: K겹 교차 검정을 위한 샘플링 - 3겹, 2회 반복
library(cvTools)
cross <- cvFolds(nrow(iris), K = 3, R = 2)

# 단계 2: K겹 교차 검정 데잍 보기 
str(cross)
cross
length(cross$which)
dim(cross$subsets)
table(cross$which)


# 단계 3: K겹 교차 검정 수행
R = 1:2
K = 1:3
CNT = 0
ACC <- numeric()

for(r in R) {
  cat('\n R = ', r, '\n')
  for(k in K) {
    
    datas_ids <- cross$subsets[cross$which == k, r]
    test <- iris[datas_ids, ]
    cat('test : ', nrow(test), '\n')
    
    formual <- Species ~ .
    train <- iris[-datas_ids, ]
    cat('train : ', nrow(train), '\n')
    
    model <- ctree(Species ~ ., data = train)
    pred <- predict(model, test)
    t <- table(pred, test$Species)
    print(t)
    
    CNT <- CNT + 1
    ACC[CNT] <- (t[1, 1] + t[2, 2] + t[3, 3]) / sum(t)
  }
  
}

CNT


# 단계 4: 교차 검정 모델 평가
ACC
length(ACC)

result_acc <- mean(ACC, na.rm = T)
result_acc




