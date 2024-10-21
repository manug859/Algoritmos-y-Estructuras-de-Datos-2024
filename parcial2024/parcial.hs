--parcial 1 | Algoritmos y Estructuras de Datos.
--Manuel Gomez


--Ejercicio 1

data Dia =  Lunes | Martes | Miercoles | Jueves | Viernes | Sabado | Domingo deriving (Eq, Show)

data CategoriaDescuento =  Combustible | Supermercado | ComidaRapida deriving Show
type TotalReintegro = Int 
type TopeDescuento = Int
type PorcentajeDescuento = Int
type BilleteraVirtual = String

data Ahorro = Descuento BilleteraVirtual CategoriaDescuento PorcentajeDescuento TopeDescuento [Dia] | Reintegro BilleteraVirtual CategoriaDescuento TotalReintegro deriving Show

--1.b)

naftaPP :: Ahorro
naftaPP = (Descuento "Personal Pay" Combustible 25 2500 [Lunes, Martes])

macNX :: Ahorro
macNX = (Reintegro "NaranjaX" ComidaRapida 3000)

--1.c)

hayDescuentoDia :: Ahorro -> Dia -> Bool
hayDescuentoDia (Descuento bv c p t xs) d | elem d xs = True
                                       | otherwise = False
hayDescuentoDia (Reintegro bv c t ) d = False

{-
    Ejemplos de ejecucion:
ghci> hayDescuento (Descuento "PersonalPay" Supermercado 10 2000 [Lunes, Miercoles, Viernes]) Jueves
False
ghci> hayDescuento (Descuento "PersonalPay" Supermercado 10 2000 [Lunes, Miercoles, Viernes]) Viernes
True
ghci> hayDescuento (Reintegro "NX" ComidaRapida 1500) Viernes
False
-}

--1.d)

esDescuentoCombustible :: Ahorro -> Bool
esDescuentoCombustible (Descuento bv Combustible p t xs) = True
esDescuentoCombustible (Descuento bv _ p t xs) = False
esDescuentoCombustible (Reintegro bv c t) = False

{-
    ejemplos de ejecucion:
ghci> esDescuentoCombustible (Descuento "BnaMas" Combustible 10 2000 [Lunes, Viernes])
True
ghci> esDescuentoCombustible (Descuento "BnaMas" ComidaRapida  10 2000 [Lunes, Viernes])
False
ghci> esDescuentoCombustible (Reintegro "BnaMas" Supermercado 2200)
False
-}



--1.e)

tipoDescuento :: Ahorro -> CategoriaDescuento
tipoDescuento (Descuento bv c p t xs) = c
tipoDescuento (Reintegro bv c t) = c

totalDescuento :: Ahorro -> Int
totalDescuento (Descuento bv c p t xs) = t
totalDescuento (Reintegro bv c t) = t



mayorDescuentoOReintegro :: [Ahorro] -> Int
mayorDescuentoOReintegro [x] = totalDescuento x 
mayorDescuentoOReintegro (x:xs) = max (totalDescuento x) (mayorDescuentoOReintegro xs)

{-  ejemplo de ejecucion:
ghci> mayorDescuentoOReintegro [(Descuento "BnaMas" Combustible 10 2000 [Lunes, Viernes]), (Reintegro "BnaMas" Supermercado 2200)]
2200
ghci> mayorDescuentoOReintegro [(Descuento "BnaMas" Combustible 10 2000 [Lunes, Viernes]), (Reintegro "BnaMas" Supermercado 2800)]
2800
ghci> mayorDescuentoOReintegro [(Descuento "BnaMas" Combustible 10 12000 [Lunes, Viernes]), (Reintegro "BnaMas" Supermercado 2800)]
12000
-}

--Ejercicio 2 

--2)
data ColaAhorro = NoHayAhorro | AgregarAhorro Ahorro ColaAhorro deriving Show

ahorrosMaria :: ColaAhorro
ahorrosMaria = AgregarAhorro naftaPP (AgregarAhorro macNX NoHayAhorro)

--2')

ahorrosCombustible :: ColaAhorro -> ColaAhorro
ahorrosCombustible NoHayAhorro = NoHayAhorro