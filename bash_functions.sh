#!/bin/bash
# ~/.bash_functions — Funciones personales
# Cargado automáticamente desde .bashrc

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

# Ver qué proceso usa un puerto
whois() {
  lsof -i :"$1" 2>/dev/null || netstat -ano | grep :"$1"
}

# Limpiar node_modules y reinstalar
reinstall() {
  rm -rf node_modules package-lock.json && npm install
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
