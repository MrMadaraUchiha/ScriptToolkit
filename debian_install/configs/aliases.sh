function dcmd(){
    CONTAINER="${PWD##*/}_app_1"
    docker exec -it -u 1000 -w /var/www/html/ $CONTAINER $@
}

function dartisan(){
    dcmd php artisan $@
}

function dcomposer(){
    dcmd composer $@
}
function dbconnect(){
        CONTAINER=$1
        shift
        docker exec -it $CONTAINER /bin/bash -c "exec mysql -u root -p\"\${MARIADB_ROOT_PASSWORD}\" $@"

}
function aatach(){
    while true; do
        docker attach $1
        echo "Pressione qualquer tecla para parar a execução..."
        read -s -r -n 1 -t 3
        if [ $? = 0 ]; then
            echo "Saindo"
            break
        fi
        docker restart $1
    done
}

# Reboot into windows without the need to select in the grub gui
function xexelento {
    WINDOWS_TITLE=`grep -i "^menuentry 'Windows" /boot/grub/grub.cfg|head -n 1|cut -d"'" -f2`
    sudo grub-reboot "$WINDOWS_TITLE"
    sudo reboot
}

#Bind para baixar audio do youtube
alias youtube-audio-dl='youtube-dl -x --audio-format mp3'
alias idea="intellij-idea-ultimate"
alias k="kubectl"
complete -F __start_kubectl k

alias d="docker"
_completion_loader docker
complete -F _docker d

alias dc="docker-compose"
alias m="mvn"
alias mci="mvn clean install"
alias mcp="mvn clean package"

# Create alias only if codium is installed
if [ -x "$(command -v codium)" ]; then
    alias code="codium"
fi
