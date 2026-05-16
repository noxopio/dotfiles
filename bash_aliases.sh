#!/bin/bash
# ~/.bash_aliases — Aliases personales
# Cargado automáticamente desde .bashrc

# ── Navegación ────────────────────────────────────────────────────────────────
alias .='cd '
alias ..='cd ..'
alias ...='cd ../..'

# ── Terminal ──────────────────────────────────────────────────────────────────
alias cl='clear'
alias list='ls -1 | nl'
alias ll='ls -l'
alias ls='ls -F --color=auto --show-control-chars'

# ── Git ───────────────────────────────────────────────────────────────────────
alias +='git add .'
alias branch='git branch'
alias gcd='git checkout develop'
alias gd='git diff'
alias gitrt='git restore .'
alias gl='git log'
alias gpd='git pull origin develop'
alias graph='git log --all --decorate --oneline --graph'
alias gs='git status -s'
alias last='git log -1 --oneline'
alias new='git checkout -b'
alias push-current='git push -u origin HEAD'
alias push='git push origin'
alias resetC='git reset --soft HEAD~1'
alias unstage='git reset HEAD --'

# ── Node / npm ────────────────────────────────────────────────────────────────
alias jrc='npm run test:coverage'
alias nle='npm i --legacy-peer-deps'
alias node='winpty node.exe'
alias package='ng build && npm run package'
alias ps-node='ps aux | grep "[n]ode"'
alias run-t='npm run test:sonar'
alias runM='start bash -c "npm run dev"'
alias runS='start bash -c "npm run start:local"'
alias testRrun='ng test --code-coverage'
alias toolKill='ps aux | grep "[n]ode" | awk '\''{print $1}'\'' && kill $(ps aux | grep "[n]ode" | awk '\''{print $1}'\'')'

# ── Python ────────────────────────────────────────────────────────────────────
alias activated='source venv/Scripts/activate'
alias killapp="pkill -f 'python -m app.main'"
alias json='jq .'
alias py='python3'

# ── ZTA ───────────────────────────────────────────────────────────────────────
alias ztaDev='printf "\e[32m \n<..........OPEN.....ZTA.......>\e[0m\n" && cd ~/Documents/ZTA && code .'
alias ztaRun='printf "\e[32m \n<..........RUN.....ZTA.......>\e[0m\n" && ./mf-tool.sh run'

# ── MongoDB ───────────────────────────────────────────────────────────────────
alias runMongo="cd /c/Program\ FILES/MongoDB/Server/8.2/bin && ./mongod.exe --dbpath /c/data/db/"
alias runMongosh="cd /c/Program\ FILES/MongoDB/mongosh && ./mongosh.exe --port 27017"
alias cdMongo="cd /c/Program\ FILES/MongoDB/Server/8.2/bin"

# ── Compresión ────────────────────────────────────────────────────────────────
alias comprimir='tar -czvf'
alias descomprimir='tar -xzvf'

# ── Proyectos ─────────────────────────────────────────────────────────────────
alias dev='cd dev/dev && code .'
alias portal='cd dev/dev && code . && ./microfronts.sh run'
alias portals='./microfronts.sh'

# ── Windows ───────────────────────────────────────────────────────────────────
alias winget='winpty winget.exe'

# ── Mantenimiento del shell ───────────────────────────────────────────────────
alias reload='source ~/.bashrc'
alias edita='code ~/.bash_aliases'
alias editf='code ~/.bash_functions'
alias editrc='code ~/.bashrc'
# ── Abrir navegador modo incognito ───────────────────────────────────────────────────
alias navI='printf "\e[32m \n<.............INCOGNITO............>\e[0m\n" && start chrome --incognito "http://localhost:5174/"'
#abrir el navegador 
alias Dll='printf "\e[32m \n<.............SURA.......DLL........>\e[0m\n" && start chrome --incognito  "https://rooms.agencia.ia.dllosura.com/"'
alias suraL='printf "\e[32m \n<.............SURA.......LOCAL......>\e[0m\n" && start chrome --incognito "http://localhost:5174/"'

alias runSura='printf "\e[32m\n<..........RUN.....SURA.......>\e[0m\n" \
&& cd ~/MCP_SURA/SURA_FRONTEND_DEV/1250-orqintegrac_agiamg_fe_spa-fr \
&& start bash -c "npm run dev" \
&& start chrome --incognito "http://localhost:5174/"'

