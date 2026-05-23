# Proyecto Flutter: pantalla estilo Prime Video

Este proyecto es una maqueta educativa inspirada en una app de peliculas tipo Prime Video. No usa logos ni imagenes oficiales, asi que funciona sin descargar recursos extra.

## Que contiene

- `pubspec.yaml`: configuracion del proyecto Flutter.
- `lib/main.dart`: toda la pantalla principal de la app.

## Paso a paso desde cero

1. Instala Flutter desde https://docs.flutter.dev/get-started/install/windows
2. Instala Visual Studio Code.
3. Abre Visual Studio Code.
4. Instala estas extensiones en VS Code:
   - Flutter
   - Dart
5. Abre una terminal en VS Code: Terminal > New Terminal.
6. Crea el proyecto base con este comando:

```powershell
flutter create prime_video_clone
```

7. Entra a la carpeta:

```powershell
cd prime_video_clone
```

8. Copia el archivo `lib/main.dart` de esta carpeta guia y reemplaza el `lib/main.dart` del proyecto creado por Flutter.
9. Copia el contenido de `pubspec.yaml` de esta carpeta guia y reemplaza el `pubspec.yaml` del proyecto creado por Flutter.
10. Guarda todo con Ctrl + S.
11. Ejecuta:

```powershell
flutter pub get
flutter run
```

Si tienes un celular conectado, Flutter lo detectara. Si no, puedes usar Chrome o un emulador Android.

## Si algo falla

Ejecuta este comando y revisa lo que falta instalar:

```powershell
flutter doctor
```

## Como explicar el proyecto en clase

Puedes decir:

"Mi aplicacion es una maqueta movil inspirada en plataformas de streaming. Tiene una pantalla inicial con una pelicula destacada, secciones horizontales para continuar viendo y recomendaciones, tarjetas de contenido, botones de reproduccion y una barra de navegacion inferior. Fue desarrollada con Flutter usando widgets como Scaffold, CustomScrollView, NavigationBar, ListView y Container."
