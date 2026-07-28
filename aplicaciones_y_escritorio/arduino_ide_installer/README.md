# Instalador de Arduino IDE (20 de enero de 2026)

## Propósito

En este directorio guardé el instalador de la versión 2.3.7 de Arduino IDE para sistemas Linux de 64 bits, en formato AppImage.

## Archivos

- **`arduino-ide_2.3.7_Linux_64bit.AppImage`**: El archivo ejecutable de Arduino IDE.

## ¿Qué es un AppImage?

Un AppImage es un formato de paquete universal para distribuir software en Linux. No requiere una instalación tradicional, ya que contiene la aplicación y todas sus dependencias en un único archivo.

## Pasos que seguí para usarlo

1.  **Hice el archivo ejecutable:**
    Antes de poder ejecutar el archivo, le di permisos de ejecución. Abrí una terminal en este directorio y ejecuté:
    ```bash
    chmod +x arduino-ide_2.3.7_Linux_64bit.AppImage
    ```
    También pude haberlo hecho desde el explorador de archivos:
    - Clic derecho sobre el archivo.
    - Ir a "Propiedades".
    - Ir a la pestaña de "Permisos".
    - Marcar la casilla "Permitir ejecutar el archivo como un programa".

2.  **Ejecuté Arduino IDE:**
    Una vez que el archivo fue ejecutable, lo inicié desde la terminal:
    ```bash
    ./arduino-ide_2.3.7_Linux_64bit.AppImage
    ```
    También podría haberlo hecho con un doble clic sobre el archivo.

## Integración con el Sistema (Opcional)

Si quisiera que la aplicación apareciera en el menú de aplicaciones de mi escritorio, podría mover el archivo AppImage a un directorio como `~/Applications` o `~/.local/bin` y crear un archivo `.desktop` para él. Sin embargo, para un uso simple, los pasos anteriores fueron suficientes.