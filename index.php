<?php
$db = new PDO('mysql:host=localhost;dbname=movieshuffle;charset=UTF8', 'root', '');

$query = $db->query("SELECT m.*, GROUP_CONCAT(g.name) AS listGenres 
                    FROM movies AS m
                    INNER JOIN movies_genres AS mg ON m.id = mg.movie_id
                    INNER JOIN genres AS g ON mg.genre_id = g.id
                    GROUP BY m.id
                    ORDER BY m.id DESC 
                    LIMIT 0, 10");
$movies = $query->fetchAll(PDO::FETCH_ASSOC);
// Recommandé par la fédération française des opthalmos...
// echo '<pre>' , var_dump($movies) , '</pre>';

$data = array("headerTitle" => "MovieShuffle");
include("templates/header.php");
?>
<main>
    <div class="container">
        <div class="movies flex-container">
            <?php
            foreach ($movies as $movie) {
                $movie["genres"] = explode(",", $movie["listGenres"]);
            ?>
                <div class="movie">
                    <img src="<?= $movie["image"] ?>" alt="">
                    <div class="movie-details">
                        <h3>
                            <a href="movie.php?id=<?= $movie["id"] ?>"><?= $movie["title"] ?></a>
                        </h3>
                        <ul>
                            <?php
                            foreach ($movie["genres"] as $genre) {
                            ?>
                                <li class="movie-genre"><?= $genre ?></li>
                            <?php
                            }
                            ?>
                        </ul>
                    </div>
                </div>
            <?php
            }
            ?>
        </div>
    </div>
</main>

<?php
include("templates/footer.php");
?>