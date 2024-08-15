## Stop old nodes
* If you are running basic-price node, stop it
```console
cd $HOME && cd basic-coin-prediction-node
docker compose down -v
docker container prune
```

## Config HuggingFace worker
```console
cd $HOME
git clone https://github.com/allora-network/allora-huggingface-walkthrough
cd allora-huggingface-walkthrough
```
```console
mkdir -p worker-data
chmod -R 777 worker-data
```
- Replace `SeedPhrase` with your wallet seed phrase
```
curl -O https://raw.githubusercontent.com/adanothe/node/main/testnet/allora/huggingface/config.json
SEED_PHRASE="SeedPhrase"
sed -i "s/\"addressRestoreMnemonic\": \"[^\"]*\"/\"addressRestoreMnemonic\": \"$SEED_PHRASE\"/" config.json
```

## Create Coingecko API key
- create demo account in
https://www.coingecko.com/en/developers/dashboard
* Replace APIKEY with your apikey from Coingecko

```
COINGECKO_API_KEY="APIKEY"
sed -i "s/<Your Coingecko API key>/$COINGECKO_API_KEY/" app.py
```

## Run Huggingface Worker
```console
chmod +x init.config
./init.config
```

```console
docker compose up --build -d
```

Logs:
```
docker logs -f --tail=20 worker
```
```
docker compose logs -f inference
```


