# Mi Proceso de Instalación y Configuración de Fastfetch

En este documento detallo los pasos que seguí para instalar `fastfetch` en mi sistema y configurarlo para que se ejecute automáticamente al abrir una nueva terminal.

### 1. Problema Inicial: `fastfetch` no encontrado por `apt`

Intenté instalar `fastfetch` utilizando el comando `sudo apt install fastfetch`, pero la operación me falló con el error: "E: No se ha podido localizar el paquete fastfetch". Esto me indicó que el paquete no estaba disponible en los repositorios de paquetes que tenía configurados.

### 2. Actualización de Listas de Paquetes (Primer Intento de Solución)

Ejecuté `sudo apt update` para actualizar las listas de paquetes de mi sistema, con la esperanza de que `fastfetch` pudiera estar disponible después de la actualización.

### 3. Reintento de Instalación y Confirmación del Problema

Volví a intentar `sudo apt install fastfetch`, pero la instalación falló de nuevo con el mismo mensaje, lo que me confirmó que `fastfetch` no se encontraba en mis repositorios estándar.

### 4. Investigación de Métodos de Instalación

Para encontrar una solución, hice una búsqueda web con la consulta "fastfetch install linux". Los resultados me sugirieron que, para mi sistema (basado en Debian/Ubuntu), el método recomendado para obtener la versión más reciente era a través de un Personal Package Archive (PPA).

### 5. Adición del PPA de `fastfetch`

Añadí el PPA oficial de `fastfetch` a mi sistema con el comando:
```bash
sudo add-apt-repository ppa:zhangsongcui3371/fastfetch -y
```
Este comando no solo añadió el repositorio, sino que también ejecutó un `apt update` para integrar las nuevas listas de paquetes.

### 6. Instalación Exitosa de `fastfetch`

Después de añadir el PPA, procedí con la instalación:
```bash
sudo apt install fastfetch -y
```
Esta vez, la instalación se completó exitosamente.

### 7. Verificación de la Instalación

Para asegurarme de que `fastfetch` se había instalado correctamente y funcionaba como esperaba, ejecuté:
```bash
fastfetch
```
El comando se ejecutó sin errores y me mostró la información detallada de mi sistema.

### 8. Configuración de Ejecución Automática

Quería que `fastfetch` se ejecutara automáticamente cada vez que abriera una nueva terminal.

### 9. Identificación del Archivo de Configuración del Shell

Determiné que mi shell era `bash`. El archivo de configuración estándar para `bash` es `~/.bashrc`.

### 10. Añadir `fastfetch` a `.bashrc`

Añadí la línea `fastfetch` al final de mi archivo `~/.bashrc`. Incluí un comentario para mayor claridad:
```bash
echo '
# Ejecutar fastfetch en una nueva terminal
fastfetch' >> ~/.bashrc
```

### 11. Verificación de la Modificación

Para confirmar que había añadido las líneas correctamente, usé el comando:
```bash
tail -n 5 ~/.bashrc
```
La salida me mostró las líneas añadidas al final del archivo.

### Conclusión

He instalado y configurado `fastfetch` con éxito para que se ejecute automáticamente cada vez que inicie una nueva sesión de terminal. Para observar los cambios, necesito abrir una *nueva instancia* de mi aplicación de terminal.
