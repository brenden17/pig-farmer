
movies = LOAD '/input/movie/movies_data.csv' USING PigStorage(',') as (id:int, name:chararray, year:int, rating:double, duration:int);

valid_movies = filter movies by rating is not null;

grouped_movies = group valid_movies by year;
movies_by_year= foreach grouped_movies generate group, COUNT(valid_movies), AVG(valid_movies.rating);

dump movies_by_year;
