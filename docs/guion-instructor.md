# Guion del instructor

Duracion total: 3 horas.

Formato recomendado: practica guiada. Proyecta tu terminal y GitHub. Los alumnos hacen los pasos contigo.

## Antes de iniciar

Ten listo:

- Repo publico en GitHub.
- URL del repo en una diapositiva o pizarron.
- `index.html` abierto en VS Code.
- GitHub abierto en navegador.
- Una rama de prueba para demostrar errores si hace falta.

## 0:00 - 0:10 | Pitch inicial

Di:

> "Levanten la mano si han tenido archivos llamados `Proyecto_Final`, `Proyecto_Final_Bueno`, `Proyecto_Final_Ahora_Si_Este_Es`."

Espera reaccion.

Di:

> "Ahora levanten la mano si han unido codigo por WhatsApp, correo, USB o copiando carpetas completas."

Conecta:

> "Eso funciona hasta que deja de funcionar. El problema no es que no sepan programar. El problema es que estan trabajando sin historial, sin trazabilidad y sin una forma profesional de colaborar."

Cierra el pitch:

> "Hoy vamos a aprender el flujo minimo que si van a usar: guardar cambios, crear ramas, subir trabajo a GitHub, abrir Pull Requests y resolver conflictos. No vamos a ver Git como manual. Lo vamos a usar como herramienta para sobrevivir proyectos reales."

## 0:10 - 0:25 | Conceptos minimos

Explica con analogias cortas:

- Git: historial local del proyecto.
- GitHub: lugar donde compartimos ese historial.
- Commit: foto del proyecto con nombre y fecha.
- Rama: linea de trabajo separada.
- Pull Request: propuesta para integrar cambios.
- Conflicto: dos personas tocaron la misma parte y hay que decidir.

Proyecta:

```bash
git --version
git config --global user.name "Tu Nombre"
git config --global user.email "tu-correo@example.com"
git config --global --list
```

Frase clave:

> "Git no es guardar por guardar. Git es poder explicar que cambio, cuando cambio y por que cambio."

## 0:25 - 1:05 | Uso individual

Objetivo: que clonen, revisen estado, editen y creen su primer commit.

Primero, pide que hagan fork del repo.

Luego:

```bash
git clone https://github.com/USUARIO-ALUMNO/curso-git-bootcamp.git
cd curso-git-bootcamp
git status
git log --oneline
```

Di:

> "`git status` es su radar. Si no saben que esta pasando, no adivinen: corran `git status`."

Abren `index.html`.

Pide:

> "No cambien todo. Solo vamos a agregar una tarjeta personal en el directorio. Un cambio pequeno, claro y facil de revisar."

Comandos:

```bash
git status
git diff
git add index.html
git commit -m "Agrega tarjeta de Nombre Apellido"
git log --oneline
```

Explica staging:

> "`git add` no guarda todavia. Solo prepara lo que entrara en la foto. `git commit` toma la foto."

## 1:05 - 1:35 | Ramas

Objetivo: que entiendan que cada tarea debe vivir en su propia rama.

Muestra:

```bash
git branch
git switch -c feat/nombre-apellido
git branch
```

Di:

> "Una rama es una mesa de trabajo. Puedes experimentar sin ensuciar la mesa principal."

Haz que todos confirmen que estan en su rama:

```bash
git status
```

Si alguien hizo commits en `main`, no lo reganes. Usalo para explicar:

> "Esto pasa todo el tiempo al inicio. Lo importante es verlo rapido con `git status` y corregir antes de subir."

## 1:35 - 2:10 | GitHub y Pull Requests

Objetivo: subir ramas y abrir PRs.

Comandos:

```bash
git remote -v
git push -u origin feat/nombre-apellido
```

En GitHub, muestra:

- Donde aparece la rama subida.
- Como abrir el Pull Request.
- Como leer el diff.
- Como llenar la plantilla.

Di:

> "Un Pull Request no es burocracia. Es una conversacion sobre un cambio antes de meterlo a la version principal."

Revisa uno o dos PRs en vivo. Comenta algo pequeno para que vean que la revision es parte del flujo.

## 2:10 - 2:40 | Colaboracion y conflictos

Objetivo: que vivan un conflicto controlado y lo resuelvan.

Primero, haz un cambio en `main` del repo principal sobre la linea:

```html
<p id="tema-oficial" class="theme-line">Tema oficial: convertir cambios sueltos en colaboracion profesional.</p>
```

Haz commit y push.

Pide a los alumnos que, en su rama, cambien esa misma linea con otro texto y hagan commit.

Luego:

```bash
git remote add upstream https://github.com/USUARIO-INSTRUCTOR/curso-git-bootcamp.git
git fetch upstream
git switch main
git pull upstream main
git switch feat/nombre-apellido
git merge main
```

Cuando aparezca el conflicto, di:

> "Esto no es un error fatal. Git se detuvo porque no quiere inventar una decision por nosotros."

Abre `index.html` y explica:

- `<<<<<<< HEAD`: lo que trae mi rama.
- `=======`: separador.
- `>>>>>>> main`: lo que viene de la rama que estoy mezclando.

Pide que dejen una sola version final.

Cerrar:

```bash
git status
git add index.html
git commit
git push
```

## 2:40 - 3:00 | Cierre

Repasa el flujo diario:

```bash
git status
git switch main
git pull upstream main
git switch -c feat/mi-tarea
git add .
git commit -m "Describe el cambio"
git push -u origin feat/mi-tarea
```

Frases finales:

> "No necesitan saber todo Git hoy. Necesitan dominar este flujo."

> "Si mañana trabajan en un proyecto de equipo, ya no manden carpetas. Creen ramas, hagan commits y abran Pull Requests."

## Manejo de problemas frecuentes

### `Author identity unknown`

Solucion:

```bash
git config --global user.name "Tu Nombre"
git config --global user.email "tu-correo@example.com"
```

### Estoy en la rama incorrecta

Diagnostico:

```bash
git status
git branch
```

Solucion comun:

```bash
git switch nombre-de-rama
```

### No puedo hacer push

Revisar:

```bash
git remote -v
git branch
```

Normalmente pasa porque estan intentando subir al repo del instructor en vez de su fork.

### No aparece el Pull Request

Revisar que la rama se subio:

```bash
git push -u origin feat/nombre-apellido
```

Luego entrar al fork en GitHub y buscar la rama.
