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

factorial :: Int -> Int --2.4
factorial 0 = 1
factorial n = n * factorial (n-1)

--Main> factorial 3
--6
--Main> factorial 5
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

--3.a)[4a] La variable libre es la lista de [Int], además tiene una constante en el término que es "0". El tipo de ésta constante es Int.
--3.a)[4b] La variable libre es "x" siendo esta del tipo Int
--3.a)[4d] La variable libre es la lista de [Int].

--[3.b]

--3.b)[4a] ⟨ ∀ i : 0 ≤ i < #xs : xs.i > 0 ⟩
mayorQueCero :: [Int] -> Bool
mayorQueCero [] = True
mayorQueCero (x:xs) = x > 0 && mayorQueCero xs 


--3.b)[4b] ⟨ ∃ i : 0 ≤ i < #xs : xs.i = x ⟩
igualAn :: [Int] -> Int -> Bool
igualAn [] n = False
igualAn (x:xs) n = x == n || igualAn xs n


--3.b)[4d] ⟨ ∀ i : 0 ≤ i < #xs − 1 : xs.i = xs.(i + 1) ⟩
todosIguales :: [Int] -> Bool
todosIguales [] = True
todosIguales [x] = False
todosIguales (y:(x:xs)) = y == x || todosIguales xs


--3.c) Evaluá las funciones tomando como argumento los valores señalados en 5.

--mayorQueCero [-5, -3, 4, 8]
--False
--mayorQueCero [11, 2, 5, 8]
--True

--igualAn [-5, -3, 4, 8] 4
--True
--igualAn [11, 2, 5, 8] 4
--False

--todosIguales [1,1,1,1]
--True
--todosIguales [-5, -3, 4, 8]
--False
--todosIguales [11, 2, 5, 8]
--False

--Ejercicio 4

--4.a) "Identifica las variables libres de cada expresión y el tipo de cada una."

--4.a)[7a] La variable libre es n siendo esta del tipo Int.
--4.a)[7b] La variable libre es xs siendo esta del tipo [Int].
--4.a)[7c] La variables libres son xs e ys siendo estas del tipo [Int].
--4.a)[7d] La variable libre es n siendo esta del tipo Int.

--[4.b]

promedio' :: [Int] -> Int
promedio' [] = 0
promedio' xs = div (sumatoria xs) (length xs)

--función auxiliar minMayorQueMax
maxlista :: [Int] -> Int
maxlista [] = minBound
maxlista [y] = y
maxlista (y:(x:xs)) = max (maxlista xs) (max y x)

minlista :: [Int] -> Int
minlista [] = maxBound
minlista [y] = y
minlista (y:(x:xs)) = min (minlista xs) (min y x)

minMayorQueMax :: [Int] -> [Int] -> Bool 
minMayorQueMax [] [] = True
minMayorQueMax xs ys = maxlista xs < minlista ys

--minMayorQueMax [-3, 9, 8] [6, 7, 8]
--True
--minMayorQueMax [-3, 9, 8] [6, 7, 8, 9]
--False

prodIndiceigaN :: [Int] -> [Int] -> Int -> Bool
prodIndiceigaN [] [] n = False
prodIndiceigaN xs [] n = False
prodIndiceigaN [] ys n = False
prodIndiceigaN [x] [y] n = False
prodIndiceigaN (x:xs) (y:ys) n = length xs * length ys == n || prodIndiceigaN xs ys n
--preguntar por este, ya que no usa listas!!


--LAB 5

todos :: [Bool] -> Bool
todos [] = True
todos (x:xs) = x == True && todos xs
--Main> todos [True, True, True]
--True
--Main> todos [True, False, True]
--False

--LAB 6


--a)

--a.1) xs es la variable libre del predicado.
--a.2) También es xs.
--a.3) xs es la variable libre del predicado.

--b)

{-
maxlista' :: [Int] -> Int
maxlista' [] = minBound
maxlista' [n] = n
maxlista' (n:(x:xs)) = max (maxlista' xs) (max n x)
-}

--funcion auxiliar
paresDeLista :: [Int] -> [Int]
paresDeLista xs = filter even xs

prodPares :: [Int] -> Int
prodPares xs = product (paresDeLista xs)

sumaPosicionesPares :: [Int] -> Int
sumaPosicionesPares [] = 0
sumaPosicionesPares [x] = x
sumaPosicionesPares (x:_:xs) = x + sumaPosicionesPares xs

--LAB 7 & 8

--a)
paratodo' :: [a] -> (a -> Bool) -> Bool
paratodo' [] p = True
paratodo' (x:xs) p = p x && paratodo' xs p
--Main> paratodo' [1,2,3] esCero
--False
--Main> paratodo' [1,2,3] esPositivo
--True

--b)
existe' :: [a] -> (a -> Bool) -> Bool
existe' [] p = False
existe' (x:xs) p = p x || existe' xs p
--Main> existe' [1,-2,-31] esPositivo
--True
--Main> existe' [1,2,1] esCero
--False

--c)
sumatoria' :: [a] -> (a -> Int) -> Int
sumatoria' [] p = 0
sumatoria' (x:xs) p = p x + sumatoria' xs p
--Main> sumatoria' [7,-2,3] valorAbsoluto
--12
--Main> sumatoria' [7,1,3] factorial
--5047

