#!/bin/bash
# ~/.bash_aliases — Aliases personales
# Cargado automáticamente desde .bashrc

# ── Navegación ────────────────────────────────────────────────────────────────
alias ..='cd ..'
alias cl='clear'
alias list='ls -1 | nl'

# ── Git ───────────────────────────────────────────────────────────────────────
alias +='git add .'
alias gcd='git checkout develop'
alias gd='git diff'
alias gpd='git pull origin develop'
alias graph='git log --all --decorate --oneline --graph'
alias gs='git status -s'
alias last='git log -1 --oneline'
alias new='git checkout -b'
alias push='git push origin '
alias push-current='git push -u origin HEAD'
alias resetC='git reset --soft HEAD~1'
alias unstage='git reset HEAD --'

# ── Node / npm ────────────────────────────────────────────────────────────────
alias runM='start bash -c "npm run dev"'
alias runS='start bash -c "npm run start:local"'
alias run-t='npm run test:sonar'
alias toolKill='ps aux | grep "[n]ode" | awk '\''{print $1}'\'' && kill $(ps aux | grep "[n]ode" | awk '\''{print $1}'\'')'

# ── ZTA ───────────────────────────────────────────────────────────────────────
alias ztaDev='printf "\e[32m \n<..........OPEN.....ZTA.......>\e[0m\n" && cd ~/Documents/ZTA && code .'
alias ztaRun='printf "\e[32m \n<..........RUN.....ZTA.......>\e[0m\n" && ./mf-tool.sh run'

# ── MongoDB ───────────────────────────────────────────────────────────────────
alias runMongo="cd /c/Program\ FILES/MongoDB/Server/8.2/bin && ./mongod.exe --dbpath /c/data/db/"
alias runMongosh="cd /c/Program\ FILES/MongoDB/mongosh && ./mongosh.exe --port 27017"
alias cdMongo="cd /c/Program\ FILES/MongoDB/Server/8.2/bin"

# ── Mantenimiento del shell ───────────────────────────────────────────────────
alias reload='source ~/.bashrc'
alias edita='code ~/.bash_aliases'
alias editf='code ~/.bash_functions'
alias editrc='code ~/.bashrc'
