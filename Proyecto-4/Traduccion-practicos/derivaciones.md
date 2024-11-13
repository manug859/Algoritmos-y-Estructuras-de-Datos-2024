```latex
Nota: en el libro de cálculo está este mismo ejercicio pero con la pre como \( N \geq 1 \)

\[
\text{Const N : Int;}
\]
\[
\text{Var a : array[0, N) of Int, r : Int;}
\]
\[
\{P : N \geq 1\}
\]

Pasos:
- Derivar el cuerpo del ciclo.
- Determinar invariante y guarda.
- Inicialización.

Cuerpo del ciclo:

\[
\text{INV} \equiv r = \langle \max_{p, q} : 0 \le p < q < n : a.p - a.q \rangle \land 0 \le n \le N
\]
...

Resumen del programa final:

\[
\text{Const N : Int;}
\]
\[
\text{Var a : array[0, N) of Int, r : Int;}
\]
\[
\{P : N \geq 2\}
\]
\[
r, s, n := -\infty, a.0, 1
\]
\[
\text{do } n < N \rightarrow r, s, n := r \max (s - a.n), s \max a.n, n+1
\]
\[
\text{od}
\]
\[
\{Q : r = \langle \max_{p, q} : 0 \le p < q < N : a.p - a.q \rangle \}
\]
```