--d)
productoria' :: [a] -> (a -> Int) -> Int
productoria' [] p = 1
productoria' (x:xs) p = p x * productoria' xs p
--productoria' [1,2,3] factorial
--12
--productoria' [1,-8,3] valorAbsoluto
--24

--LAB 9

--a)
todosPares :: [Int] -> Bool
todosPares [] = True
todosPares (x:xs) = even x && todosPares xs
--Main> todosPares [2,4,6]
--True
--Main> todosPares [2,4,5]
--False

--b.0.1 función auxiliar hayMultiplo)
esMultiplo :: Int -> Int -> Bool
esMultiplo n k = k `mod` n == 0


--b)
hayMultiplo :: Int -> [Int] -> Bool
hayMultiplo n [] = False
hayMultiplo n (x:xs) = esMultiplo n x || hayMultiplo n xs
--Main> hayMultiplo 2 [1,3,5]
--False
--Main> hayMultiplo 2 [1,3,4]
--True

--c)
sumaCuadrados :: Int -> Int
sumaCuadrados 0 = 0
sumaCuadrados n = sumatoria' [1..n] (^2)
--Main> sumaCuadrados 3
--14
--Main> sumaCuadrados 4
--30

--d.0.1)
divisor :: Int -> Int -> Bool
divisor n k = mod n k == 0

--d)
existeDivisor :: Int -> [Int] -> Bool
existeDivisor n xs = existe' xs (divisor n)
--Main> existeDivisor 4 [2,3,5]
--True
--Main> existeDivisor 4 [3,5]
--False

--e)
esPrimo :: Int -> Bool
esPrimo n = (n>1) && not(existeDivisor n [2..n-1])
--Main> esPrimo 5
--True
--Main> esPrimo 4
--False

--f)
factorial' :: Int -> Int
factorial' n = factorial n
--Main> factorial' 3
--6
--Main> factorial' 5
--120

--g)
multiplicaPrimos :: [Int] -> Int
multiplicaPrimos xs = productoria (filter esPrimo xs) 
--Main> multiplicaPrimos [1,2,3,4,5]
--30
--Main> multiplicaPrimos [1,2,3,4,5,6,7]
--210

--h.0.2)
pertenece :: Int -> [Int] -> Bool
pertenece n [] = False
pertenece n (x:xs) = n == x || pertenece n xs

--h.0.1)
fib :: Int -> Int
fib 1 = 0
fib 2 = 1
fib n = fib (n-1) + fib (n-2)
--Main> fib 8
--13
--Main> fib 20
--4181

esFib :: Int -> Bool
esFib n = pertenece n (takeWhile (<= n) (map fib [1..]))
--Main> esFib 13
--True
--Main> esFib 14
--False

--i)
todosFib :: [Int] -> Bool
todosFib xs = paratodo' xs esFib
--Main> todosFib [1,2,3,5]
--True
--Main> todosFib [1,2,3,4]
--False

--LAB 10

--10.a)
dupLista :: [Int] -> [Int]
dupLista [] = []
dupLista (x:xs) = (x * 2) : dupLista xs

--10.b)
dupLista' :: [Int] -> [Int]
dupLista' xs = map (*2) xs

--LAB 11

--11.a)
devuelvePrimos :: [Int] -> [Int]
devuelvePrimos [] = []
devuelvePrimos (x:xs) | (esPrimo x) = x : devuelvePrimos xs
                      | otherwise = devuelvePrimos xs

--11.b)
devuelvePrimos' :: [Int] -> [Int]
devuelvePrimos' xs = filter (esPrimo) xs

--11.c) Preguntar!!

--LAB 12

--12.a)
primIgualesA :: Eq a => a -> [a] -> [a]
primIgualesA n [] = []
primIgualesA n (x:xs) | (n==x) = x : primIgualesA n xs
                     | otherwise = []

--12.b)
primIgualesA' :: Eq a => a -> [a] -> [a]
primIgualesA' n xs = takeWhile (==n) xs

--LAB 13 

--13.a)
primIguales :: Eq a => [a] -> [a]
primIguales [] = []
primIguales (x:xs) | (head xs == x) = x : primIguales xs
                   | otherwise = x:[]

--13.b)
primIguales' :: Eq a => [a] -> [a]
primIguales' xs = primIgualesA' (head xs) xs

--PUNTOS ESTRELLA

--LAB 14
cuantGen :: (b -> b -> b) -> b -> [a] -> (a -> b) -> b
cuantGen _ base [] _ = base
cuantGen f base (x:xs) g = f (g x) (cuantGen f base xs g)

paratodo'' :: [a] -> (a -> Bool) -> Bool
paratodo'' xs p = cuantGen (&&) True xs p

existe'' :: [a] -> (a -> Bool) -> Bool
existe'' xs p = cuantGen (||) False xs p

sumatoria'' :: [a] -> (a -> Int) -> Int
sumatoria'' xs p = cuantGen (+) 0 xs p

productoria'' :: [a] -> (a -> Int) -> Int
productoria'' xs p = cuantGen (*) 1 xs p


--LAB 15
primQueCumplen :: [a] -> (a -> Bool) -> [a]
primQueCumplen [] p = []
primQueCumplen (x:xs) p | p x = x : primQueCumplen xs p
                        | otherwise = []


