# Laboratorio de conflictos y la "Carrera de la Integracion"

Un conflicto no significa que Git se rompio. Significa que dos cambios tocaron la misma parte del archivo (por ejemplo, todos agregando su idea en el mismo lugar) y Git necesita que una persona decida como juntarlos.

## Objetivo

Resolver el choque inevitable cuando 20 personas intentan hacer Push de su `AppIdea` a la misma lista al mismo tiempo.

## El escenario de la clase

1. Subiras tu Pull Request (PR) y se vera verde.
2. El instructor aprobara el PR de algunos de tus companeros primero.
3. De repente, tu PR se pondra en rojo. **¡Tienes un conflicto!**
4. Esto sucede porque el archivo original ya tiene nuevas ideas, y Git no sabe si poner tu idea arriba, abajo o en medio.

## Como resolver la cascada

Ve a tu terminal e integra la version actualizada del instructor a tu computadora local:

```bash
# 1. Traer la verdad absoluta (main del instructor)
git fetch upstream
git switch main
git pull upstream main

# 2. Ir a TU rama y tratar de mezclar
git switch feat/tu-nombre
git merge main
```

Aparecera un mensaje de error diciendo `CONFLICT (content)`.

## La Cirugia en Xcode

Abre `Sources/IOSLaunchLab/main.swift` en Xcode. Git habra insertado marcas feas:

```swift
<<<<<<< HEAD
ideas.append(
    AppIdea(owner: "Tu Nombre", appName: "Tu App"...)
)
=======
ideas.append(
    AppIdea(owner: "Companero 1", appName: "App 1"...)
)
ideas.append(
    AppIdea(owner: "Companero 2", appName: "App 2"...)
)
>>>>>>> main
```

Interpretacion:
- `HEAD`: Lo que tu estas intentando subir.
- `=======`: El separador.
- `>>>>>>> main`: Lo que tus companeros ya lograron subir antes que tu.

**Solucion:** Borra las marcas (`<<<<<<<`, `=======`, `>>>>>>>`). **No borres las ideas de tus companeros ni la tuya.** Acomoda el codigo para que la lista contenga TODAS las ideas validamente estructuradas en Swift.

## La Prueba de Fuego y la Carrera Final

Una vez que quitas las marcas rojas, es facil equivocarse y olvidar una coma o un parentesis. Por eso **SIEMPRE** debes compilar:

```bash
swift run
```

Si el panel se imprime correctamente con las ideas sumadas, puedes subirlo:

```bash
git add Sources/IOSLaunchLab/main.swift
git commit -m "fix: resuelve conflicto de ideas"
git push
```

## ⚠️ Advertencia de Velocidad
Si te tardas mucho en hacer `git push`, es probable que otro companero logre subir sus cambios antes que tu. Si el instructor le da Merge al de tu companero, **tu PR volvera a ponerse en rojo y tendras que repetir este ciclo.** ¡A trabajar rapido y bien!
