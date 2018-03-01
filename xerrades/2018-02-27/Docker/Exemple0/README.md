## Docker 0: Fer servir contenidors

Durant anys les màquines virtuals han estat la nova esperança blanca. Van permetre reutilitzar els recursos inutilitzats de les sales de servidors. En comptes d'omplir sales de servidors es poden desplegar els diferents serveis en una sola màquina. A més si li passa alguna cosa se n'inicia una nova instància i llestos. Això és especialment efectiu en sistemes que funcionen millor si només hi ha una sola aplicació per servidor (Windows Server)

Els contenidors són un pèl diferents de les màquines virtuals. Mentre una màquina virtual encapsula completament un servidor, un contenidor són un grup de components sobre un sistema operatiu (que en pot tenir d'altres). Els contenidors depenen del nucli sistema operatiu on corren per oferir serveis, gestió de memòria, CPU, ...

Com que els contenidors depenen del nucli, no es poden mesclar sistemes operatius de la mateixa forma que es fa amb la virtualització però alhora com que són com un procés més, s'executen d'una forma més eficient.

En general els contenidors permeten als desenvolupadors empaquetar una aplicació amb totes les parts que li fan falta: llibreries, dependències diverses, i distribuir-ho tot plegat com un sol paquet.

### Docker

Docker és una tecnologia de contenidors creada inicialment per sistemes Linux però que s'ha expandit a altres plataformes com Windows

Per exemple podem tenir un contenidor que es comporta com un Ubuntu amb:

```bash
docker run --name ubuntet -ti ubuntu /bin/bash
```

Podem veure que el contenidor està en marxa amb:

```bash
docker ps
```

    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
    649f477ae91e        ubuntu              "/bin/bash"         2 hours ago         Up 2 hours                              ubuntet

Dins del contenidor s'hi pot fer qualsevol de les tasques que es poden fer en un sistema en Ubuntu: instal·lar programes, executar-los, etc... Practicament igual que si estem en un sistema Ubuntu normal (sense entorn gràfic)

Podem obtenir informació del contenidor en marxa amb `inspect`. De tota la informació que mostra normalment la que es fa servir més és la de l'adreça IP que ha rebut el contenidor

```bash
docker inspect ubuntet | grep IPAddress
```

                "Secondary[01;31m[KIPAddress[m[Kes": null,
                "[01;31m[KIPAddress[m[K": "172.99.0.2",
                        "[01;31m[KIPAddress[m[K": "172.99.0.2",

Els contenidors Docker també tenen altres possiblitats: poden tenir carpetes compartides, mapejar ports en el host d'origen, crear xarxes privades per diferents contenidors, ..

Per exemple es pot tenir un contenidor amb Ubuntu que comparteixi amb el host una carpeta

```bash
docker run --rm -ti -v $PWD:/compartit ubuntu /bin/bash
```
