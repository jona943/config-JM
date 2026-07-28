# <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/linux/linux-original.svg" width="35" height="35" valign="middle" /> hp-db0xxx — System Configuration & Technical Logs

[![OS - Ubuntu Server %2F XFCE](https://img.shields.io/badge/OS-Ubuntu%20Server%20%2F%20XFCE-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)](https://ubuntu.com/)
[![CPU - AMD A9--9425](https://img.shields.io/badge/CPU-AMD%20A9--9425-ED1C24?style=for-the-badge&logo=amd&logoColor=white)](https://www.amd.com/)
[![Hardware - HP db0xxx](https://img.shields.io/badge/Hardware-HP%20db0xxx-0096D6?style=for-the-badge&logo=hp&logoColor=white)](https://www.hp.com/)
[![Shell - Bash](https://img.shields.io/badge/Shell-Bash-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white)](https://www.gnu.org/software/bash/)

Bienvenido al repositorio central de **configuración, optimizaciones de hardware y bitácora técnica personal** para la laptop **HP Laptop 15-db0xxx** ejecutando **Ubuntu Server con entorno gráfico ligero (XFCE)**.

---

## <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/debian/debian-original.svg" width="22" height="22" valign="middle" /> Propósito del Repositorio

Este espacio sirve como **registro técnico auditable y base de conocimiento** orientada a:

* **Documentar soluciones específicas de hardware y controladores** (Wi-Fi Realtek RTL8723DE, códecs y calidad de audio Bluetooth, periféricos Apple).
* **Optimizar el consumo de batería y recursos** en un equipo con procesador AMD A9 y 12 GB de RAM.
* **Estandarizar procedimientos técnicos** siguiendo el [Estándar de Documentación v3.1](./instrucciones_de_documentacion.txt).
* **Mantener scripts de automatización** para la reinstalación o despliegue rápido de configuraciones esenciales (`installer.sh`).

---

## <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/linux/linux-original.svg" width="22" height="22" valign="middle" /> Especificaciones del Sistema

| Componente | Detalle Técnico | Insignia |
| :--- | :--- | :--- |
| **Modelo** | HP Laptop 15-db0xxx | ![](https://img.shields.io/badge/HP-db0xxx-0096D6?style=flat-square&logo=hp&logoColor=white) |
| **Procesador (CPU)** | AMD A9-9425 Dual-Core (3.1 GHz - 3.7 GHz Turbo) | ![](https://img.shields.io/badge/CPU-AMD_A9--9425-ED1C24?style=flat-square&logo=amd&logoColor=white) |
| **Memoria RAM** | 12 GB DDR4 | ![](https://img.shields.io/badge/RAM-12GB_DDR4-000000?style=flat-square&logo=ram&logoColor=white) |
| **Sistema Operativo** | Ubuntu Server | ![](https://img.shields.io/badge/OS-Ubuntu_Server-E95420?style=flat-square&logo=ubuntu&logoColor=white) |
| **Entorno de Escritorio** | XFCE (Mínimo / Optimizado) | ![](https://img.shields.io/badge/Desktop-XFCE-2284F5?style=flat-square&logo=xfce&logoColor=white) |
| **Documentación** | Estándar de Documentación v3.1 | ![](https://img.shields.io/badge/Std-Doc_v3.1-0052CC?style=flat-square&logo=markdown&logoColor=white) |

---

## <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/markdown/markdown-original.svg" width="22" height="22" valign="middle" /> Estructura y Categorías de la Bitácora

El repositorio está organizado por **categorías de componentes** para facilitar su consulta:

| Categoría | Ruta de Acceso | Contenido y Soluciones |
| :---: | :--- | :--- |
| ![](https://img.shields.io/badge/-Redes_y_Conectividad-0052CC?style=flat-square&logo=wi-fi&logoColor=white) | [**redes_y_conectividad/**](./redes_y_conectividad/) | Drivers `RTL8723DE` (`rtw88`), correcciones de audio Bluetooth (códecs y sin sonido) y fallos de inicio de red. |
| ![](https://img.shields.io/badge/-Sistema_y_Rendimiento-E95420?style=flat-square&logo=speedtest&logoColor=white) | [**sistema_y_rendimiento/**](./sistema_y_rendimiento/) | Optimización de batería y energía, configuración regional de idioma, notas de kernel y Fastfetch. |
| ![](https://img.shields.io/badge/-Periféricos_y_Gestos-2284F5?style=flat-square&logo=bluetooth&logoColor=white) | [**perifericos_y_gestos/**](./perifericos_y_gestos/) | Conexión e integración del ratón Apple Magic Mouse A1296, gestos touchpad (3-finger swipe) y fijado USB Android. |
| ![](https://img.shields.io/badge/-Aplicaciones_y_Escritorio-092E20?style=flat-square&logo=xfce&logoColor=white) | [**aplicaciones_y_escritorio/**](./aplicaciones_y_escritorio/) | Instalador de Arduino IDE, ajustes de notificaciones XFCE, soporte de video Shotwell y parches para Zoom. |

---

## <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/bash/bash-original.svg" width="22" height="22" valign="middle" /> Archivos Principales de Configuración

* [**INFO_SISTEMA.md**](./INFO_SISTEMA.md): Especificaciones detalladas del hardware y limitaciones del equipo.
* [**installer.sh**](./installer.sh): Script ejecutable para aplicar optimizaciones automáticas.
* [**instrucciones_de_documentacion.txt**](./instrucciones_de_documentacion.txt): Guía oficial del Estándar de Documentación v3.1.

---

<p align="center">
  <sub>Bitácora de configuración y optimización técnica para Ubuntu 🐧</sub>
</p>
