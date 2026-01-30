# Solución: Discrepancia de Horarios en Zoom

En este documento, detallo los pasos que seguí para resolver la discrepancia de horarios que observaba en la aplicación Zoom, donde la hora no coincidía con la de mi sistema.

## 1. Verificación Inicial del Sistema

Primero, verifiqué la configuración de fecha, hora y zona horaria de mi sistema operativo con el comando `timedatectl`.

**Comando que ejecuté:**
```bash
timedatectl
```

**Resultado Inicial (Ejemplo):**
```
               Local time: vie 2026-01-30 02:23:00 UTC
           Universal time: vie 2026-01-30 02:23:00 UTC
                 RTC time: vie 2026-01-30 02:23:00
                Time zone: Etc/UTC (UTC, +0000)
System clock synchronized: yes
              NTP service: active
          RTC in local TZ: no
```
Observé que mi zona horaria estaba configurada como `Etc/UTC`.

## 2. Configuración de mi Zona Horaria Correcta

Mi zona horaria local correcta es "Mazatlán". Para configurarla, primero busqué el identificador exacto.

**Comando para buscar la zona horaria:**
```bash
timedatectl list-timezones | grep -i "mazatlan"
```

**Resultado:**
```
America/Mazatlan
```

**Comando para establecer la zona horaria:**
```bash
sudo timedatectl set-timezone America/Mazatlan
```

**Verificación de la nueva configuración:**
```bash
timedatectl
```

**Resultado (Ejemplo):**
```
               Local time: jue 2026-01-29 19:25:41 MST
           Universal time: vie 2026-01-30 02:25:41 UTC
                 RTC time: vie 2026-01-30 02:25:41
                Time zone: America/Mazatlan (MST, -0700)
System clock synchronized: yes
              NTP service: active
          RTC in local TZ: no
```
Con esto, confirmé que había cambiado exitosamente la zona horaria de mi sistema a `America/Mazatlan`.

## 3. Pasos a seguir en la Aplicación Zoom

Una vez que configuré correctamente la zona horaria del sistema, realicé las siguientes acciones para asegurar que Zoom reflejara la hora correcta:

1.  **Reinicié la aplicación Zoom:** La cerré por completo y la volví a abrir. A menudo, esto es suficiente para que las aplicaciones detecten los cambios del sistema.

2.  **Verifiqué la configuración interna de Zoom:**
    *   Abrí Zoom.
    *   Fui a `Configuración`.
    *   Busqué si existía alguna configuración de zona horaria propia de Zoom que pudiera estar ignorando la del sistema.
    *   Me aseguré de que mis calendarios integrados (Google Calendar, etc.) también estuvieran en la zona horaria `America/Mazatlan`.

3.  **Actualicé la aplicación Zoom:** Me aseguré de tener la última versión del cliente de Zoom para evitar bugs conocidos con la gestión de zonas horarias.

Con estos pasos, la discrepancia de horarios en Zoom quedó resuelta.