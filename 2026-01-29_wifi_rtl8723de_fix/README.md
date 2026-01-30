# Solución del Problema de Wi-Fi para mi Realtek RTL8723DE

## Propósito

En este documento, detallo el proceso de diagnóstico y la solución que apliqué para un problema en el que mi tarjeta Wi-Fi Realtek RTL8723DE no era detectada por el sistema operativo (Ubuntu con kernel 6.11 OEM), a pesar de que la conexión Ethernet funcionaba correctamente. Mi objetivo era restaurar la funcionalidad de la red inalámbrica.

## Archivos

No necesité incluir archivos de configuración permanentes, ya que la solución consistió en reparar la instalación del kernel de mi sistema y no en añadir o modificar ficheros de configuración.

## Mi Proceso de Diagnóstico y Solución

Resolví el problema siguiendo un proceso de diagnóstico que me llevó a reinstalar los paquetes del kernel para corregir una inconsistencia interna.

### 1. Diagnóstico Inicial

- **`nmcli`**: El comando no me mostraba ninguna interfaz `wlan`, lo que confirmó que NetworkManager no la detectaba.
- **`rfkill list`**: Este comando no mostró ningún dispositivo Wi-Fi, indicándome que no estaba bloqueado por software, sino que era invisible para el sistema a ese nivel.
- **`lspci`**: Este comando **sí** detectó el hardware correctamente, identificándolo como `Realtek Semiconductor Co., Ltd. RTL8723DE 802.11b/g/n PCIe Adapter [10ec:d723]`. Esto me apuntó a un problema de controlador (driver).
- **`dmesg`**: Inicialmente, no encontré mensajes relacionados con `rtl8723de`, lo que me sugirió que el sistema ni siquiera estaba intentando cargar un controlador.

### 2. Intento de Carga Manual del Módulo

Intenté cargar manualmente el módulo que debería gestionar el dispositivo, basándome en mi versión del kernel (superior a 5.3):

```bash
sudo modprobe rtw88_8723de
```

Este comando me falló con el error `modprobe: ERROR: could not insert 'rtw88_8723de': Invalid argument`.

### 3. Análisis del Error del Kernel

Tras el intento de carga fallido, revisé `dmesg`:

```bash
sudo dmesg | tail -n 20
```

La salida me reveló el problema raíz: una serie de errores `disagrees about version of symbol` y `Unknown symbol`. Esto indicaba que los módulos del controlador (`rtw88_core`, etc.) eran incompatibles con la versión del kernel que estaba ejecutando. La causa más probable era una actualización fallida o la existencia de módulos residuales de compilaciones anteriores, lo que resultó en una inconsistencia en mi sistema.

### 4. Solución: Reinstalación del Kernel

Para asegurar la consistencia entre el kernel y sus módulos, forcé la reinstalación de los paquetes del kernel que estaba usando.

- **Identifiqué los paquetes del kernel:**
  ```bash
  apt list --installed | grep 6.11.0-1007-oem
  ```

- **Reinstalé los paquetes:**
  ```bash
  sudo apt install --reinstall linux-image-6.11.0-1007-oem linux-modules-6.11.0-1007-oem linux-headers-6.11.0-1007-oem
  ```

### 5. Reinicio y Verificación

Tras la reinstalación, necesité un reinicio completo del sistema. Después de reiniciar, el controlador se cargó automáticamente y la interfaz Wi-Fi fue detectada por `nmcli`, lo que finalmente solucionó el problema.

## Instrucciones de Reversión (Rollback)

La acción que realicé fue una reinstalación de los mismos paquetes del kernel para reparar su estado, no una actualización o un cambio de versión. Por lo tanto, no existe un proceso de "reversión" como tal. La operación restauró los archivos del kernel a su estado original y consistente.

Si quisiera cambiar de kernel, debería instalar otros paquetes de `linux-image` y `linux-modules` a través de `apt` y seleccionar el kernel que desee desde el menú de GRUB al arrancar.

## Contexto Adicional

Para mí, el error de "incompatibilidad de versión de símbolos" con un kernel y módulos que supuestamente deberían ser nativos fue un problema poco común pero crítico. Entiendo que generalmente es el resultado de un estado inconsistente del sistema, que puede ser causado por instalaciones de software que interactúan con el kernel (como DKMS), compilaciones manuales de controladores que no se desinstalan limpiamente, o actualizaciones de paquetes interrumpidas. La reinstalación de los paquetes del kernel fue la solución más limpia y segura que encontré para resolver estas discrepancias.