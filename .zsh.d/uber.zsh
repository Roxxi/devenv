export UBER_HOME=~/Uber
export UBER_LDAP_UID="abahouth"
export PATH="/usr/local/sbin:$PATH"
export UBER_OWNER=abahouth@uber.com
export BOXNAME="abahouth"

[[ -e /usr/local/bin/virtualenvwrapper.sh ]] && source /usr/local/bin/virtualenvwrapper.sh

alias vsql="LANG=en_US.UTF-8 /opt/vertica/bin/vsql"

# https://github.com/kennethreitz/autoenv
# source /usr/local/opt/autoenv/activate.sh


on_all_sjc1() {
    for i in `seq -w 1 32`
    do
        echo "----------START vertica$i-sjc1------------"
        ssh -t abahouth@vertica${i}-sjc1 "$1"
        echo "----------END vertica$i-sjc1------------"
        echo ""
    done
}

source ~/.zsh.d/uber_vsql_no_version_control.sh

alias activate="source ./bin/activate"

if command -v rbenv > /dev/null; then eval "$(rbenv init -)"; fi