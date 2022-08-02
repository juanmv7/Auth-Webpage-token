# Authwebpage
This is a demo of a webpage that allows authentication without the use of a password, intead we use a token with public key cryptography.

## Getting it running

First clone this repo, then:

### 1. Install dependencies

```npm install```

### 2. Generate self signed certificate and keys (webauthn requires HTTPS)

**I repeat, you need to generate keys, certificate and serve using https for webauthn to work**

```
cd keys

openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -sha256 -days 365 -subj '/CN=localhost'
openssl genrsa -out key.pem
openssl req -new -key key.pem -out csr.pem
openssl x509 -req -days 9999 -in csr.pem -signkey key.pem -out cert.pem

rm csr.pem

cd ..
```

### 3. Start server 

```node app```

### 4. Open browser

```https://localhost:3000```

## Docker development build

The important thing here is to run this in a docker. So thats why there is a DockerFile. You first need to build the docker. As an advice, I recommend you to use DockerDesktop.

docker build . -t <DockerHub_ID>/authweb_api
docker run -p <port>:3000 -d juanmv7/authweb_api      _where the port, you can choose it_
