REGISTER 'util.py' USING jython as util

movies = LOAD '/input/movie/movies_with_duplicates.csv' USING PigStorage(',') as (id:int, name:chararray, year:int, rating:double, duration:int);

B = FOREACH movies GENERATE util.get_length(name);

DUMP B;
