# About analyses/analysis in dbt:

* This folder is automatically created in dbt when dbt is initiated.
* The metric() function here refers to the .yml file in models, at this location - dbt_demo/models/marts/avg_order_amount.yml
  <br> dbt starts to search for file names (.sql or .yml) from same folder, sub-folders, parent folders and so on.
* The .yml specified in the metric function in turn refers to a dbt table and a few dimensions created earlier.

## Key takeaways:

* This structure provides better walls between intermediate transactions and final result of metric.

## Results:

* avg_order_amount.sql

| date_week | avg_odr_amt |
| --- | --- |
| 2018-01-01 | 13.167 |
| 2018-01-08 | 23.000 |
| 2018-01-15 | 10.000 |
| 2018-01-22 | 22.250 |
| 2018-01-29 | 14.857 |
| 2018-02-05 | 16.500 |
| 2018-02-12 | 13.667 |
| 2018-02-19 | 17.000 |
| 2018-02-26 | 15.444 |
| 2018-03-05 | 19.375 |
| 2018-03-12 | 18.666 |
| 2018-03-19 | 11.000 |
| 2018-03-26 | 24.125 |
| 2018-04-02 | 16.429 |
| 2018-04-09 | 24.000 |
