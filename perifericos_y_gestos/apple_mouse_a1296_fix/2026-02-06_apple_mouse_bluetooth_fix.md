# 2026-02-06 Solución de Conexión para Ratón Apple A1296 vía Bluetooth

## Problema

El ratón Apple A1296 no se conectaba de forma estable a un sistema Linux a través de Bluetooth. El dispositivo era detectado intermitentemente, pero los intentos de emparejamiento y conexión resultaban en errores como `Failed to connect: org.bluez.Error.Failed br-connection-create-socket` y un ciclo constante de conexión/desconexión (`Connected: yes`/`Connected: no`).

## Diagnóstico Inicial

*   **Estado del Servicio Bluetooth:** Se verificó que el servicio `bluetooth.service` estaba activo y funcionando (`systemctl status bluetooth`).
*   **Detección del Dispositivo:** El ratón era detectado por `bluetoothctl scan on`, pero solo permanecía visible durante un corto período, lo que dificultaba el emparejamiento a tiempo.
*   **Errores de Conexión:** Tras un emparejamiento inicial exitoso, los intentos de `connect` fallaban con el error `br-connection-create-socket`, indicando un problema en la creación del socket de conexión.

## Solución Aplicada

Para resolver el problema, se implementaron dos acciones principales: la modificación del archivo de configuración de Bluetooth y un proceso de reconexión limpia.

### 1. Modificación del Archivo de Configuración de Bluetooth (`/etc/bluetooth/main.conf`)

Se realizaron ajustes en la sección `[General]` del archivo `/etc/bluetooth/main.conf` para optimizar la gestión de perfiles Bluetooth, asegurando que el perfil HID (Human Interface Device) necesario para el ratón fuera manejado correctamente.

**Cambios específicos en `main.conf`:**

```
[General]
# ControllerMode = dual        # Se comentó para evitar posibles conflictos
# MultiProfile = off
FastConnectable = true
JustWorksRepairing = always
ClassicBondedOnly = false
Disable=Headset                # Se añadió para evitar conflictos con ciertos perfiles
Enable=Source,Sink,Headset,Media,A2DP,HFP,HSP,AVRCP,HID # Se habilitaron explícitamente los perfiles, incluyendo HID
```

### 2. Reinicio del Servicio de Bluetooth y Proceso de Reconexión Limpia

Después de modificar el archivo `main.conf`, se reinició el servicio de Bluetooth y se siguió un procedimiento estricto en `bluetoothctl` para asegurar una conexión estable:

1.  **Reiniciar el Servicio Bluetooth:**
    ```bash
    sudo systemctl restart bluetooth
    ```
2.  **Verificar el Estado del Servicio:**
    ```bash
    systemctl status bluetooth
    ```
    (Asegurarse de que el servicio estuviera `active (running)`).
3.  **Eliminar Emparejamientos Previos (dentro de `bluetoothctl`):**
    ```
    bluetoothctl
    remove C4:2C:03:A1:32:22
    ```
    (Donde `C4:2C:03:A1:32:22` es la dirección MAC del ratón Apple Wireless Mouse).
4.  **Iniciar un Nuevo Escaneo (dentro de `bluetoothctl`):**
    *   Poner el ratón en modo de emparejamiento.
    *   Ejecutar `scan on`.
5.  **Emparejar Rápidamente (dentro de `bluetoothctl`):**
    *   Tan pronto como el ratón (`C4:2C:03:A1:32:22`) fue detectado en el escaneo, se ejecutó inmediatamente:
        ```
        pair C4:2C:03:A1:32:22
        ```
6.  **Establecer Confianza (dentro de `bluetoothctl`):**
    ```
    trust C4:2C:03:A1:32:22
    ```
7.  **Conectar (dentro de `bluetoothctl`):**
    ```
    connect C4:2C:03:A1:32:22
    ```

## Resultado

Tras aplicar estas configuraciones y seguir el proceso de reconexión limpia, el ratón Apple A1296 se conectó de forma estable al sistema Bluetooth y funciona correctamente.
