library(datasets)
library(timeSeries)
library(forecast)
library(tseries)

#Masukkan Data
SAHAMBATA<-read.csv(file="C:/Users/eylan/Downloads/NEWPR2.csv", header=TRUE, sep=";")
BATA18 <- ts(SAHAMBATA)
View(SAHAMBATA)
BATA18
is.ts(BATA18)
ts.plot(BATA18)



adf.test(BATA18)
BoxCox.lambda(BATA18)

par(mfrow=c(1,2))
acf(BATA18,main="ACF Data Saham BATA")
pacf(BATA18,main="ACF Data Saham BATA")


#differencing satu kali
BATA18_diff1 <- diff(BATA18, lag = 1)
BATA18_diff1
#Data BATA18 Baru
par(mfrow=c(1,1))
plot(BATA18_diff1)
BATA18_diff1
adf.test(BATA18_diff1)

#Plot Data Baru
par(mfrow=c(1,2))
plot(BATA18, main = "Data sebelum differencing")
plot(BATA18_diff1, main = "Data sesudah differencing")

#plot acf & pacf data sesudah
par(mfrow=c(1,2))
acf(BATA18_diff1, lag.max = 60, main="ACF BATA18 diff 1")
pacf(BATA18_diff1, lag.max = 60, main="PACF BATA18 diff 1")

#fitting model
model111 <- arima(BATA18, order = c(1,1,1), method = "ML")
model113 <- arima(BATA18, order = c(1,1,3), method = "ML")
model211 <- arima(BATA18, order = c(2,1,3), method = "ML")
model213 <- arima(BATA18, order = c(2,1,3), method = "ML")
model311 <- arima(BATA18, order = c(3,1,3), method = "ML")
model313 <- arima(BATA18, order = c(3,1,3), method = "ML")
model411 <- arima(BATA18, order = c(4,1,3), method = "ML")
model413 <- arima(BATA18, order = c(4,1,3), method = "ML")
model711 <- arima(BATA18, order = c(7,1,3), method = "ML")
model713 <- arima(BATA18, order = c(7,1,3), method = "ML")
model911 <- arima(BATA18, order = c(9,1,3), method = "ML")
model913 <- arima(BATA18, order = c(9,1,3), method = "ML")

#Estimasi Parameter
model111
model113
model211
model213
model311
model313
model411
model413
model711
model713
model911
model913

#Uji white noise pada Residual (Ljung-Box Test)
checkresiduals(model111)

#Uji Kenormalan Residual/normalitas
shapiro.test(residuals(model111))

#Forcasting
prediksi <- forecast(model111, level = c(95), h = 150)
par(mfrow=c(1,1))
plot(prediksi)
prediksi
summary(prediksi)
mean(prediksi$residuals)

