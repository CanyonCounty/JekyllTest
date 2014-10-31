JekyllTest
===========

Just testing out Jekyll. What works:

- posts (this was easy)
- current arrests page (a little work)
- fetch plugin (PITA, but works and should be easy to extend)
- USE `jekyll build --trace` makes figuring out what's wrong with your plugin **MUCH** easier

TODO:

- current Arrests could be drawn by JavaScript and just include the JSON data
- jail roster in a _data/jailRoster directory A.JSON, B.JSON... for the names
- combine jailRoster for search, we already have all the data, why hit the db?
- popup or other screen for larger picture/more information
