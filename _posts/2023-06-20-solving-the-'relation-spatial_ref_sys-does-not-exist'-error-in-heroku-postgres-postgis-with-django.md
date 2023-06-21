---
layout: post
title: "Solving the 'Relation Spatial_ref_sys Does Not Exist' Error in Heroku Postgres PostGIS with Django"
tags: ['python', 'django', 'heroku', 'heroku-postgres']
---

![Image of a Cat](http://source.unsplash.com/1600x900/?cat)

## Subheading: Navigating Through the Complexities of Heroku Postgres PostGIS

Often times, when working with **Heroku Postgres PostGIS** in a Django project, developers encounter an error message that reads: `'relation "spatial_ref_sys" does not exist'`. This error can be quite frustrating and confusing, especially if you are new to working with geospatial databases in Django.

## The Root of the Problem

Before we dive into how to solve this error, it's important to understand why it occurs. The `'relation "spatial_ref_sys" does not exist'` error is typically caused by one of two common mistakes:

1. **The PostGIS extension is not enabled in your Heroku Postgres database.**

2. **The Django settings.py file does not have the correct database configuration for PostGIS.**

The `spatial_ref_sys` table is a critical component of the PostGIS extension, and if it's not found, that's a clear sign that the extension is not enabled or properly configured.

## Enabling the PostGIS Extension

To solve the first issue, you need to enable the PostGIS extension in your Heroku Postgres database. This can be done by running the following command in your Heroku CLI:

```javascript
heroku pg:psql -a your-app-name-here -c "CREATE EXTENSION IF NOT EXISTS postgis;"
```

This command tells Heroku to create the PostGIS extension in your database if it doesn't already exist. Replace `your-app-name-here` with the name of your Heroku app.

## Configuring Django for PostGIS

For the second issue, you need to ensure that your Django settings.py file is correctly configured for PostGIS. Here's what the database settings might look like:

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.contrib.gis.db.backends.postgis',
        'NAME': 'your-database-name',
        'USER': 'your-database-user',
        'PASSWORD': 'your-database-password',
        'HOST': 'your-database-host',
        'PORT': 'your-database-port',
    }
}
```

The key here is the `'ENGINE'` setting. It should be set to `'django.contrib.gis.db.backends.postgis'` to tell Django to use the PostGIS database backend.

## The Role of the spatial_ref_sys Table

The `spatial_ref_sys` table is a part of the PostGIS extension. It contains information about various spatial reference systems. When you perform a spatial query in Django, it uses this table to convert coordinates into a format that can be understood by the database. If the table doesn't exist, the query fails, and you see the `'relation "spatial_ref_sys" does not exist'` error.

## The Importance of the DATABASE_URL Environment Variable

In Heroku, the database connection details are stored in an environment variable called `DATABASE_URL`. This variable is automatically created by Heroku when you provision a new Postgres database. Django can use this variable to connect to the database. Here's how you can configure Django to use the `DATABASE_URL` environment variable:

```python
import dj_database_url

DATABASES = {
    'default': dj_database_url.config(
        default='postgres://user:password@localhost:5432/mydatabase',
        conn_max_age=600,
        ssl_require=True
    )
}

DATABASES['default']['ENGINE'] = 'django.contrib.gis.db.backends.postgis'
```

In this code, the `dj_database_url.config()` function is used to parse the `DATABASE_URL` environment variable and convert it into a format that Django can understand. The `'ENGINE'` setting is then updated to use the PostGIS database backend.

## The Role of Heroku Add-Ons

Heroku provides a number of add-ons that can be used to extend the functionality of your apps. One of these is the Heroku Postgres add-on, which provides a fully managed SQL database service. When you add this add-on to your app, Heroku automatically creates a new Postgres database and sets the `DATABASE_URL` environment variable.

## The Importance of Migrations

After enabling the PostGIS extension and configuring Django to use it, you need to run your migrations to create the necessary tables in the database. This can be done by running the following command in your Heroku CLI:

```javascript
heroku run python manage.py migrate
```

This command tells Django to create any necessary tables in the database, including the `spatial_ref_sys` table. If you've followed the steps above, you should no longer see the `'relation "spatial_ref_sys" does not exist'` error.

## Troubleshooting Further Issues

In some cases, you might still encounter issues even after following the steps above. If that's the case, it's important to check the logs for any error messages. You can view the logs by running the following command in your Heroku CLI:

```javascript
heroku logs --tail
```

These logs can provide valuable insight into what's causing the issue and how to fix it. For example, if you see an error message that says `'django.contrib.gis.db.backends.postgis' isn't an available database backend`, that means Django can't find the PostGIS database backend. This could be because the Django version you're using doesn't support PostGIS, or because the PostGIS extension is not installed in your Python environment.

## Conclusion

In this blog post, we've explored how to solve the `'relation "spatial_ref_sys" does not exist'` error in Heroku Postgres PostGIS with Django. By understanding the root of the problem, enabling the PostGIS extension, configuring Django correctly, and running migrations, you can overcome this error and successfully use geospatial databases in your Django projects.

If you're a developer who uses Heroku, Postgres, PostGIS, and Django, you might have encountered the error "Relation Spatial_ref_sys Does Not Exist". This error can be quite a headache, especially when you're trying to deploy your Django application on Heroku. 

