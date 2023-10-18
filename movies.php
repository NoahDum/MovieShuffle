<?php
// POC API en PHP
$db = new PDO('mysql:host=localhost;dbname=movieshuffle;charset=UTF8', 'root', '');

$query = $db->query("SELECT m.*, GROUP_CONCAT(g.name) AS listGenres FROM movies AS m
                    INNER JOIN movies_genres AS mg ON m.id = mg.movie_id
                    INNER JOIN genres AS g ON mg.genre_id = g.id
                    GROUP BY m.id
                    ORDER BY m.id DESC 
                    LIMIT 0, 10");
$movies = $query->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($movies);
?>