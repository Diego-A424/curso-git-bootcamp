# Errores comunes

Usa esta guia cuando algo no salga como esperabas durante el curso.

## `Author identity unknown`

Git no sabe quien eres.

Solucion:

```bash
git config --global user.name "Tu Nombre"
git config --global user.email "tu-correo@example.com"
```

Verifica:

```bash
git config --global user.name
git config --global user.email
```

## `remote upstream already exists`

Ya habias agregado `upstream`.

Revisa:

```bash
git remote -v
```

Si apunta al repo correcto del instructor, no hagas nada mas.

Si apunta a una URL incorrecta:

```bash
git remote set-url upstream https://github.com/USUARIO-INSTRUCTOR/curso-git-bootcamp.git
git remote -v
```

## Mi push falla

Primero revisa a donde estas intentando subir:

```bash
git remote -v
git branch
git status
```

Para el curso, normalmente debes subir a `origin`, no a `upstream`:

```bash
git push -u origin feat/nombre-apellido
```

Si GitHub pide autenticacion, ejecuta:

```bash
gh auth login --web --hostname github.com --git-protocol https
gh auth status
```

## No aparece el Pull Request

Confirma que subiste tu rama:

```bash
git branch
git push -u origin feat/nombre-apellido
```

Luego entra a tu fork en GitHub y busca la rama. Si no aparece el boton automatico, usa **Pull requests > New pull request**.

## Estoy en la rama incorrecta

Diagnostico:

```bash
git branch
git status
```

Cambiate a tu rama:

```bash
git switch feat/nombre-apellido
```

Si hiciste cambios sin commit en la rama equivocada, no cambies de rama a la fuerza. Primero pregunta o revisa:

```bash
git status
```

## Hice commit en `main` por accidente

Para el curso, si todavia no subiste nada, crea tu rama desde ese punto:

```bash
git switch -c feat/nombre-apellido
git status
```

Luego continua con:

```bash
git push -u origin feat/nombre-apellido
```

Despues pide ayuda al instructor para dejar `main` limpio si hace falta.

## No me salio conflicto

Puede pasar si no tocaste exactamente la misma linea que el instructor.

Revisa que modificaste esta linea de `index.html`:

```html
<p id="tema-oficial" class="theme-line">Tema oficial: convertir cambios sueltos en colaboracion profesional.</p>
```

Luego confirma que trajiste cambios de `upstream`:

```bash
git fetch upstream
git switch main
git pull upstream main
git switch feat/nombre-apellido
git merge main
```

Si aun no hay conflicto, no pasa nada: tambien aprendiste el caso normal de merge.

## Git abrio un editor despues de `git commit`

Eso suele pasar al terminar un merge.

Si estas en VS Code:

1. Deja el mensaje que Git puso.
2. Guarda el archivo.
3. Cierra la pestana.

Si estas en Vim por accidente:

```text
Presiona Esc
Escribe :wq
Presiona Enter
```

## Mis cambios no se ven en GitHub

Revisa si hiciste commit y push:

```bash
git status
git log --oneline -3
git push
```

Si `git status` dice que hay cambios sin guardar, falta hacer:

```bash
git add .
git commit -m "Describe el cambio"
git push
```

## Quiero cancelar cambios que no he guardado

Si estas seguro de descartar un archivo:

```bash
git restore index.html
```

Si solo lo agregaste con `git add` pero aun no hiciste commit:

```bash
git restore --staged index.html
```

No uses `git reset --hard` durante el curso salvo que el instructor lo indique.
