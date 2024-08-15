<h1 align="center">Allora Network Point Program</h1>

- Thanks to [Moei]( https://github.com/0xmoei) for detailed guide
> - Create a new wallet in Keplr & backup seed-phrase
>
> - Connect to the on-chain Point Program [Dashboard](https://app.allora.network?ref=eyJyZWZlcnJlcl9pZCI6IjVlNmEwMjc5LTcxNjEtNDhmYS04NGM3LWEzYzM0MGM4MGIzNyJ9)
>
> - In Campaigns tab you see 2 tasks, Check them
> 
> - In the tutorial we run 2 `Price Prediction Workers` with `topic 5` & `topic 6` (Predicting `SOL` price every 24hr & 1hr)
>
> - Check the campaigns tasks steps to see what `topic` means
>
> - We get points by running a worker

<h1 align="center">Price Prediction Worker Node</h1>

## System Requirements
![image](https://github.com/user-attachments/assets/56d300cd-4dde-42b2-b2ea-ae8a62b1339c)

## Install dependecies
```console
# Install Packages
sudo apt update & sudo apt upgrade -y

sudo apt install ca-certificates zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev curl git wget make jq build-essential pkg-config lsb-release libssl-dev libreadline-dev libffi-dev gcc screen unzip lz4 -y
```
```console
# Install Python3
sudo apt install python3
python3 --version

sudo apt install python3-pip
pip3 --version
```

```console
# Install Docker
curl --proto '=https' --tlsv1.2 -sSfL https://raw.githubusercontent.com/Dedenwrg/dependencies/main/docker/docker.sh | sudo sh 

# Docker Permission to user
sudo groupadd docker
sudo usermod -aG docker $USER
```

```console
# Install Go
sudo rm -rf /usr/local/go
curl -L https://go.dev/dl/go1.22.4.linux-amd64.tar.gz | sudo tar -xzf - -C /usr/local
echo 'export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin' >> $HOME/.bash_profile
echo 'export PATH=$PATH:$(go env GOPATH)/bin' >> $HOME/.bash_profile
source .bash_profile
go version
```

## Install Allorad: Wallet
```console
git clone https://github.com/allora-network/allora-chain.git

cd allora-chain && make all

allorad version
```

## Add Wallet
* You can use your keplr seed-phrase to recover
```console
# Recover your wallet with seed-phrase
allorad keys add testkey --recover
```

## Get Faucet
> Connect to Allora [dashboard](https://app.allora.network?ref=eyJyZWZlcnJlcl9pZCI6IjVlNmEwMjc5LTcxNjEtNDhmYS04NGM3LWEzYzM0MGM4MGIzNyJ9) to find your Allora address or run `allorad keys list`
>
> You can add Allora network to Keplr [here](https://explorer.edgenet.allora.network/wallet/suggest)
> 
> Get uAllo faucet [here](https://faucet.testnet-1.testnet.allora.network/)
> 

## Install & Run Worker

### Clone worker
```console
cd $HOME
git clone https://github.com/allora-network/basic-coin-prediction-node
cd basic-coin-prediction-node
```

### setup Config Worker
- Replace SeedPhrase with your wallet seed phrase
```
# Create new config file
curl -O https://raw.githubusercontent.com/adanothe/node/main/testnet/allora/config.json
SEED_PHRASE="SeedPhrase"
sed -i "s/\"addressRestoreMnemonic\": \"[^\"]*\"/\"addressRestoreMnemonic\": \"$SEED_PHRASE\"/" config.json
```

### Run Worker
```console
chmod +x init.config
./init.config
```
* If you need to make changes to your `config.json` , you must rerun this command again after your changes are done


```console
docker compose up -d --build
```

### Check logs
worker:
```console
docker logs -f --tail=20 worker
```

inference:
```console
docker compose logs -f inference
```

## You'll receive points on the [dashboard](https://app.allora.network/points/leaderboard) within the next few hours.



