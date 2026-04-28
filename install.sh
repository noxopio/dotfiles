#!/bin/bash
# install.sh — Instalador de aliases y funciones personales de bash
# Versión: 1.0.0
#
# Uso:
#   ./install.sh            Instalación normal
#   ./install.sh --force    Sobreescribe archivos existentes
#   ./install.sh --help     Muestra esta ayuda
#
# Qué hace:
#   1. Copia bash_aliases.sh  → ~/.bash_aliases
#   2. Copia bash_functions.sh → ~/.bash_functions
#   3. Agrega líneas source en ~/.bashrc SOLO si no existen
#   4. Nunca sobreescribe ni elimina contenido existente de .bashrc

set -e

# ── Colores ───────────────────────────────────────────────────────────────────
GREEN="\e[1;32m"
YELLOW="\e[1;33m"
CYAN="\e[1;36m"
RED="\e[1;31m"
RESET="\e[0m"

# ── Rutas ─────────────────────────────────────────────────────────────────────
SOURCE_DIR="$(cd "$(dirname "$0")" && pwd)"
BASHRC="$HOME/.bashrc"
ALIASES_DEST="$HOME/.bash_aliases"
FUNCTIONS_DEST="$HOME/.bash_functions"
FORCE=false

# ── Helpers ───────────────────────────────────────────────────────────────────
info()    { echo -e "${CYAN}[INFO]${RESET}    $1"; }
success() { echo -e "${GREEN}[OK]${RESET}      $1"; }
warning() { echo -e "${YELLOW}[SKIP]${RESET}    $1"; }
error()   { echo -e "${RED}[ERROR]${RESET}   $1"; exit 1; }

show_help() {
    echo -e "\n${CYAN}source_bash installer${RESET}"
    echo "  Instala aliases y funciones personales de bash."
    echo ""
    echo "  Uso: ./install.sh [--force] [--help]"
    echo ""
    echo "  --force   Sobreescribe ~/.bash_aliases y ~/.bash_functions"
    echo "  --help    Muestra esta ayuda"
    echo ""
    exit 0
}

# ── Argumentos ────────────────────────────────────────────────────────────────
for arg in "$@"; do
    case "$arg" in
        --force) FORCE=true ;;
        --help|-h) show_help ;;
        *) error "Opción desconocida: $arg" ;;
    esac
done

# ── Verificar archivos fuente ─────────────────────────────────────────────────
[ -f "$SOURCE_DIR/bash_aliases.sh" ]   || error "No se encontró bash_aliases.sh en $SOURCE_DIR"
[ -f "$SOURCE_DIR/bash_functions.sh" ] || error "No se encontró bash_functions.sh en $SOURCE_DIR"

# ── Copiar aliases ────────────────────────────────────────────────────────────
install_file() {
    local src="$1"
    local dest="$2"
    local label="$3"

    # Archivo no existe → copiar directamente
    if [ ! -f "$dest" ]; then
        cp "$src" "$dest"
        chmod 644 "$dest"
        success "$label instalado en $dest"
        return
    fi

    # --force → sobreescribir completamente
    if [ "$FORCE" = true ]; then
        cp "$src" "$dest"
        chmod 644 "$dest"
        success "$label sobreescrito en $dest"
        return
    fi

    # Archivo existe → agregar al final solo las líneas nuevas
    local added=0
    local new_lines=""

    while IFS= read -r line; do
        # Ignorar shebang, líneas vacías y comentarios de cabecera del archivo
        [[ -z "$line" || "$line" == "#!/"* ]] && continue
        # Solo procesar alias y definiciones de funciones
        [[ "$line" != alias* && "$line" != *"()"* ]] && continue
        # Extraer el nombre del alias o función para comparar
        local key
        key=$(echo "$line" | sed -E 's/^alias ([^=]+)=.*/\1/; s/^([a-zA-Z_][a-zA-Z0-9_]*)\(\).*/\1/')
        # Agregar solo si el nombre no existe ya en el destino
        if ! grep -qE "(alias $key=|^$key\(\))" "$dest"; then
            new_lines="$new_lines\n$line"
            added=$((added + 1))
        fi
    done < "$src"

    if [ "$added" -gt 0 ]; then
        printf "\n# Agregado por source_bash — %s\n" "$(date +%Y-%m-%d)" >> "$dest"
        printf "%b\n" "$new_lines" >> "$dest"
        success "$added entrada(s) nueva(s) agregada(s) al final de $dest"
    else
        warning "$label ya está al día, no hay entradas nuevas"
    fi
}

info "Instalando aliases y funciones..."
install_file "$SOURCE_DIR/bash_aliases.sh"   "$ALIASES_DEST"   ".bash_aliases"
install_file "$SOURCE_DIR/bash_functions.sh" "$FUNCTIONS_DEST" ".bash_functions"

# ── Agregar sources a .bashrc (solo si no existen) ────────────────────────────
append_source_if_missing() {
    local file="$1"
    local line="[ -f \"$file\" ] && source \"$file\""

    if grep -qF "$file" "$BASHRC" 2>/dev/null; then
        warning "Ya existe referencia a $file en $BASHRC"
    else
        echo "" >> "$BASHRC"
        echo "# source_bash" >> "$BASHRC"
        echo "$line" >> "$BASHRC"
        success "Agregado source de $file en $BASHRC"
    fi
}

info "Verificando $BASHRC..."
append_source_if_missing "$ALIASES_DEST"
append_source_if_missing "$FUNCTIONS_DEST"

# ── Listo ─────────────────────────────────────────────────────────────────────
echo ""
success "Instalación completa."
echo -e "  Recarga la terminal con: ${CYAN}source ~/.bashrc${RESET}"
echo ""
