--Manuel Agustín Gomez
--Proyecto 1 Algoritmos y Estructura de Datos

--Ejercicio 1 

esCero :: Int -> Bool
esCero 0 = True

--Main> esCero 0
--True
--Main> esCero 2
--False

esPositivo :: Int -> Bool
esPositivo n = n>0

--Main> esPositivo 2
--True
--Main> esPositivo (-5)
--False

esVocal :: Char -> Bool
esVocal l = l == 'a' || l == 'e' || l == 'i' || l == 'o' || l == 'u' 

--Main> esVocal 'a'
--True
--Main> esVocal 'f'
--False

valorAbsoluto :: Int -> Int
valorAbsoluto n | n<0 = -n
                | n>=0 = n

--Main> valorAbsoluto (-2)
--2
--Main> valorAbsoluto 3
--3

sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

n_factorial :: Int -> Int
n_factorial 0 = 1
n_factorial n = n * n_factorial (n-1)

promedio :: [Int] -> Int 
promedio [] = 0
promedio xs = div (sumatoria xs) (length xs)