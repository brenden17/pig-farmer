REGISTER 'util.py' USING jython as util

raw_movies = LOAD '/input/movie/movies_data.csv' USING PigStorage(',') as (id:int, name:chararray, year:int, rating:double, duration:int);

movies = filter raw_movies by rating is not null;

movies = foreach movies generate util.shorten_name(name) as name, year, rating, duration;

distincted_movies = group movies by (year, name);
grouped_movies = foreach distincted_movies generate flatten(group), AVG(movies.rating) as rating;

year_movies = group grouped_movies by year;

year_top5_movies = foreach year_movies {
    top5_movies = limit grouped_movies 5;
    generate group, flatten(top5_movies);
};

dump year_top5_movies;
