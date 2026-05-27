# Laboratorio de conflictos

Un conflicto no significa que Git se rompio. Significa que dos cambios tocaron la misma parte del archivo y Git necesita que una persona decida que version queda.

## Objetivo

Provocar un conflicto controlado, resolverlo y subir la solucion.

## Preparacion del instructor

En el repo principal, modifica esta linea de `index.html` en `main`:

```html
<p id="tema-oficial" class="theme-line">Tema oficial: convertir cambios sueltos en colaboracion profesional.</p>
```

Cambia solo el texto interno. Por ejemplo:

```html
<p id="tema-oficial" class="theme-line">Tema oficial: colaborar sin perder historial ni sobrescribir a tu equipo.</p>
```

Haz commit y push directo a `main` del repo principal.

## Paso de los alumnos

En su rama de trabajo, cada alumno modifica la misma linea, pero con otro texto:

```html
<p id="tema-oficial" class="theme-line">Tema oficial: aprender Git practicando con un proyecto real.</p>
```

Luego guarda su cambio:

```bash
git status
git add index.html
git commit -m "Actualiza tema oficial de la Expo"
```

## Traer cambios del repo principal

```bash
git fetch upstream
git switch main
git pull upstream main
git switch feat/nombre-apellido
git merge main
```

Debe aparecer un conflicto en `index.html`.

## Como se ve un conflicto

Git marcara una zona similar a esta:

```html
<<<<<<< HEAD
<p id="tema-oficial" class="theme-line">Tema oficial: aprender Git practicando con un proyecto real.</p>
=======
<p id="tema-oficial" class="theme-line">Tema oficial: colaborar sin perder historial ni sobrescribir a tu equipo.</p>
>>>>>>> main
```

Interpretacion:

- `HEAD`: tu version actual.
- La parte despues de `=======`: version que viene de `main`.
- Tu trabajo es dejar una sola version final.

## Resolver

Edita el archivo y deja una version final, por ejemplo:

```html
<p id="tema-oficial" class="theme-line">Tema oficial: aprender Git colaborando sin perder historial.</p>
```

Despues:

```bash
git status
git add index.html
git commit
git push
```

Si Git abre un editor para el commit del merge, guarda y cierra. En VS Code puedes cerrar la pestana del mensaje despues de guardar.

## Mensaje para recordar

Un conflicto no se arregla presionando botones al azar. Se arregla leyendo:

1. Que queria mi rama.
2. Que trae `main`.
3. Que version final tiene sentido.
