# Docker 1: Connectar amb un Contenidor

## Iniciar el contenidor

Podem iniciar el contenidor oficial que ja té MySQL instal·lat:

* Com que és un servei l'inicio amb '-d'
* Mapejem el port en local
* Fem que les dades no desapareguin amb una carpeta compartida `-v`
* Definim la contrasenya de root `-e MYSQL_ROOT_PASSWORD`

```bash
docker run --name mymysql -p 3306:3306 -v /home/xavier/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=ies2010 -d mysql
```

Després hi podrem connectar normalment tal com si tinguéssim el servidor instal·lat en local amb l'usuari 'root' i la contrasenya que acabo de definir 'ies2010'

## MySQL

### Importar les dades

Com que el servidor està en marxa només hem de crear una base de dades i importar-li les dades de la mateixa forma que ho faríem en local

Connectem a través de la línia de comandes (hi he de posar el protocol perquè sinó el client MySQL intenta cercar el `pid` del procés (però això no caldrà des dels programes):

    mysql -u root -p --protocol=tcp

    password:
    Enter password:
    Reading table information for completion of table and column names
    You can turn off this feature to get a quicker startup with -A

    Welcome to the MariaDB monitor.  Commands end with ; or \g.
    Your MySQL connection id is 39
    Server version: 5.7.21 MySQL Community Server (GPL)

    Copyright (c) 2000, 2017, Oracle, MariaDB Corporation Ab and others.

    Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

    MySQL [colors]>

I creem la base de dades:

    MySQL [colors]> CREATE DATABASE colors;
    Query OK, 1 row affected (0.07 sec)

Des del sistema operatiu podem importar el fitxer amb les dades a MySQL

```bash
mysql -u root -p colors --protocol=tcp < colors.sql
```

Es pot fer una consulta per veure que s'han carregat bé les dades:

    MySQL [colors]> SELECT * FROM color WHERE nom LIKE 'Bl%'

    11 rows affected.

<table>
    <tr>
        <th>id</th>
        <th>nom</th>
        <th>rgb</th>
    </tr>
    <tr>
        <td>9</td>
        <td>Blanc</td>
        <td>#FFFFFF</td>
    </tr>
    <tr>
        <td>10</td>
        <td>Blat</td>
        <td>#F5DEB3</td>
    </tr>
    <tr>
        <td>11</td>
        <td>Blau</td>
        <td>#0000FF</td>
    </tr>
    <tr>
        <td>12</td>
        <td>Blau cel</td>
        <td>#77B5FE</td>
    </tr>
    <tr>
        <td>13</td>
        <td>Blau de cobalt</td>
        <td>#0047AB</td>
    </tr>
    <tr>
        <td>14</td>
        <td>Blau de França</td>
        <td>#318CE7</td>
    </tr>
    <tr>
        <td>15</td>
        <td>Blau de Prússia</td>
        <td>#003153</td>
    </tr>
    <tr>
        <td>16</td>
        <td>Blau fosc</td>
        <td>#00008B</td>
    </tr>
    <tr>
        <td>17</td>
        <td>Blau marí</td>
        <td>#000080</td>
    </tr>
    <tr>
        <td>18</td>
        <td>Blau reial</td>
        <td>#002366</td>
    </tr>
    <tr>
        <td>19</td>
        <td>Blauet</td>
        <td>#003399</td>
    </tr>
</table>

## Connectar des de Python

Des de la màquina local primer instal·lo una llibreria per connectar amb MySQL des de Python.

```bash
pip install pymysql
```

I es pot fer un programa que mostra els colors de la base de dades que comencen per la lletra 'B':

```python
import pymysql
import pymysql.cursors

connection = pymysql.connect(host='localhost',
                             user='root',
                             password='ies2010',
                             db='colors',
                             charset='utf8mb4',
                             )  # cursorclass = pymysql.cursors.DictCursor)
try:
    with connection.cursor() as cursor:
        sql = "SELECT `id`, `nom` FROM `color` WHERE `nom` LIKE %s"
        cursor.execute(sql, ('B%'),)
        results = cursor.fetchall()
        for result in results:
            print result[0], " ", result[1]
finally:
    connection.close()
```

    7   Beix
    8   Bistre
    9   Blanc
    10   Blat
    11   Blau
    12   Blau cel
    13   Blau de cobalt
    14   Blau de França
    15   Blau de Prússia
    16   Blau fosc
    17   Blau marí
    18   Blau reial
    19   Blauet
    20   Bronze
