REGISTER 'util.py' USING jython as util

movies = LOAD '/input/movie/movies_with_duplicates.csv' USING PigStorage(',') as (id:int, name:chararray, year:int, rating:double, duration:int);

count_movie_name = FOREACH movies GENERATE util.get_length(name);

DUMP count_movie_name;
