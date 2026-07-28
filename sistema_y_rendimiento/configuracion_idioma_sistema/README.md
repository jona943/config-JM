# Cómo Configuré el Idioma de mi Sistema a Español (27 de enero de 2026)

## Propósito

Decidí establecer el idioma de todo mi sistema a Español (`es_ES.UTF-8`). Hice esto para solucionar problemas de localización en aplicaciones como Google Chrome, que a veces no respetaban mi configuración de idioma debido a variables de entorno conflictivas.

## Comandos que Ejecuté

Utilicé los siguientes comandos para configurar el idioma a nivel de todo el sistema:

1.  **Establecí el idioma principal (`LANG`):**
    ```bash
    sudo localectl set-locale LANG=es_ES.UTF-8
    ```
    Con este comando definí el idioma y la codificación de caracteres principal para todo el sistema.

2.  **Establecí la variable de idioma de respaldo (`LANGUAGE`):**
    ```bash
    sudo localectl set-locale LANGUAGE=es
    ```
    Esta variable actúa como una lista de idiomas de respaldo. Al establecerla en `es`, me aseguré de que el español sea la preferencia principal, evitando que otros valores (como `en`) tomaran precedencia.

## ¡Acción Requerida!

**Para que estos cambios surtan efecto, tengo que cerrar la sesión y volver a iniciarla, o reiniciar el ordenador.**

## Verificación

Después de reiniciar la sesión, puedo abrir una terminal y ejecutar `locale` para verificar que el idioma se aplicó correctamente. La salida debería mostrar `LANG=es_ES.UTF-8` y `LANGUAGE=es`.

## Siguiente Paso: Revertir la Configuración Específica de Chrome

Ahora que el idioma de mi sistema está correctamente configurado, la modificación que hice para forzar el idioma en Chrome ya no es necesaria. Para mantener una configuración limpia, es recomendable que la revierta.

Para hacerlo, simplemente reinstalaré Google Chrome. El gestor de paquetes reemplazará el archivo `.desktop` modificado con la versión original.

```bash
sudo apt-get install --reinstall google-chrome-stable
```