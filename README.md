# dbt_demo

### This project is a demonstration of some basic dbt functionalities to get started with dbt.

#### I build a small model and calculated some aggregations, following dbt dummy projects and some other resources.

#### Feel free to suggest any better way to modify and/or incorporate best practices.



## Commands used in building the project:

* `dbt seed` - to upload local flat files to dbt
* `dbt debug`
* `dbt test`
* `dbt run`
* `dbt run --full-refresh` - dbt ignore incremental config in the model and recreates the model/table
* `dbt run --models <>,<>` - to run specific model(s)
* `dbt run` -- target dev - to run in dev/prod/env
* `dbt docs generate` - compile relevant information about your dbt project and warehouse into manifest.json and catalog.json files respectively
* `dbt docs serve` -- to use these .json files to populate a local website with documentation.
