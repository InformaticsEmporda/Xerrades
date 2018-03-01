## Docker 3: Crear contenidors per ser desplegats

Un cop acabada l'aplicació Docker també permetrà empaquetar-la en una imatge que posteriorment es podrà desplegar en l'ordinador de producció.

### Fitxers Dockerfile

Els fitxers Dockerfile permeten definir les passes que fan falta per crear una imatge Docker amb la nostra aplicació a dins. Hi ha comandes per personalitzar tant com es vulgui la creació de la nova imatge.

En general partim d'una imatge existent

    FROM httpd

I li diem quins canvis són els que li volem fer:

| Comanda        | Funció                                                                                                                     |
| -------------- | -------------------------------------------------------------------------------------------------------------------------- |
| **RUN**        | Comandes a executar en el contenidor en temps de creació(normalment instal·lació de paquets)                               |
| **ENTRYPOINT** | Comanda que s'ha d'exectuar al iniciar el contenidor                                                                       |
| **CMD**        | Només n'hi pot haver un. Defineix què s'executa al iniciar el contenidor. (o paràmetres de ENTRYPOINT                      |
| **EXPOSE**     | Informa que el contenidor escoltarà per un port determinat en temps d'execució                                             |
| **ENV**        | Defineix variables d'entorn que es passaran a un RUN futur. Els seus valors encara estaran disponibles en temps d'execució |
| **ADD**        | Còpia fitxers des d'un lloc local a dins del contenidor (permet URLs)                                                      |
| **COPY**       | Còpia fitxers des d'un lloc local a dins del contenidor                                                                    |
| **VOLUME**     | Defineix un volum de dades pel contenidor                                                                                  |
| **USER**       | Defineix l'usuari que es farà servir al executar la imatge en els RUN següents                                             |
| **WORKDIR**    | Directori on es faran els RUN, CMD i ENTRYPOINT                                                                            |
| **ONBUILD**    | Coses a fer quan es faci una imatge a partir de la que es crea                                                             |

### Empaquetar una aplicació

Tenim una aplicació en Node.js que volem empaquetar en una imatge per poder-la distribuïr:

```bash
cat app.js
```

    const http = require('http');
    const os = require('os');
    var handler = function (request, response) {
       response.writeHead(200);
       response.end("Hostname: " + os.hostname() + "!\n");
    };
    var www = http.createServer(handler);
    www.listen(8080);

#### Definir com s'ha d'empaquetar l'aplicació

Com que es tracta d'una aplicació en Node partim d'una imatge que ja té Node.JS instal·lat. En el [repositori oficial](https://hub.docker.com/_/node/) podem veure'n el nom i les versions disponibles:

    FROM node:8

A la imatge obtinguda li hem de carregar l'aplicació que volem desplegar

    ADD app.js /app.js

I també què és el que s'ha d'executar quan es crei un contenidor. Com que és una aplicació de node l'executem amb `node` i el nom de l'arxiu `app.js`:

    CMD node app.js

El resultat serà un fitxer `Dockerfile` amb aquest contingut:

```bash
cat Dockerfile
```

    FROM node:8
    RUN mkdir /mariner
    WORKDIR /mariner
    ADD app.js /mariner/app.js
    CMD node app.js

L'he complicat innecessariament posant l'aplicació en un directori per veure les comandes WORKDIR i RUN

#### Empaquetar

Per crear la imatge només cal executar la comanda `build` i donar-li un nom (ha de començar amb l'username de Docker Hub si li volem enviar)

```bash
docker build -t utrescu/mariner .
```

Que es descarregarà la imatge base (si no la té) i l'empaquetarà seguint les instruccions que li hem donat

    Sending build context to Docker daemon  10.75kB
    Step 1/5 : FROM node:8
    8: Pulling from library/node
    4176fe04cefe: Pull complete
    851356ecf618: Pull complete
    6115379c7b49: Pull complete
    aaf7d781d601: Pull complete
    936f8420f2e4: Pull complete
    b098f1cb38c6: Pull complete
    158bd11ba716: Pull complete
    7c31a2433b70: Pull complete
    Digest: sha256:30627901c9b8b73d51468ed66ac72c6235012b30977df237d20ac64f814aa437
    Status: Downloaded newer image for node:8
     ---> 292a11903b0d
    Step 2/5 : RUN mkdir /mariner
     ---> Running in 7608203534c4
    Removing intermediate container 7608203534c4
     ---> 53337a7ecde2
    Step 3/5 : WORKDIR /mariner
    Removing intermediate container 0f107d08861a
     ---> 8460d6effa02
    Step 4/5 : ADD app.js /mariner/app.js
     ---> 170474dd2dc5
    Step 5/5 : CMD node app.js
     ---> Running in 73cf088cbd5d
    Removing intermediate container 73cf088cbd5d
     ---> 18bd729e88d9
    Successfully built 18bd729e88d9
    Successfully tagged utrescu/mariner:latest

La imatge ja estarà disponible en el nostre repositori local:

```bash
docker images
```

    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
    mariner             latest              18bd729e88d9        6 hours ago         676MB
    node                8                   292a11903b0d        9 hours ago         676MB
    nginx               latest              9e988ed19567        16 hours ago        109MB
    mysql               latest              f008d8ff927d        4 weeks ago         409MB
    ubuntu              latest              00fd29ccc6f1        2 months ago        111MB

I el podem executar normalment:

```bash
docker run --name mar -d mariner
```

Si miro quina és l'adreça IP del contenidor:

```bash
docker inspect mar | grep IPAddress
```

                "Secondary IPAddress": null,
                "IPAddress": "172.99.0.3",
                        "IPAddress: "172.99.0.3",

I podrem accedir a la seva web anant amb el navegador a la IP que té el contenidor http://172.99.0.3:8080

### Exportar la imatge

#### Manualment

Podem exportar a un arxiu `tar` la imatge acabada de generar fent servir la opció `save`

```bash
docker save utrescu/mariner > mariner.tar
```

El resultat es podrà distribuir amb el mètode que es vulgui al destí (que ha de tenir Docker instal·lat) el el que podrà importar amb `load`

```bash
docker load < /tmp/mariner.tar
```

#### A través de Docker Hub

Es poden enviar les imatges per la xarxa al compte de Docker Hub des de la mateixa línia de comandes. Però requereix que la imatge estigui etiquetada amb l'usuari que tinguem de Docker Hub.

Per exemple si l'usuari és `pere`, el nom de la imatge ha de ser `utrescu/mariner`

```bash
docker login
```

```bash
docker push utrescu/mariner
```
