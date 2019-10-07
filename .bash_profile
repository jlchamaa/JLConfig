function gr(){
    grep -Ir "$1" *
}

function pc(){
   /usr/bin/env python3 -m pytest --cov-report=html:$(pwd)/html_cov --cov=.
}
source ~/.bashrc
export PATH="$HOME/.tfenv/bin:$PATH"
