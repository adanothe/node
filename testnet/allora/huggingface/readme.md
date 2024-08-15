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
```

```
