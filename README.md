# Counter App

Una aplicación Flutter minimalista y limpia para contar, con historial y arquitectura Clean Architecture.

## Características

- **Contador**: Incrementa, decrementa y reinicia el valor del contador.
- **Historial**: Cada acción se guarda con fecha y hora, mostrándose en una lista con scroll automático.
- **Animaciones**: Los valores del contador y los botones tienen animaciones suaves usando Animate Do.
- **Gestión de estado**: Implementada con Riverpod y generación automática de providers.
- **Cambio de tema**: Soporte para tema claro, oscuro y sistema.
- **Arquitectura limpia**: Separación en carpetas `app`, `config`, y `features`, siguiendo buenas prácticas.

## Estructura del proyecto

```
lib/
├── app/
├── config/
│   ├── theme/
│   ├── utils/
│   └── router/
└── features/
    └── counter/
        ├── domain/
        ├── data/
        └── presentation/
```

## Instalación y ejecución

1. Clona el repositorio:
   ```sh
   git clone https://github.com/MatiVMutte/counter_app.git
   ```
2. Instala dependencias:
   ```sh
   flutter pub get
   ```
3. Genera archivos necesarios:
   ```sh
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
4. Corre la app:
   ```sh
   flutter run
   ```

## Autor
- [MatiVMutte](https://github.com/MatiVMutte)

---
¡Disfruta programando con Flutter y Riverpod!
