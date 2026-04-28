# dotfiles

Aliases y funciones personales de bash. Instala `~/.bash_aliases` y `~/.bash_functions`, y agrega los `source` en `~/.bashrc` automáticamente.

## Instalación

```bash
git clone https://github.com/noxopio/dotfiles.git && cd dotfiles && ./install.sh
```

## Opciones

| Flag | Descripción |
|------|-------------|
| _(ninguno)_ | Instala sin sobreescribir archivos existentes; agrega solo entradas nuevas |
| `--force` | Sobreescribe `~/.bash_aliases` y `~/.bash_functions` completamente |
| `--help` | Muestra la ayuda |

## Qué instala

### Aliases (`~/.bash_aliases`)

**Navegación**

| Alias | Comando |
|-------|---------|
| `..` | `cd ..` |
| `cl` | `clear` |
| `list` | `ls -1 \| nl` |

**Git**

| Alias | Comando |
|-------|---------|
| `+` | `git add .` |
| `gs` | `git status -s` |
| `gd` | `git diff` |
| `graph` | log visual con ramas |
| `last` | último commit en una línea |
| `new` | `git checkout -b` |
| `push` | `git push origin` |
| `push-current` | `git push -u origin HEAD` |
| `resetC` | `git reset --soft HEAD~1` |
| `unstage` | `git reset HEAD --` |
| `gcd` | `git checkout develop` |
| `gpd` | `git pull origin develop` |

**Node / npm**

| Alias | Comando |
|-------|---------|
| `runM` | `npm run dev` (nueva ventana) |
| `runS` | `npm run start:local` (nueva ventana) |
| `run-t` | `npm run test:sonar` |
| `toolKill` | mata todos los procesos node |

**MongoDB**

| Alias | Comando |
|-------|---------|
| `runMongo` | arranca `mongod` con dbpath `/c/data/db/` |
| `runMongosh` | abre `mongosh` en puerto 27017 |
| `cdMongo` | navega al bin de MongoDB |

**Gestión del shell**

| Alias | Acción |
|-------|--------|
| `reload` | recarga `~/.bashrc` |
| `edita` | abre `~/.bash_aliases` en VS Code |
| `editf` | abre `~/.bash_functions` en VS Code |
| `editrc` | abre `~/.bashrc` en VS Code |

---

### Funciones (`~/.bash_functions`)

| Función | Uso | Descripción |
|---------|-----|-------------|
| `commit "mensaje"` | `commit "fix bug"` | commit de todos los cambios con prefijo `feat:` |
| `gbranch tipo nombre` | `gbranch fix my-bug` | crea rama `tipo/nombre` |
| `changed` | `changed` | archivos modificados en el último commit |
| `restore archivo` | `restore src/app.ts` | deshace cambios de un archivo |
| `testPath ruta` | `testPath auth` | tests filtrando por ruta |
| `silent` | `silent` | todos los tests con cobertura en silencio |
| `killM puerto` | `killM 3000` | mata un puerto específico |
| `whois puerto` | `whois 8080` | proceso que usa un puerto |
| `reinstall` | `reinstall` | borra `node_modules` y reinstala |
| `mkcd carpeta` | `mkcd src/utils` | crea carpeta y entra en ella |
| `find-in "texto" ext` | `find-in "TODO" ts` | busca texto en archivos del directorio |

---

Después de instalar, recarga la terminal:

```bash
source ~/.bashrc
```

O usa el alias instalado:

```bash
reload
```