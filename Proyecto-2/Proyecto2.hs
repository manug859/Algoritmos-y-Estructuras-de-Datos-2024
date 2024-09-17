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

data Zona = Arco | Defensa | Mediocampo | Delantera deriving Show
data TipoReves = DosManos | UnaMano deriving Show
data Modalidad = Carretera | Pista | Monte | BMX deriving Show
data PiernaHabil = Izquierda | Derecha deriving Show

type ManoHabil = PiernaHabil

data Deportista = Ajedrecista | Ciclista Modalidad | Velocista Altura | Tenista TipoReves ManoHabil Altura | Futbolista Zona NumCamiseta PiernaHabil Altura deriving Show

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

iguales :: Eq a => [a] -> Bool
iguales [] = True
iguales (x:y:xs) = x == y && iguales xs

minimo :: [Int] -> Int
minimo [x] = x
minimo (x:xs) = min x (minimo xs)

creciente :: [Int] -> Bool
creciente [] = True
creciente (x:y:xs) = x < y && creciente xs

prodP :: [Int] -> [Int] -> Int
prodP [] _ = 0
prodP _ [] = 0
prodP (x:xs) (y:ys) = x*y + prodP xs ys

psum :: [Int] -> Bool
psum xs = gpsum 0 xs

gpsum :: Int -> [Int] -> Bool
gpsum n [] = (n>=0)
gpsum n (x:xs) = (n>=0) && gpsum (n+x) xs

sum_ant :: [Int] -> Bool
sum_ant xs = gsum_ant 0 xs

gsum_ant :: Int -> [Int] -> Bool
gsum_ant n [] = False
gsum_ant n (x:xs) = n==x || gsum_ant (n+x) xs

sum8 :: [Int] -> Bool
sum8 xs = gsum8 0 xs

gsum8 :: Int -> [Int] -> Bool
gsum8 n [] = n == 8
gsum8 n (x:xs) = n==8 || gsum8 (n+x) xs

hay_cuad :: Int -> Bool
hay_cuad n = g_hay_cuad 0 n

g_hay_cuad :: Int -> Int -> Bool
g_hay_cuad k 0 = k == 0
g_hay_cuad k n = exp' (n-1) 2 == (k+n) || g_hay_cuad (n+k) (n-1)

--Lab 10

sonidoNatural :: NotaBasica -> Int
sonidoNatural Do = 0
sonidoNatural Re = 2
sonidoNatural Mi = 4
sonidoNatural Fa = 5 
sonidoNatural Sol = 7
sonidoNatural La = 9
sonidoNatural Si = 11

data Alteracion = Bemol | Natural | Sostenido deriving (Eq, Show) --b) (-1, 0 , 1)

data NotaMusical = Nota NotaBasica Alteracion

sonidoCromatico :: NotaMusical -> Int 
sonidoCromatico (Nota Do Bemol) = sonidoCromatico (Nota Si Sostenido)
sonidoCromatico (Nota nota Sostenido) = (sonidoNatural nota) + 1
sonidoCromatico (Nota nota Natural) = (sonidoNatural nota)
sonidoCromatico (Nota nota Bemol) = (sonidoNatural nota) - 1

instance Eq NotaMusical 
    where
        n1==n2 = sonidoCromatico(n1) == sonidoCromatico(n2)
        
instance Ord NotaMusical 
    where
        n1<=n2 = sonidoCromatico(n1) <= sonidoCromatico(n2)


--LAB 11

primerElemento :: [a] -> Maybe a
primerElemento [] = Nothing
primerElemento xs = Just (head xs)

--Lab 12

data Cola = VaciaC | Encolada Deportista Cola deriving Show

atender :: Cola -> Maybe Cola
atender VaciaC = Nothing
atender (Encolada d c) = Just c

encolar :: Deportista -> Cola -> Cola
encolar d VaciaC = (Encolada d VaciaC)
encolar d (Encolada d1 c) = Encolada d1 (encolar d c)

busca :: Cola -> Zona -> Maybe Deportista
busca VaciaC z = Nothing
busca (Encolada d c) z | pertZona z d = Just d
                       | otherwise = busca c z

data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b) deriving Show

la_long :: ListaAsoc a b -> Int
la_long Vacia = 0
la_long (Nodo a b (xsAsoc)) = 1 + la_long(xsAsoc)


la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b 
la_concat xs Vacia = xs
la_concat Vacia xs = xs
la_concat (Nodo a b xs) ys = (Nodo a b(la_concat xs ys))


la_agregar :: Eq a => ListaAsoc a b -> a -> b -> ListaAsoc a b
la_agregar Vacia clave valor = Nodo clave valor Vacia
la_agregar (Nodo a b xs) clave valor | (a==clave) = (Nodo a valor xs)
                                     | otherwise = Nodo a b (la_agregar xs clave valor)


la_pares :: ListaAsoc a b -> [(a, b)] 
la_pares Vacia = []
la_pares (Nodo a b xs) = (a, b): la_pares xs


la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b
la_busca Vacia x = Nothing
la_busca (Nodo clave valor xs) x | clave == x = Just valor
                                 | otherwise = la_busca xs x


la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b
la_borrar x Vacia = Vacia
la_borrar x (Nodo clave valor xs) | (clave==x) = xs
                                  | otherwise = Nodo clave valor (la_borrar x xs)


--LAB 13

gsuminM :: Int -> [Int] -> Int
gsuminM n [] = n
gsuminM n (x:xs) = min n (gsuminM (n+x) xs)

suminM :: [Int] -> Int
suminM [] = 0
suminM xs = gsuminM 0 xs

sumin :: [Int] -> Int
sumin [] = 0
sumin (x:xs) = min (suminM xs) (sumin xs)