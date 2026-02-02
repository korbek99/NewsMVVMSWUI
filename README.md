# NewsMVVMSWUI 📰

Una aplicación moderna de noticias desarrollada con **SwiftUI** siguiendo el patrón de diseño **MVVM** 
(Model-View-ViewModel). Este proyecto demuestra cómo consumir una API de noticias externa, manejar 
estados de red y organizar el código de manera limpia y escalable.

## 🚀 Características

- **Lista de Noticias:** Visualización de artículos de noticias actuales con imágenes y descripciones.
- **Arquitectura MVVM:** Separación clara entre la lógica de negocio, los datos y la interfaz de usuario.
- **SwiftUI + Combine:** Uso de frameworks modernos de Apple para una interfaz reactiva.
- **Manejo de Imágenes:** Carga asíncrona de imágenes para optimizar el rendimiento.
- **Navegación Fluida:** Uso de `NavigationStack` (o NavigationView) para ver detalles de cada noticia.

## 🛠️ Tecnologías Utilizadas

- **Lenguaje:** Swift 5.x
- **Framework UI:** SwiftUI
- **Arquitectura:** MVVM
- **Gestión de Datos:** URLSession para peticiones HTTP.
- **Asincronía:** Async/Await o Combine.

## 📦 Estructura del Proyecto

```text
NewsMVVMSWUI/
├── Models/          # Estructuras de datos (News, Article)
├── ViewModels/      # Lógica de negocio y estado de la vista
├── Views/           # Componentes de la interfaz de usuario
├── Services/        # Llamadas a la API y networking
└── Resources/       # Assets y configuraciones
