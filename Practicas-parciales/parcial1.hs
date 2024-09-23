--Parcial 1 | Primer Cuatrimestre | Tema D (22-04-2024)

--Ejercicio 1 | Tienda de libros

--1.a' | Defino los siguientes parametros que tienen en común los contructores del tipo Libro.
type Nombre = String
type Autor  = String
type NPag   = Int --número de páginas.
type Precio = Int

--Novela
data Genero = Drama | Romance | Misterio | Aventura deriving Show

--Ensayo
data Tema = Politica | Filosofia | Ciencia | Historia deriving Show

--Poesia
data Estilo = Clasica | Conteporanea | Exprimental deriving Show

--Cientifico
data AreaEstudio = Astronomia | Fisica | Matematicas | Computacion deriving Show

--1.a | Defino el dato tipo Libro:

data Libro = Novela Nombre Genero Autor NPag Precio | Ensayo Nombre Tema Autor NPag | Poesia Nombre Estilo Autor NPag Precio | Cientifico Nombre AreaEstudio Autor NPag deriving Show

--1.b | Defino la función cuantasNovelasPorGenero

cuantasNovelasPorGenero :: [Libro] -> Genero -> Int
cuantasNovelasPorGenero [] g = 0
cuantasNovelasPorGenero ((Novela _ Drama _ _ _):ls) Drama = 1 + cuantasNovelasPorGenero ls Drama
cuantasNovelasPorGenero ((Novela _ Romance _ _ _):ls) Romance = 1 + cuantasNovelasPorGenero ls Romance
cuantasNovelasPorGenero ((Novela _ Misterio _ _ _):ls) Misterio = 1 + cuantasNovelasPorGenero ls Misterio
cuantasNovelasPorGenero ((Novela _ Aventura _ _ _):ls) Aventura = 1 + cuantasNovelasPorGenero ls Aventura
cuantasNovelasPorGenero ((_):ls) g = cuantasNovelasPorGenero ls g

{-
ghci> cuantasNovelasPorGenero [(Novela "El rey" Drama "Mauro" 120 2999), (Novela "Movimiento" Misterio "Alejo" 250 8900), (Novela "Uno Dos" Drama "Ariel" 120 9499), (Novela "El" Aventura "Mauro" 120 12999)] Drama 
2
ghci> cuantasNovelasPorGenero [(Novela "El rey" Drama "Mauro" 120 2999), (Novela "Movimiento" Misterio "Alejo" 250 8900), (Novela "Uno Dos" Drama "Ariel" 120 9499), (Novela "El" Aventura "Mauro" 120 12999)] Romance 
0
ghci> cuantasNovelasPorGenero [(Novela "El rey" Drama "Mauro" 120 2999), (Novela "Movimiento" Misterio "Alejo" 250 8900), (Novela "Uno Dos" Drama "Ariel" 120 9499), (Novela "El" Aventura "Mauro" 120 12999)] Misterio
1
-}

--1.c | Defino la igualdad para el tipo Libro.

mismoGenero :: Genero -> Genero -> Bool
mismoGenero Drama Drama = True 
mismoGenero Romance Romance = True
mismoGenero Misterio Misterio = True
mismoGenero Aventura Aventura  = True
mismoGenero _ _ = False

mismoTema :: Tema -> Tema -> Bool
mismoTema Politica Politica = True
mismoTema Filosofia Filosofia = True
mismoTema Ciencia Ciencia = True
mismoTema Historia Historia = True
mismoTema _ _ = False

mismoEstilo :: Estilo -> Estilo -> Bool
mismoEstilo Clasica Clasica = True
mismoEstilo Conteporanea Conteporanea = True
mismoEstilo Exprimental Exprimental = True
mismoEstilo _ _ = False

mismoAreaEstudio :: AreaEstudio -> AreaEstudio -> Bool
mismoAreaEstudio Astronomia Astronomia = True
mismoAreaEstudio Fisica Fisica = True
mismoAreaEstudio Matematicas Matematicas = True
mismoAreaEstudio Computacion Computacion = True
mismoAreaEstudio _ _ = False

instance Eq Libro 
    where
        (Ensayo n t a _ )     == (Ensayo n' t' a' _ )     = (n == n') && (mismoTema t t') && (a == a')
        (Novela n g a _ _)    == (Novela n' g' a' _ _)    = (n == n') && (mismoGenero g g') && (a == a')
        (Poesia n e a _ _)    == (Poesia n' e' a' _ _)    = (n == n') && (mismoEstilo e e') && (a == a')
        (Cientifico n ar _ _) == (Cientifico n' ar' _ _)  = (n == n') && (mismoAreaEstudio ar ar')

--1.d | Defino la función hayDosDistintosConsecutivos

hayDosDistintosConsecutivos :: [Libro] -> Bool
hayDosDistintosConsecutivos [] = False
hayDosDistintosConsecutivos [_] = False
hayDosDistintosConsecutivos (l:l':ls) = l /= l' || hayDosDistintosConsecutivos (l':ls)

--Ejercicio 2 | Seguimiento de alumnos

--2.a' | Defino el tipo de dato EstadoEstudiantes

data EstadoEstudiantes = EvolucionDeEstudiante String Int [Int] EstadoEstudiantes | NoHayEstudiantes

--2.a | Programo la función avanzarDeAnio

--funciones auxiliares

promedio :: [Int] -> Float
promedio xs = fromIntegral (sum xs) / fromIntegral (length xs)

minimo :: [Int] -> Int
minimo [x] = x
minimo (x:xs) = min x (minimo xs)


avanzarDeAnio :: EstadoEstudiantes -> String -> Bool
avanzarDeAnio (EvolucionDeEstudiante n e xs ede) n1 | n == n1 && promedio xs >= 7 = True 
                                                    | n == n1 && promedio xs >= 6 && minimo xs >= 8 = True
                                                    | n == n1 && promedio xs < 6 = True
                                                    | otherwise = avanzarDeAnio ede n1 
avanzarDeAnio NoHayEstudiantes _ = False

--2.b | Programo la función PromedioGeneral

promedioGeneral :: EstadoEstudiantes -> String -> Maybe Float
promedioGeneral NoHayEstudiantes _ = Nothing
promedioGeneral (EvolucionDeEstudiante n _ xs ede) n' | n == n' = Just (promedio xs)
                                                      | otherwise = promedioGeneral ede n'

[(Ensayo "Hola" Ciencia "M.P" 100), (Ensayo "Hola" Ciencia "F.P" 100) (Ensayo "Arg" Politica "P.L" 100)]