In this blog post, we will be addressing this error in detail and providing you with a step-by-step guide on how to resolve it. 

## Understanding the Error 

Before we dive into the solution, it's important to understand what this error means. The error "Relation Spatial_ref_sys Does Not Exist" is thrown when the PostGIS extension is not properly set up in your Heroku Postgres database. 

The `spatial_ref_sys` table is a key component of the PostGIS extension. It stores spatial reference system identifiers (SRID) and their definitions. If this table doesn't exist in your database, any spatial query you try to execute will fail, hence the error.

## Step 1: Setting up PostGIS Extension

The first step to solve this error is to ensure that the PostGIS extension is properly set up in your Heroku Postgres database. You can do this by running the following command in your Heroku CLI:

```javascript
heroku pg:psql --app your-app-name
```
Replace `your-app-name` with the name of your Heroku app. After running this command, you should be connected to your Heroku Postgres database.

Next, create the PostGIS extension by running:

```javascript
CREATE EXTENSION IF NOT EXISTS postgis;
```
This command will create the PostGIS extension if it doesn't already exist.

## Step 2: Verify the Extension

After creating the PostGIS extension, verify that it's properly set up by running:

```javascript
SELECT PostGIS_full_version();
```
This command will return the full version of your PostGIS extension. If it returns a version number, it means the extension is properly set up.

## Step 3: Check the `spatial_ref_sys` Table

Now, check if the `spatial_ref_sys` table exists in your database by running:

```javascript
SELECT * FROM spatial_ref_sys;
```
If the table exists, this command will return its contents. If it doesn't, you'll get the "Relation Spatial_ref_sys Does Not Exist" error.

## Step 4: Create the `spatial_ref_sys` Table

If the `spatial_ref_sys` table doesn't exist, create it by running:

```javascript
CREATE TABLE spatial_ref_sys (srid integer NOT NULL PRIMARY KEY, auth_name varchar(256), auth_srid integer, srtext varchar(2048), proj4text varchar(2048));
```
This command will create the `spatial_ref_sys` table with the necessary columns.

## Step 5: Populate the `spatial_ref_sys` Table

After creating the `spatial_ref_sys` table, populate it with the necessary data by running:

```javascript
INSERT INTO spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) VALUES (4326, 'EPSG', 4326, 'GEOGCS["WGS 84",DATUM["WGS_1984",SPHEROID["WGS 84",6378137,298.257223563,AUTHORITY["EPSG","7030"]],AUTHORITY["EPSG","6326"]],PRIMEM["Greenwich",0,AUTHORITY["EPSG","8901"]],UNIT["degree",0.0174532925199433,AUTHORITY["EPSG","9122"]],AUTHORITY["EPSG","4326"]]', '+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs ');
```
This command will insert the WGS 84 spatial reference system into the `spatial_ref_sys` table.

## Step 6: Verify the `spatial_ref_sys` Table

After populating the `spatial_ref_sys` table, verify that the data was correctly inserted by running:

```javascript
SELECT * FROM spatial_ref_sys;
```
This command should now return the data you inserted into the `spatial_ref_sys` table.

## Step 7: Update Your Django Settings

Now, update your Django settings to use the PostGIS database. In your `settings.py` file, make sure your database settings look like this:

```javascript
DATABASES = {
    'default': {
        'ENGINE': 'django.contrib.gis.db.backends.postgis',
        'NAME': 'your-database-name',
        'USER': 'your-database-user',
        'PASSWORD': 'your-database-password',
        'HOST': 'your-database-host',
        'PORT': 'your-database-port',
    }
}
```
Replace the placeholder values with your actual database details.

## Step 8: Test Your Django Application

Finally, test your Django application to see if the error is resolved. If everything was done correctly, you should no longer see the "Relation Spatial_ref_sys Does Not Exist" error.

In conclusion, the "Relation Spatial_ref_sys Does Not Exist" error in Heroku Postgres PostGIS with Django can be solved by properly setting up the PostGIS extension and the `spatial_ref_sys` table in your Heroku Postgres database. I hope this guide has been helpful in resolving this error. Happy coding!
# Recommended Sites

If you are trying to solve the 'Relation Spatial_ref_sys Does Not Exist' Error in Heroku Postgres PostGIS with Django, here are a few official websites that you can refer to. These websites are reliable, up-to-date, and won't give you a 404 error. They provide comprehensive guides, solutions, and discussions that can help you understand and solve the issue.

1. [Heroku Dev Center](https://devcenter.heroku.com/articles/postgis)
2. [Django Project Official Documentation](https://docs.djangoproject.com/en/3.2/ref/contrib/gis/install/geolibs/)
3. [PostGIS Official Documentation](https://postgis.net/docs/)
4. [Stack Overflow](https://stackoverflow.com/questions/16736891/postgis-error-relation-spatial-ref-sys-does-not-exist)
5. [GitHub](https://github.com/rgeo/activerecord-postgis-adapter/issues/266)
6. [PostgreSQL Official Documentation](https://www.postgresql.org/docs/9.1/static/sql-createspatialrefsys.html)