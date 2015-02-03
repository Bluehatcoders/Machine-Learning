
Instalaci�n de PHP 5
--------------------

Para la instalaci�n, haremos lo de siempre, descargar los fuentes,
descomprimirlos y ejecutar el script de configuraci�n. En este caso la
instalaci�n va a ser un poco m�s tediosa, puesto que hay que ver qu�
opciones vamos activar. Puesto que ya tenemos instalada una versi�n de PHP
que viene con la distribuci�n vamos a utilizar como referencia utilizaremos 
la informaci�n que obtenemos de la funci�n phpinfo()(**ver nota), tambi�n podemos 
encontrar informaci�n en:

       http://es2.php.net/manual/es/funcref.php

 donde nos indican para qu� sirve cada extensi�n y c�mo activarla. Por �ltimo,
 si ejecutamos:
  
    ./configure --help

obtendremos todas las opciones de compilaci�n.

 A continuaci�n adjunto la l�nea de configure que empleamos, as� como las 
bibliotecas que hubo que instalar. N�tese que puede que en otros sistemas pueden 
variar los nombres de los directorios de las bibliotecas. 

  tar -xzvf php-5.0.0RC2.tar.gz
  cd php-5.0.0RC2

  ./configure --with-regex=system  --with-pcre-regex=/usr --disable-short-tags --enable-memory-limit --disable-debug --enable-bcmath --with-gmp  --with-pdflib=/usr/local --with-tiff-dir=/usr/local --with-tidy --enable-soap --with-xmlrpc --with-layout=GNU --with-pear=/usr/share/php --enable-calendar --enable-sysvsem --enable-sysvshm --enable-track-vars --enable-trans-sid --enable-bcmath --with-bz2 --enable-ctype --with-iconv --enable-exif --enable-filepro --enable-ftp --with-gettext --enable-shmop --enable-sockets --enable-wddx --enable-yp --with-zlib --with-pgsql --with-openssl --with-exec --with-curl --with-gd=/usr/local --enable-gd-native-ttf --with-jpeg-dir=/usr/local --with-png-dir=/usr/local -with-freetype-dir=/usr/local --with-ldap --with-mcal --with-mhash --with-mm --with-mysql --with-unixODBC  --enable-xslt --with-xslt-sablot --with-snmp --enable-ucd-snmp-hack --with-ttf --with-mcrypt --with-ming --with-java=/home/merlos/java/j2sdk/

  make 
  make install

Installing PHP SAPI module:       cgi
Installing PHP CGI into: /usr/local/bin/
Installing PEAR environment:      /usr/share/php/
[PEAR] Archive_Tar    - installed: 1.1
[PEAR] Console_Getopt - installed: 1.2
[PEAR] PEAR           - installed: 1.3.1
Wrote PEAR system config file at: /usr/local/etc/pear.conf
You may want to add: /usr/share/php to your php.ini include_path
[PEAR] XML_RPC        - installed: 1.1.0
Installing build environment:     /usr/local/lib/php/build/
Installing header files:          /usr/local/include/php/
Installing helper programs:       /usr/local/bin/
  program: phpize
  program: php-config
  program: phpextdist




---
NOTA: Deberemos instalar las siguientes bibliotecas para la l�nea anterior

   * libxml2 (apt-get install libxml2-dev)
       (fuentes: http://www.xmlsoft.org/downloads.html)
   * libxlst (apt-get install libxlst-dev)
        (fuentes: http://www.xmlsoft.org/downloads.html)
   * libbz2 (apt-get install libbz2-dev)
   * libmhash (apt-get install libmhash-dev)
   * librecode (apt-get install librecode-dev)
   * libmm (apt-get install libmm-dev)
   * libsnmp (apt-get install libsnmp5-dev)
   * libobdc (apt-get install unixodbc-dev)
   * libgmp3 (apt-get install libgmp3-dev)
   * libtidy ( apt-get install libtidy-dev)
   * libxmlrpc (apt-get install libxmlrpc-c3-dev)
   * libpcre3 (apt-get install libpcre3-dev)
   * libmcrypt (apt-get install libmcrypt-dev)
   * libexif (apt-get install libexif-dev)

   * Tambi�n, para esta versi�n necesitamos de PHP necesitamos tener instalado
     el flex 2.5.4 (ftp://ftp.gnu.org/pub/gnu/non-gnu/flex/)
     (Si la versi�n que viene con nuestra distribuci�n es anterior a esta el configure lanzar� un warning. Para solventar este problema,  podemos desinstalar el flex de la distribuci�n (apt-get remove flex) y compilar la versi�n descargada. Los pasos son los mismos de siempre ./configure;make;make install)

--
** Nota: Para ver la informaci�n que nos ofrece la funci�n phpinfo(). hay que crear un fichero con extensi�n php que sea accesible a trav�s del apache, por ejemplo, el fichero /var/www/phpinfo.php:

  <?php
     phpinfo();
  ?>
--

--
Nota: Para a�adir la extension --with-java es necesario disponer de la JSDK, disponible en http://java.sun.com
--

--     
Consejo: Dado que la salida del ./configure es muy abundate, podemos 
redireccionar la salida estandar a un fichero para poder analizar con m�s 
detenimiento las opciones que se han configurado:
   
   ./configure --with-toda-la-lista-de-argumentos > fichero_salida

As�, en fichero salida tendremos todo lo que sale por pantalla.
--

--
Problema: Durante el make tuve este problema:

    gcc: /usr/lib/libtidy.so: No such file or directory

    Soluci�n:

    cd /usr/lib/lib
    ln -s libtidy-0.99.so.0 libtidy.so
    cd -


Bueno, una vez instalado PHP5, necesitaremos modificar la configuraci�n del apache para que se ejecute la nueva versi�n compilada. Para ello editamos el fichero de configuraci�n de apache. En nuestro caso es un Apache 1.3.29 y el fichero se encuentra en /etc/apache/httpd.conf.

Copiar las instrucciones de
-----------------------------------------
http://www.pookey.co.uk/php-security.xml
----------------------------------------
