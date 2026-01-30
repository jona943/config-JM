# Mejora de Calidad de Audio Bluetooth

En esta carpeta guardé el archivo `main.conf` que usé para mejorar la calidad del audio Bluetooth en mi sistema Linux con PipeWire.

## Cambios

Modifiqué el archivo `main.conf` para habilitar los siguientes códecs de alta calidad:
- AAC
- aptX
- aptX HD
- LDAC

También incluí algunos ajustes para mejorar la velocidad y la fiabilidad de la conexión.

## Instalación

Para aplicar estos cambios, copié el archivo `main.conf` a `/etc/bluetooth/` con el comando:

```bash
sudo cp 2026-01-27_bluetooth_audio_fix/main.conf /etc/bluetooth/main.conf
```

Luego, reinicié el servicio de Bluetooth:

```bash
sudo systemctl restart bluetooth.service
```

## Reversión

Para revertir los cambios, simplemente borro el archivo `/etc/bluetooth/main.conf` y reinicio el servicio de Bluetooth. Si tuviera un respaldo de mi configuración anterior, podría restaurarlo.