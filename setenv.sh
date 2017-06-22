setup()
{
    cd $SCRIPT_PATH
    virtualenv venv

    source venv/bin/activate

    #for dump-msg.py
    brew install sqlcipher

    #for dump-list.py
    pip install pysqlcipher
    pip install PyQuery

    #for dump-html.py
    brew install sox
    pip install Pillow
    pip install requests
    pip install numpy
    pip install pysox

    cd third-party
    ./compile_silk.sh
}

#
# Usage: source ./setenv.sh
#
export SCRIPT_PATH=$(cd $(dirname $BASH_SOURCE); pwd)
export PATH=$SCRIPT_PATH/wechat-dump:$PATH

if [ ! -d "$SCRIPT_PATH/venv" ]; then
    setup
fi

cd $SCRIPT_PATH
source venv/bin/activate
