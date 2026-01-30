# Optimización de Batería que realicé (22 de enero de 2026)

## Propósito

Mi objetivo con esta configuración fue optimizar la duración de la batería de mi portátil, que tiene Ubuntu Server y un entorno de escritorio XFCE.

## Archivos

- **`2026-01-22_Optimizacion_Bateria.txt`**: Un resumen conciso de los pasos finales que realicé.
- **`2026-01-22_Interaccion_Completa.txt`**: Un registro detallado de toda la conversación, incluyendo mi análisis con `powertop`, la transición a `TLP` y la investigación sobre la frecuencia de la CPU.

## Resumen de las Acciones que Tomé

1.  **Análisis Inicial con `powertop`**: Primero, instalé y configuré `powertop` para analizar el consumo de energía y aplicar optimizaciones iniciales. Incluso creé un servicio para automatizarlo.

2.  **Transición a `TLP`**: Después de investigar, determiné que `TLP` era una herramienta más avanzada y de tipo "instalar y olvidar", lo que me pareció ideal para una gestión automática y más agresiva del ahorro de energía.

3.  **Instalación y Configuración de `TLP`**:
    - Deshabilité y eliminé el servicio de `powertop` para evitar conflictos.
    - Instalé `TLP` y su extensión para dispositivos de radio (`tlp-rdw`) con el comando:
      ```bash
      sudo apt install -y tlp tlp-rdw
      ```
    - Activé el servicio de `TLP` para que se inicie automáticamente con el sistema.

## Configuración Final

Ahora, **tengo TLP activo y gestionando el ahorro de energía de forma automática.** No necesito realizar ninguna acción adicional. La configuración por defecto de TLP me parece adecuada, ya que desactiva el "Turbo Boost" de la CPU cuando uso la batería y lo activa con la corriente, equilibrando rendimiento y autonomía.

## Instrucciones para Revertir mis Cambios (Rollback)

Si quisiera desactivar TLP y detener la gestión de energía, ejecutaría los siguientes comandos:

```bash
# Para detener el servicio de TLP inmediatamente
sudo systemctl stop tlp.service

# Para deshabilitar el servicio y que no inicie en el arranque
sudo systemctl disable tlp.service
```

Si quisiera desinstalar completamente TLP:
```bash
sudo apt remove --purge -y tlp tlp-rdw
```