Docker Container For Website Development
====

This project holds a container for development of several smaller website projects and creates an PHP Apache (v7.3) container, MySQL Database (v5.6) container and a PhpMyAdmin container. It can also run Wordpress instances and even Drupal but getting some Drupal-specific frameworks (like Drush) up and running would take a little more configuration.

It's based on a [setup](https://github.com/jcavat/docker-lamp) by [Joel Cavat](https://github.com/jcavat) but I've changed the structure somewhat in accordance with some specific needs of my own.

### Starting

Assuming you have Docker installed and running,from within the project's root directory (where Dockerfile is located), open a terminal and run: 

`$ docker-compose up -d`

### Use MySQL

In this example, the database is `db` based on the docker-compose.yml file settings. Once the MySQL server is set, you can change permission grants by doing the following

At the root level of the directory, run the following: 
```
$ docker-compose exec db bash
``` 

This should show something like the following: 

`root@1d8c123e14b3:/#`

Once you see that, run the following:

```$ mysql -u root -p```

A prompt for a password appears. Use the one you specified in the docker-compose.yml file. Assuming this works, a `mysql` prompt appears.

### Website Database Configurations
For setting up database connections in test sites:

You can select whatever you want for MySQL user, password and host – just make sure the host name you're using to edit MySQL matches what you put into the `docker-compose.yml` file (in the example provided, that is `db`)


### Granting User Privileges
If you want to give your admin account privileges after setup, you can do so using what you set as a username in the `docker-compose.yml` file. In this example, using the username *DATABASEUSER* as a stand-in for whatever you decide for your own build, run the following in mysql:

```
GRANT ALL PRIVILEGES ON *.* TO 'DATABASEUSER'@'%';
```

You can then exit MySQL and verify the changes in PhpMyAdmin.
