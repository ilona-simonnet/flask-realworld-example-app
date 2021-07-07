.. image:: image.png

Quickstart
----------

CircleCI build:

.. image:: https://circleci.com/gh/gothinkster/flask-realworld-example-app.png


First, set your app's secret key as an environment variable. For example,
add the following to ``.bashrc`` or ``.bash_profile``.

.. code-block:: bash

    export CONDUIT_SECRET='something-really-secret'

Before running shell commands, set the ``FLASK_APP`` and ``FLASK_DEBUG``
environment variables ::

    export FLASK_APP=/path/to/autoapp.py
    export FLASK_DEBUG=1

Then run the following commands to bootstrap your environment ::

    git clone https://github.com/gothinkster/flask-realworld-example-app.git
    cd flask-realworld-example-app
    pip install -r requirements/dev.txt


Run the following commands to create your app's
database tables and perform the initial migration ::

    flask db init
    flask db migrate
    flask db upgrade

To run the web application use::

    flask run --with-threads


Deployment
----------

In your production environment, make sure the ``FLASK_DEBUG`` environment
variable is unset or is set to ``0``, so that ``ProdConfig`` is used, and
set ``DATABASE_URL`` which is your postgresql URI for example
``postgresql://localhost/example`` (this is set by default in heroku).


Shell
-----

To open the interactive shell, run ::

    flask shell

By default, you will have access to the flask ``app`` and models.


Running Tests
-------------

To run all tests, run ::

    flask test


Migrations
----------

Whenever a database migration needs to be made. Run the following commands ::

    flask db migrate

This will generate a new migration script. Then run ::

    flask db upgrade

To apply the migration.

For a full migration command reference, run ``flask db --help``.


Exercice DevOps
---------------

**A - Mise en conteneur de l'application**

*Contruction image:* 
    - FROM : image sur laquelle on se base (ici centos, la version 8)      
    - EXPOSE : port sur lequel l'application écoute      
    - CMD : commande à exécuter lors du démarrage du conteneur (ici on exécute app.py)  
    
*Exécution image:*::

    - docker build -t flask-app:v1        
    - docker run -tid -p 8443 -v /path_to_local_volume:/path_to_container--name <container_name> flask-app:v1 
    
    La dernière commande permet de stocker les données dans un répertoire local partagé entre le serveur qui héberge docker et le(s) conteneur(s)   
    
 
**B - Mise en place de la chaîne CI/CD**

*Pull de l'image construite dans la partie A:*  ::

    docker pull ilosim/exercice_devops:flask-app:v1  


**C - Activation du https**  

*Génération du certificat x.509:*::

- openssl req -newkey rsa:2048 -days 365000 -nodes -keyout server-key.pem -out server-req.pem
- openssl rsa -in server-key.pem -out server-key.pem   
- openssl x509 -req -in server-req.pem -days 365000 -CA ca-cert.pem -CAkey ca-key.pem -set_serial 01 -out server-cert.pem

On peut vérifier que le certificat x509 a bien été généré avec : ::

- openssl verify -CAfile ca.pem server-cert.pem 

*Exécution de l'application avec le https activé:*



