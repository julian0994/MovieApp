# MovieApp
<img src="https://github.com/julian0994/MovieApp/blob/main/assets/images/IconMovieSF.png" width="200" />


## Introducción 📌

MovieApp es una aplicación Flutter que consume una API REST pública proporcionada por [The Movie Database (TMDB)](https://developer.themoviedb.org/docs/getting-started) para mostrar una lista de películas populares con paginación infinita.

## Capturas de Pantalla 📸

## Capturas de Pantalla 📸

| Splash | Home Light | Home Dark | Details |
|--------|------------|-----------|---------|
| ![Splash](https://github.com/julian0994/MovieApp/blob/main/assets/images/screenshots/splash.jpeg?raw=true =600x) | ![Home Light](https://github.com/julian0994/MovieApp/blob/main/assets/images/screenshots/homelight.jpeg?raw=true =600x) | ![Home Dark](https://github.com/julian0994/MovieApp/blob/main/assets/images/screenshots/homedark.jpeg?raw=true =600x) | ![Details](https://github.com/julian0994/MovieApp/blob/main/assets/images/screenshots/details.jpeg?raw=true =600x) |


## Requisitos Previos 🛠

* Antes de comenzar verificar los siguientes elementos:
* Flutter (versión recomendada: 3.27.3)
* Dart (versión compatible con Flutter)
* Un editor de texto como Visual Studio Code o Android Studio
* Un emulador o dispositivo físico para probar la aplicación

## Instalación y Configuración 🚀

### Clonar el repositorio:
* git clone https://github.com/tu-usuario/movieapp.git
* cd movieapp
### Instalar dependencias:
* flutter pub get
### Ejecutar la aplicación:
* flutter run


## Funcionalidades 📌

* Búsqueda de películas
* Detalles de películas
* Marcar película como favorita
* Modo Oscuro/Claro
* Paginación infinita


## Estructura del Proyecto 📂

El proyecto sigue una arquitectura por capas utilizando Riverpod para la gestión de estado:
```
lib/
│── core/             # Configuración API
│── data/             # Repositorios y fuentes de datos
│── domain/           # Lógica de negocio y modelos
│── presentation/     # Widgets, Screens y providers de UI
│── main.dart         # Punto de entrada de la aplicación
```

## Decisiones Técnicas y Arquitectura 💡

### Gestión del Estado: Riverpod 📌

Se eligió Riverpod debido a que es una herramienta confiable que facilita el desarrollo, mejora el rendimiento y es posible la futura escalabilidad de la app.

### Arquitectura por Capas 📌

Se sigue un patrón de arquitectura por capas para mantener una separación clara entre UI, lógica de negocio y datos.


