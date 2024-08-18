--Manuel Agustín Gomez
--Proyecto 1 Algoritmos y Estructura de Datos

--Ejercicio 1 

esCero :: Int -> Bool --1.1
esCero 0 = True

--Main> esCero 0
--True
--Main> esCero 2
--False

esPositivo :: Int -> Bool --1.2
esPositivo n = n>0

--Main> esPositivo 2
--True
--Main> esPositivo (-5)
--False

esVocal :: Char -> Bool --1.3
esVocal l = l == 'a' || l == 'e' || l == 'i' || l == 'o' || l == 'u' 

--Main> esVocal 'a'
--True
--Main> esVocal 'f'
--False

valorAbsoluto :: Int -> Int --1.4
valorAbsoluto n | n<0 = -n
                | n>=0 = n

--Main> valorAbsoluto (-2)
--2
--Main> valorAbsoluto 3
--3

--Ejercicio 2

paratodo :: [Bool] -> Bool--2.1
paratodo [] = True
paratodo (x:xs) = x==True && paratodo xs

--Main> paratodo [True, True, True]
--True
--Main> paratodo [True, False, True]
--False

sumatoria :: [Int] -> Int --2.2
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

--Main> sumatoria [1,2,3]
--6
--Main> sumatoria [1,2,3,4]
--10

productoria :: [Int] -> Int --2.3
productoria [] = 1
productoria (x:xs) = x * productoria xs 

--Main> productoria [1,2,3]
--6
--Main> productoria [1,2,3,4]
--24

factorial' :: Int -> Int --2.4
factorial' 0 = 1
factorial' n = n * n_factorial (n-1)

--Main> factorial' 3
--6
--Main> factorial' 5
--120

promedio :: [Int] -> Int --2.5
promedio [] = 0
promedio xs = div (sumatoria xs) (length xs)

--Main> promedio [1,2,3]
--2
--Main> promedio [7,7,5]
--6

--Ejercicio 3
--"Identifica las variables libres de cada expresión y el tipo de cada una."

--3.a)[4a] No tiene variables libres, solo tiene una constante en el término que es "0". El tipo de ésta constante es Int.
--3.a)[4b] La variable libre es "x" siendo esta del tipo Int
--3.a)[4c] Tampoco tiene variables libres, solo la ligada "i", del tipo Int.

--3.b)

mayorQueCero :: [Int] -> Bool
mayorQueCero [] = True
mayorQueCero (x:xs) = x == 0 && mayorQueCero xs 