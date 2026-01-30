# Mi Solución al Robo de Foco en XFCE (Zoom)

## Propósito
En este documento detallo la solución que implementé para resolver el problema de que aplicaciones, notablemente Zoom, me robaran el foco de la ventana activa en mi entorno de escritorio XFCE.

## Archivos
No añadí archivos de configuración. La modificación la realicé directamente sobre la configuración de mi gestor de ventanas de XFCE (XFWM) a través de un comando.

## Instrucciones de Aplicación que Seguí
Para activar la prevención de robo de foco y evitar que las ventanas tomen el control sin mi permiso, ejecuté el siguiente comando in la terminal. Este cambio es persistente entre reinicios.

```bash
xfconf-query -c xfwm4 -p /general/prevent_focus_stealing -s true
```

## Instrucciones para Revertir el Cambio
Para desactivar la prevención de robo de foco y volver al estado anterior, podría ejecutar el siguiente comando:

```bash
xfconf-query -c xfwm4 -p /general/prevent_focus_stealing -s false
```

## Contexto Adicional
El problema me persistía incluso después de haber desactivado el demonio de notificaciones de XFCE (`xfce4-notifyd`), lo que me indicó que el robo de foco no era causado por una notificación emergente, sino por el comportamiento de la propia ventana de la aplicación.

Mi investigación de la configuración del gestor de ventanas `xfwm4` me reveló la existencia de la propiedad `/general/prevent_focus_stealing`, la cual se encontraba desactivada (`false`). Al activarla, le indiqué al gestor de ventanas que impidiera activamente que las aplicaciones se pongan en primer plano por sí mismas, solucionando así la interrupción.