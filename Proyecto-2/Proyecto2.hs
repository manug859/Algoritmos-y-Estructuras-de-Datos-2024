sum_cuad :: [Int] -> Int
sum_cuad [] = 0
sum_cuad (x:xs) = (x*x) + sum_cuad xs

iga :: Int -> [Int] -> Bool
iga e [] = True
iga e (x:xs) = e == x && iga e xs

exp' :: Int -> Int -> Int
exp' n 0 = 1
exp' n k = n * exp' n (k-1)

sum_par :: [Int] -> Int
sum_par [] = 0
sum_par xs = sum (filter even xs)

cuantos :: (Int -> Bool) -> [Int] -> Int
cuantos p [] = 0
cuantos p (x:xs) | p x = 1 + cuantos p xs
                 | otherwise = cuantos p xs

--Lab 2 y 3

data Carrera = Matematica | Fisica | Computacion | Astronomia deriving (Show, Eq)

titulo :: Carrera -> String
titulo Matematica = "Licenciatura de Matematica"
titulo Fisica = "Licenciatura de Fisica"
titulo Computacion = "Licenciatura de Computacion"
titulo Astronomia = "Licenciatura de Astronomia"

data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si deriving (Show, Eq, Ord)

cifradoAmericano :: NotaBasica -> Char
cifradoAmericano Do = 'C'
cifradoAmericano Re = 'D'
cifradoAmericano Mi = 'E'
cifradoAmericano Fa = 'F'
cifradoAmericano Sol = 'G'
cifradoAmericano La = 'A'
cifradoAmericano Si = 'B'

--Lab4

minimoElemento :: Ord a => [a] -> a
minimoElemento [x] = x
minimoElemento (x:xs) = min x (minimoElemento xs)

minimoElemento' :: (Bounded a, Ord a) => [a] -> a
minimoElemento' [] = minBound
minimoElemento' [x] = x
minimoElemento' (x:xs) = min x (minimoElemento' xs)

--Lab 5

type Altura = Int
type NumCamiseta = Int

data Zona = Arco | Defensa | Mediocampo | Delantera
data TipoReves = DosManos | UnaMano
data Modalidad = Carretera | Pista | Monte | BMX
data PiernaHabil = Izquierda | Derecha

type ManoHabil = PiernaHabil

data Deportista = Ajedrecista | Ciclista Modalidad | Velocista Altura | Tenista TipoReves ManoHabil Altura | Futbolista Zona NumCamiseta PiernaHabil Altura

--b)
{-
El constructor "Ciclista" es del tipo Deportista.
-}

--c)

contar_velocistas :: [Deportista] -> Int
contar_velocistas [] = 0
contar_velocistas ((Velocista _):xs) = 1 + contar_velocistas xs
contar_velocistas ((_):xs) = contar_velocistas xs

{-
*Main> contar_velocistas [Ajedrecista, Ciclista(Monte)]
0
*Main> contar_velocistas [Ajedrecista, Velocista(174), Ciclista(Monte)]
1
*Main> contar_velocistas [Ajedrecista, Velocista(174), Ciclista(Monte), Velocista(193)]
2-}


contar_futbolistas :: [Deportista] -> Zona -> Int
contar_futbolistas [] z = 0
contar_futbolistas ((Futbolista Arco _ _ _):xs) Arco = 1 + contar_futbolistas xs Arco
contar_futbolistas ((Futbolista Defensa _ _ _):xs) Defensa = 1 + contar_futbolistas xs Defensa
contar_futbolistas ((Futbolista Mediocampo _ _ _):xs) Mediocampo = 1 + contar_futbolistas xs Mediocampo
contar_futbolistas ((Futbolista Delantera _ _ _):xs) Delantera = 1 + contar_futbolistas xs Delantera
contar_futbolistas ((_):xs) z = contar_futbolistas xs z

pertZona :: Zona -> Deportista -> Bool
pertZona Arco (Futbolista Arco _ _ _) = True
pertZona Defensa (Futbolista Defensa _ _ _) = True
pertZona Mediocampo (Futbolista Mediocampo _ _ _) = True
pertZona Delantera (Futbolista Delantera _ _ _) = True
pertZona z _ = False

contar_futbolistas' :: [Deportista] -> Zona -> Int
contar_futbolistas' xs z = length (filter (pertZona (z)) xs)

--Lab 6

sum_pot :: Int -> Int -> Int
sum_pot x 0 = 0
sum_pot x n = sum_pot x (n-1) + exp' x (n-1)

aprox_pi :: Int -> Float
aprox_pi n = 4 * aprox_pi' n

aprox_pi' :: Int -> Float
aprox_pi' 0 = 0
aprox_pi' n = aprox_pi' (n-1) + ((-1)^(n-1))/(2*(fromIntegral n)-1)

cuad :: Int -> Int
cuad 0 = 0
cuad n = cuad (n-1) + 2*(n-1) + 1 

cubo :: Int -> Int
cubo 0 = 0
cubo n = cubo (n-1) + (3*cuad (n-1)) + 3*(n-1) + 1

auxProd :: [Int] -> Int
auxProd [] = 1
auxProd (x:xs) = x * auxProd xs

funcion :: [Int] -> Bool
funcion [] = False
funcion (x:xs) = x == auxProd xs || funcion xs