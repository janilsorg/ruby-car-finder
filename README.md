# RUBY ON RAILS CAR FINDER

## Ruby on Rails application
<p>
The idea was to create a page where the cars are displayed with a few informations. Then, you can have the option to click on it and see the whole set of informations. Among these informations there is a link to a condition report
</p>
<p>
All the data used for this project is inside the file on app/data/vehicles_list.csv.
</p>
<p>
In order to import this data to the SQLite database, I've created a job script located in app/jobs/import_data_csv_job.rb which will delete all data from database and the import everything from the CSV file and normalize a few columns
</p>

## RUNNING THE APPLICATION
## Run the bundle install
```
bundle install
```
## Run the migration

```
rails db:migrate
```

## Run the server
```
rails s
```

## Improvements and thoughts
 - I think I shall re analyse the normalization due to the many DB request the index makes in order to get the lookup fields such as BODY, COLORS, etc
