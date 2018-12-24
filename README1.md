# nginx-project
This sample is a simple website project for transfering the concept of CICD.

## Develop

At developing stage, we can modify the homepage of nginx at `src/index.html`.

For example, we can add current timestamp in `index.html` source file.

```
$ vi src/index.html
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at


<a href="http://nginx.com/">nginx.com</a>.</p>
<p><em>Thank you for using nginx.</em></p>
Thu Dec 13 21:51:04 CST 2018 v0.1.0<br/>
</body>
</html>
```

## Build and Push Image

At CI stage, we can type the command below to build and push image.
```
make build
```

## Deploy

At CD stage, we can deploy the website through Kubectl or Helm.
### Kubectl Deploy
```
kubectl run ts-nginx --image=wangxinsh/timestamp-nginx:latest
```

```
kubectl expose ts-nginx 
```

### Helm Install

```
helm install --name sample1 ./chart/ --set image.tag=TAG
```

### Uninstall

```
helm del --purge sample1
```

