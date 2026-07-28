# Cómo Forcé el Idioma de Google Chrome a Español (27 de enero de 2026)

## Propósito

Mi objetivo era forzar a Google Chrome para que se ejecutara en español, solucionando un problema que tenía donde el navegador ignoraba la configuración regional de mi sistema y se mantenía en inglés.

## Archivos

- **`google-chrome.desktop`**: Una copia que modifiqué del lanzador de la aplicación Google Chrome.
- **`README.md`**: Este archivo de instrucciones.

## Causa del Problema

Descubrí que mi sistema tenía la variable de entorno `LANGUAGE` establecida en `en` (inglés), la cual tiene prioridad sobre la variable `LANG` (`es_ES.UTF-8`). Esto provocaba que Chrome se iniciara en inglés.

## Solución que Apliqué

Modifiqué el archivo `.desktop` para que siempre inicie Chrome con el idioma español. Lo hice añadiendo el parámetro `--lang=es` a los comandos de ejecución.

**Líneas que modifiqué:**
- `Exec=/usr/bin/google-chrome-stable --lang=es %U`
- `Exec=/usr/bin/google-chrome-stable --lang=es`
- `Exec=/usr/bin/google-chrome-stable --incognito --lang=es`

## Pasos de Instalación que Seguí

Para aplicar este cambio, reemplacé el archivo `.desktop` original de Chrome con la versión modificada que guardé en este directorio.

1.  **Abrí una terminal.**
2.  **Ejecuté el siguiente comando para copiar el archivo a la ubicación correcta:**
    ```bash
    sudo cp google-chrome.desktop /usr/share/applications/google-chrome.desktop
    ```
3.  **Reinicié Google Chrome:** Cerré todas las ventanas de Chrome y lo volví a abrir para ver el cambio.

## Instrucciones para Revertir mis Cambios (Rollback)

Si quisiera revertir este cambio, la forma más sencilla sería reinstalar Google Chrome. El gestor de paquetes reemplazaría el archivo `.desktop` modificado con la versión original.

```bash
sudo apt-get install --reinstall google-chrome-stable
```
