## Meta

Migration-dervied database schema for mandyville. Using Postgres 13.

Uses [migrate](https://github.com/golang-migrate/migrate) to handle
migrations.

### Adding a migration

Create the migration files:

```
$ migrate create -ext sql -dir migrations/ <name>
```

Write the migration, both up and down. Use a transaction if there's
multiple statements. Full details [here](https://bit.ly/3c6RWbO).

[Craft your database URL](https://bit.ly/30h8OHk). It's easiest to
store it in an ENV variable.


Confirm the version of the database you're updating matches the most up to
date migration before your change:

```
migrate -database ${DB} -path migrations version
```

Run the migration: 

```
$ migrate -database ${DB} -path migrations up
```

The command above runs all migrations that are not currently applied.

### Importing base data

There's some useful base data in `base_data.sql`. Import it into the
database using `psql`:

```
$ psql -h <host> -U <user> mandyville < base_data.sql
```

### TODO

* [ ] Enable SSL
* [ ] Add script to spin up dev database
