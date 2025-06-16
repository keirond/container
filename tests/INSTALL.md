### Install k6
```shell
sudo gpg -k
sudo gpg --no-default-keyring --keyring /usr/share/keyrings/k6-archive-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C5AD17C747E3415A3642D57D77C6C491D6AC1D69
echo "deb [signed-by=/usr/share/keyrings/k6-archive-keyring.gpg] https://dl.k6.io/deb stable main" | sudo tee /etc/apt/sources.list.d/k6.list
sudo apt update
sudo apt install k6
```

or 

```shell
sudo dnf install https://dl.k6.io/rpm/repo.rpm
sudo dnf install k6
```

### Install go

```shell
curl -LO https://go.dev/dl/go1.24.4.linux-amd64.tar.gz
sudo rm -rf "$HOME/.local/go" && sudo tar -C "$HOME/.local" -xzf go1.24.4.linux-amd64.tar.gz
rm -rf go1.24.4.linux-amd64.tar.gz
```

### Install xk6

```shell
go install go.k6.io/xk6/cmd/xk6@latest
```

