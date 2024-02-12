# Bitscoin
BTCS
a decentralized currency
https://www.bitscoin.site/

Wallet Ubunto desktop: Open a Terminal window.
Make the install file executable with the following command:
 chmod +x $HOME/Downloads/bitscoin-auto.sh              
Open Files and go to your Downloads directory.
Select the file bitscoin-auto.sh, press the right button of your mouse and click on "Run as a Program" to automatically install your wallet and mine your first block.
Enter your Ubuntu user password when requested.

TUTORIAL - Install a mining pool on Ubuntu Server 22.04
Install a mining pool on Ubuntu Server 22.04 with the following tutorial.

Update your Ubuntu server with the following command:

sudo apt-get update && sudo apt-get upgrade -y

Install the dependencies with the following command:

sudo apt-get install unzip redis-server npm git nano cmake screen -y

Download the Linux daemon for your wallet with the following command:

wget "https://dl.walletbuilders.com/download?customer=99c1e061cfec86b4999b8b935400811b034af24430d19edd80&filename=bitscoin-daemon-linux.tar.gz" -O bitscoin-daemon-linux.tar.gz

Extract the tar file with the following command:

tar -xzvf bitscoin-daemon-linux.tar.gz

Download the Linux tools for your wallet with the following command:

wget "https://dl.walletbuilders.com/download?customer=99c1e061cfec86b4999b8b935400811b034af24430d19edd80&filename=bitscoin-qt-linux.tar.gz" -O bitscoin-qt-linux.tar.gz

Extract the tar file with the following command:

tar -xzvf bitscoin-qt-linux.tar.gz

Type the following command to install the daemon and tools for your wallet:

sudo mv bitscoind bitscoin-cli bitscoin-tx /usr/bin/

Type the following command to open your home directory:

cd $HOME

Create the data directory for your coin with the following command:

mkdir $HOME/.bitscoin

Open nano.

nano $HOME/.bitscoin/bitscoin.conf -t

Paste the following into nano.

rpcuser=rpc_bitscoin
rpcpassword=dR2oBQ3K1zYMZQtJFZeAerhWxaJ5Lqeq9J2
rpcbind=127.0.0.1
rpcallowip=127.0.0.1
listen=1
server=1
txindex=1
daemon=1
paytxfee=0.0002
deprecatedrpc=accounts
addresstype=legacy
addnode=node3.walletbuilders.com

Save the file with the keyboard shortcut ctrl + x.

Type the following command to start your daemon:

bitscoind

Type the following command to create a wallet for your daemon:

bitscoin-cli createwallet ""

Type the following command to create a new receiving address for your daemon:

bitscoin-cli getnewaddress ""

Example output.

4UyrFQrAoNQMEMqNhZTareRmjeU68bLiop

Type the following commands to install NOMP:

git clone https://github.com/walletbuilders/node-open-mining-portal.git nomp
cd nomp
npm update

Type the following command to create the file settings.json:

cp config_example.json config.json

Open nano.

nano config.json -t

Modify the following values in the file config.json.

host - Change the value “0.0.0.0” with the IPv4 address of your server.

stratumHost - Change the value “cryppit.com” with the IPv4 address of your server.

Save the file with the keyboard shortcut ctrl + x.

Type the following commands to create the config file for your coin:

cd coins
cp bitcoin.json bitscoin.json

Open nano.

nano bitscoin.json -t

Modify the following values in the file bitscoin.json.

name - “Bitcoin” -> “Bitscoin”.

symbol - “BTC” -> “BTCS”.

Save the file with the keyboard shortcut ctrl + x.

Type the following commands to create the config file for your pool:

cd ../pool_configs
cp litecoin_example.json bitscoin_pool.json

Open nano.

nano bitscoin_pool.json -t

Modify the following values in the file bitscoin.json.

enabled - “false” -> “true”.

coin - “litecoin.json” -> “bitscoin.json”.

address - “n4jSe18kZMCdGcZqaYprShXW6EH1wivUK1” -> Enter the receiving address from the RPC command “getaccountaddress ""”.

rewardRecipients - Remove all recipients.

minimumPayment - “70” -> “0.01”.

"paymentProcessing" -> port - “19332” -> “15893”.

"paymentProcessing" -> user - “testuser” -> “rpc_bitscoin”.

"paymentProcessing" -> password - “testpass” -> “dR2oBQ3K1zYMZQtJFZeAerhWxaJ5Lqeq9J2”.

"daemons" -> port - “19332” -> “15893”.

"daemons" -> user - “testuser” -> “rpc_bitscoin”.

"daemons" -> password - “testpass” -> “dR2oBQ3K1zYMZQtJFZeAerhWxaJ5Lqeq9J2”.

p2p - “true” -> “false”.

Save the file with the keyboard shortcut ctrl + x.

Type the following command to open a screen session:

screen

Type the following commands to start your mining pool:

cd $HOME/nomp
sudo node init.js

Press the keyboard shortcut ctrl + a + d to disconnect from your screen session.


Instructions to mine with your mining pool.

Open your wallet.

Go to Tools -> Console.
This is the console where you execute RPC commands.

Type the following command, to create a legacy receiving address for your miner:

getnewaddress "" "legacy"

Example output.

4UyrFQrAoNQMEMqNhZTareRmjeU68bLiop

Click here to download cpuminer and extract the zip file.

Open "Run" with the keyboard shortcut winkey + r.

Enter the following text behind "Open": notepad

Press on the button "OK".

Modify the following values in the following text.

minerd -a sha256d -o stratum+tcp://203.0.113.53:3008 -u 4UyrFQrAoNQMEMqNhZTareRmjeU68bLiop -p anything

203.0.113.53 - “203.0.113.53” -> IPv4 address of your VPS.

4UyrFQrAoNQMEMqNhZTareRmjeU68bLiop - “TP56yqPtRTkse49B96sHzo2B6v48MV24vP” -> Receiving address from the RPC command “getnewaddress” for your miner.

Paste the modified text into notepad.

Click on the menu item "File" -> "Save As...".

The Open dialog box will appear, click on "Save as type" and select the option "All Files (*.*)".

Enter the following text behind "File name": mine.bat

Click on the menu bar, open the directory where you extracted pooler-cpuminer-2.5.0-win64.zip and press on the enter key. enter

Press on the button "Save".

Execute mine.bat to mine with your mining pool.

