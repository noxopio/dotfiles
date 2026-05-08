#!/bin/bash
# ~/.bash_functions — Funciones personales
# Cargado automáticamente desde .bashrc

# ── Git ───────────────────────────────────────────────────────────────────────

# Commit con mensaje capitalizado y prefijo feat:
commit() {
    local message
    message=$(echo "$1" | sed -E 's/^(.)/\U\1/')
    git commit -am "feat: $message"
}

# Crear rama con prefijo: gbranch fix my-bug → fix/my-bug
gbranch() {
    git checkout -b "$1/$2"
}

# Ver qué archivos cambiaron en el último commit
changed() {
    git diff --name-only HEAD~1 HEAD
}

# Deshacer cambios de un archivo específico
restore() {
    git checkout -- "$1"
}

# ── Node / npm ────────────────────────────────────────────────────────────────

# Ejecutar tests filtrando por ruta
testPath() {
    npm test -- --silent --coverage --testPathPattern="$1"
}

# Ejecutar todos los tests en silencio con cobertura
silent() {
    npx jest --silent --coverage
}

# Matar un puerto específico
killM() {
    npx kill-port "$1"
}

# Limpiar node_modules y reinstalar
reinstall() {
    rm -rf node_modules package-lock.json && npm install
}

# ── Sistema ───────────────────────────────────────────────────────────────────

# Ver qué proceso usa un puerto
whois() {
    lsof -i :"$1" 2>/dev/null || netstat -ano | grep :"$1"
}

# Crear carpeta y entrar en ella
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Buscar texto en archivos del directorio actual
# Uso: find-in "texto" [extensión]  → find-in "TODO" ts
find-in() {
    grep -r "$1" . --include="*.${2:-*}" --color=auto
}

# Ver variables de entorno filtradas
envgrep() {
    env | grep -i "$1"
}


# ── SSH ───────────────────────────────────────────────────────────────────────

# Inicializa el agente SSH si no está activo
Dassh() {
    if [ -z "$SSH_AUTH_SOCK" ]; then
        eval "$(ssh-agent -s)"
        ssh-add ~/.ssh/id_rsa_perfil1
        ssh-add ~/.ssh/id_rsa_perfil2
    fi
}
#extraer Urls unicas 
#cat repos.json | urls_unicas
#curl https://api.ejemplo.com/repos | urls_unicas salida.txt
clean_urls() {
  jq -r '.[].weburl' \
  | sed 's/%20/ /g' \
  | tr '[:upper:]' '[:lower:]' \
  | sort -u \
  > "${1:-urls_unicas.txt}"
}
