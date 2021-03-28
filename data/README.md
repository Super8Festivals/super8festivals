# Data Files (*.sql)

The purpose of these files is to make testing really easy by having different sets of data to populate the database with.

## Files

### `initial_data.sql`

This contains the data for a newly created Omeka site with the Super8Festivals Theme as the active theme. 
It also installs the Super8Festivals plugin.

## How to load this data

```
cat backup.sql | docker exec -i <container> /usr/bin/mysql -u root --password=omeka omeka
```


See [this gist](https://gist.github.com/spalladino/6d981f7b33f6e0afe6bb) for the original source.

