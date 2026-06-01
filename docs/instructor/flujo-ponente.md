# Flujo del ponente

Esta es la version compacta para dar el curso sin perder el hilo.

## Pitch de apertura

Di:

> "Levanten la mano si han tenido un proyecto de Xcode llamado `AppFinal`, `AppFinalBuena`, `AppFinalAhoraSi`, o si han copiado una carpeta completa por miedo a romper el proyecto."

Luego:

> "En iOS eso duele mas: un cambio pequeno puede romper el demo, un archivo enviado por AirDrop puede pisar el avance de otro, y una carpeta duplicada no te dice quien cambio que. Git nos da historial, ramas y una forma profesional de revisar antes de mezclar."

Cierre:

> "Hoy no vamos a aprender Git como manual. Vamos a practicar el flujo que si se usa: crear rama, modificar Swift, ejecutar, hacer commit, subir a GitHub, abrir Pull Request y resolver un conflicto."

## Idea pedagogica

El ejercicio usa un Swift Package en vez de una app iOS completa para evitar ruido de `project.pbxproj`, assets, firmas o simuladores. Sigue siendo Swift, abre en Xcode y corre con `swift run`, pero deja la atencion en Git.

## Flujo en vivo

1. Los alumnos hacen fork del repo.
2. Clonan su fork:

```bash
git clone https://github.com/USUARIO-ALUMNO/curso-git-bootcamp.git
cd curso-git-bootcamp
swift run
```

3. Configuran `upstream`:

```bash
git remote add upstream https://github.com/USUARIO-INSTRUCTOR/curso-git-bootcamp.git
git remote -v
```

4. Crean rama:

```bash
git switch -c feat/nombre-apellido
```

5. Editan:

```text
Sources/IOSLaunchLab/main.swift
```

6. Agregan un `AppIdea` debajo del comentario de alumnos.
7. Ejecutan:

```bash
swift run
git status
git diff
```

8. Guardan:

```bash
git add Sources/IOSLaunchLab/main.swift
git commit -m "Agrega idea iOS de Nombre Apellido"
```

9. Suben rama:

```bash
git push -u origin feat/nombre-apellido
```

10. Abren Pull Request hacia `main` del repo del instructor.

## Lluvia de Conflictos (Aprobacion por Lotes)

Para clases grandes (20+ alumnos), todos tendran conflicto al intentar agregar su `AppIdea` en la misma linea.

1. Pide a todos abrir su PR (quedaran ~20 en verde).
2. Aprueba (Merge) los primeros 5 PRs rapidamente.
3. Los 15 restantes se pondran en rojo (conflicto).
4. Pide a los restantes sincronizar y resolver:

```bash
git fetch upstream
git switch main
git pull upstream main
git switch feat/nombre-apellido
git merge main
```

5. En Xcode, borran las marcas de Git y juntan las ideas de todos en el mismo arreglo.
6. Prueban con `swift run` para evitar errores de sintaxis.
7. Guardan y suben:

```bash
git status
git add Sources/IOSLaunchLab/main.swift
git commit -m "fix: resuelve conflicto de integracion"
git push
```

8. Aprueba el primer PR que se ponga verde (esto creara nuevos conflictos para los demas, ensenando la naturaleza dinamica del trabajo en equipo).

## Cierre

Pide que repitan este flujo:

```bash
git status
git switch main
git pull upstream main
git switch -c feat/mi-tarea
swift run
git diff
git add .
git commit -m "Mensaje claro"
git push -u origin feat/mi-tarea
```

Frase final:

> "No necesitan saber todo Git hoy. Necesitan dominar este flujo y repetirlo bien cada vez que trabajen en una app con mas personas."
