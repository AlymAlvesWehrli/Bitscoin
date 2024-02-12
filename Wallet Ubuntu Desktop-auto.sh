#!/bin/bash

sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install libxcb-xinerama0 -y

cd $HOME

wget "https://dl.walletbuilders.com/download?customer=99c1e061cfec86b4999b8b935400811b034af24430d19edd80&filename=bitscoin-qt-linux.tar.gz" -O bitscoin-qt-linux.tar.gz

mkdir $HOME/Desktop/Bitscoin

tar -xzvf bitscoin-qt-linux.tar.gz --directory $HOME/Desktop/Bitscoin

mkdir $HOME/.bitscoin

cat << EOF > $HOME/.bitscoin/bitscoin.conf
rpcuser=rpc_bitscoin
rpcpassword=dR2oBQ3K1zYMZQtJFZeAerhWxaJ5Lqeq9J2
rpcbind=127.0.0.1
rpcallowip=127.0.0.1
listen=1
server=1
addnode=node3.walletbuilders.com
EOF

cat << EOF > $HOME/Desktop/Bitscoin/start_wallet.sh
#!/bin/bash
SCRIPT_PATH=\`pwd\`;
cd \$SCRIPT_PATH
./bitscoin-qt
EOF

chmod +x $HOME/Desktop/Bitscoin/start_wallet.sh

cat << EOF > $HOME/Desktop/Bitscoin/mine.sh
#!/bin/bash
SCRIPT_PATH=\`pwd\`;
cd \$SCRIPT_PATH
while :
do
./bitscoin-cli generatetoaddress 1 \$(./bitscoin-cli getnewaddress)
done
EOF

chmod +x $HOME/Desktop/Bitscoin/mine.sh
    
exec $HOME/Desktop/Bitscoin/bitscoin-qt &

sleep 15

exec $HOME/Desktop/Bitscoin/bitscoin-cli -named createwallet wallet_name="" &
    
sleep 15

cd $HOME/Desktop/Bitscoin/

clear

exec $HOME/Desktop/Bitscoin/mine.sh