# Cómo Configuré un Reproductor de Vídeo para Shotwell

## Propósito

En esta documentación describo el proceso que seguí para instalar y configurar un reproductor de vídeo compatible con mi aplicación de gestión de fotos Shotwell, ya que por defecto no incluye uno.

## Archivos

Este directorio solo contiene este archivo `README.md` con las instrucciones. No necesité archivos de configuración adicionales.

## Pasos que Seguí para la Instalación

1.  **Instalé un reproductor de vídeo ligero:** Elegí `mpv` por ser una opción ligera y eficiente.
    ```bash
    sudo apt install mpv
    ```
2.  **Lo establecí como reproductor predeterminado:** Para que Shotwell pudiera utilizar `mpv`, tenía que ser el reproductor por defecto de mi sistema. Lo pude hacer de dos maneras:
    *   **Desde el explorador de archivos:**
        1.  Hice clic derecho en un archivo de vídeo.
        2.  Seleccioné "Abrir con otra aplicación".
        3.  Elegí "mpv Media Player" y lo establecí como predeterminado.
    *   **Desde la línea de comandos:**
        ```bash
        xdg-mime default mpv.desktop video/mp4 video/x-matroska video/webm video/avi
        ```

## Cómo Revertir los Cambios

Para deshacer los cambios, simplemente desinstalaría el reproductor de vídeo:

```bash
sudo apt remove mpv
```

## Contexto Adicional

Me di cuenta de que Shotwell no tiene un reproductor de vídeo integrado, por lo que depende del reproductor que mi sistema operativo tenga configurado por defecto. Elegí `mpv` porque es una opción recomendada para sistemas con recursos limitados como el mío. Otra alternativa popular, `vlc`, me pareció más pesada.