#!/bin/bash
#
# SCRIPT DE INSTALACIÓN INTERACTIVO
#
# Este script automatiza la aplicación de las configuraciones documentadas
# en este repositorio.
#
# ADVERTENCIA:
# 1. El script ejecuta comandos extraídos de los archivos README.md.
#    Muchos de estos comandos requieren permisos de `sudo`.
# 2. Se ha diseñado para ser seguro, pidiendo confirmación antes de actuar,
#    pero es crucial que revises los comandos que vas a autorizar.
# 3. Úsalo bajo tu propia responsabilidad. No soy responsable de ningún
#    problema que pueda surgir.

set -e

# --- COLORES PARA LA SALIDA ---
COLOR_GREEN='\033[0;32m'
COLOR_YELLOW='\033[1;33m'
COLOR_BLUE='\033[0;34m'
COLOR_RED='\033[0;31m'
COLOR_RESET='\033[0m'

# --- FUNCIÓN PARA EXTRAER Y EJECUTAR LA SOLUCIÓN ---
# Argumento 1: Ruta del directorio de la configuración.
apply_solution() {
    local config_dir=$1
    local readme_path="$config_dir/README.md"
    
    if [ ! -f "$readme_path" ]; then
        echo -e "${COLOR_RED}ERROR: No se encontró README.md en '$config_dir'. Saltando.${COLOR_RESET}"
        return
    fi

    echo -e "\n${COLOR_BLUE}--- Procesando: $(basename "$config_dir") ---${COLOR_RESET}"

    # Extrae el contenido de la sección "Solución que Apliqué".
    # - Inicia la captura en '## Solución que Apliqué'.
    # - Termina la captura en la siguiente línea que empiece con '## '.
    local solution_block
    solution_block=$(awk '/^## Solución que Apliqué/{f=1;next} /^##/{f=0} f' "$readme_path")

    if [ -z "$solution_block" ]; then
        echo -e "${COLOR_YELLOW}ADVERTENCIA: No se encontró la sección '## Solución que Apliqué' en '$readme_path'. Saltando.${COLOR_RESET}"
        return
    fi

    # Extrae solo los comandos dentro de los bloques ```bash
    local commands
    commands=$(echo "$solution_block" | sed -n '/```bash/,/```/p' | sed '1d;$d')

    # Busca operaciones de copia/movimiento de archivos de configuración locales
    local config_files
    config_files=$(find "$config_dir" -maxdepth 1 -type f ! -name 'README.md' ! -name 'contexto*.txt')

    if [ -n "$config_files" ]; then
        echo -e "Se encontraron los siguientes archivos de configuración:"
        for f in $config_files;
 do
            echo -e "  - $(basename "$f")"
        done
        echo -e "Las instrucciones para moverlos/copiarlos deberían estar en los comandos."
    fi

    if [ -z "$commands" ]; then
        echo -e "${COLOR_YELLOW}ADVERTENCIA: No se encontraron comandos ```bash en la sección de solución. Saltando.${COLOR_RESET}"
        return
    fi

    echo -e "\n${COLOR_YELLOW}Los siguientes comandos se ejecutarán desde el directorio '$config_dir':${COLOR_RESET}"
    echo -e "--------------------------------------------------"
    echo -e "${COLOR_GREEN}$commands${COLOR_RESET}"
    echo -e "--------------------------------------------------"

    read -p "¿Quieres aplicar esta solución? (s/N): " choice
    if [[ "$choice" =~ ^[Ss]$ ]]; then
        echo -e "${COLOR_BLUE}Aplicando solución...${COLOR_RESET}"
        (cd "$config_dir" && eval "$commands")
        echo -e "${COLOR_GREEN}Solución aplicada con éxito.${COLOR_RESET}"
    else
        echo -e "${COLOR_RED}Solución omitida.${COLOR_RESET}"
    fi
}

# --- FUNCIÓN PRINCIPAL ---
main() {
    echo -e "${COLOR_YELLOW}Bienvenido al instalador de configuraciones.${COLOR_RESET}"
    echo -e "${COLOR_RED}ADVERTENCIA: Este script ejecutará comandos con sudo. Úsalo con precaución.${COLOR_RESET}"
    
    # Busca todos los directorios que sigan el patrón de fecha.
    local configs
    mapfile -t configs < <(find . -maxdepth 1 -type d -name '20*' | sort)

    if [ ${#configs[@]} -eq 0 ]; then
        echo -e "${COLOR_RED}No se encontraron directorios de configuración (ej: 2026-01-01_mi-config).${COLOR_RESET}"
        exit 1
    fi

    echo -e "\n${COLOR_BLUE}He encontrado las siguientes configuraciones:${COLOR_RESET}"
    PS3=$'\n''Tu opción (o \'q\' para salir): '
    select config_choice in "${configs[@]##*/}" "APLICAR_TODAS"; do
        case "$config_choice" in
            "" ) 
                echo -e "${COLOR_RED}Opción inválida. Inténtalo de nuevo.${COLOR_RESET}"
                ;;
            "APLICAR_TODAS" ) 
                read -p "Estás seguro de que quieres intentar aplicar TODAS las configuraciones? (s/N): " all_choice
                if [[ "$all_choice" =~ ^[Ss]$ ]]; then
                    for d in "${configs[@]}"; do
                        apply_solution "$d"
                    done
                else
                    echo -e "${COLOR_RED}Operación cancelada.${COLOR_RESET}"
                fi
                break
                ;;
            * ) 
                if [[ -n "$config_choice" ]]; then
                    apply_solution "./$config_choice"
                fi
                break
                ;;
        esac
    done

    echo -e "\n${COLOR_GREEN}Proceso finalizado. Es posible que necesites reiniciar el sistema para que algunos cambios surtan efecto.${COLOR_RESET}"
}

main
