<?php
function convertMovieDuration($duration)
{
    // floor permet de faire un arrondi à l'entier inférieur
    $hours = floor($duration / 60);
    $minutes = $duration % 60;
    return "{$hours}h {$minutes}min";
}

$db = new PDO('mysql:host=localhost;dbname=movieshuffle;charset=UTF8', 'root', '');

$find = false;
$data = array("title" => "Film introuvable");
if (isset($_GET["id"])) {
    $id = $_GET['id'];
    $query = $db->prepare('SELECT m.*, GROUP_CONCAT(g.name) AS listGenres 
                        FROM movies AS m
                        INNER JOIN movies_genres AS mg ON m.id = mg.movie_id
                        INNER JOIN genres AS g ON mg.genre_id = g.id
                        WHERE m.id = :id
                        GROUP BY m.id');
    $query->bindParam(':id', $id, PDO::PARAM_INT);
    $query->execute();
    $movie = $query->fetch(); // Retourne un tableau ou false
    
    if ($movie) {
        $find = true;

        $movie["poster"] = str_replace(" ", "-", strtolower($movie["title"]));
        $movie["duration"] = convertMovieDuration($movie["duration"]);
        $movie["releaseDate"] = new DateTime($movie["releaseDate"]);
        $movie["genres"] = explode(",", $movie["listGenres"]);

        $data = $movie;
    }
}
$data["headerTitle"] = "{$data["title"]} - MovieShuffle";
include("templates/header.php");
?>

    <main>
        <div class="container">
            <?php
            if ($find) {
            ?>
                <div class="movie-wrapper flex-container">
                    <div class="movie-left-wrapper">
                        <img src="<?= $movie["image"] ?>" alt="">
                    </div>
                    <div class="movie-right-wrapper">
                        <span class="movie-year"><?= $data["releaseDate"]->format('Y') ?></span>
                        <h1><?= $data["title"] ?></h1>
                        <p><?= $data["description"] ?></p>
                        <ul>
                            <?php
                            foreach ($data["genres"] as $genre) {
                            ?>
                                <li class="movie-genre"><?= $genre ?></li>
                            <?php
                            }
                            ?>
                        </ul>
                        <div class="movie-infos">
                            <span><?= $data["duration"] ?></span> - <span><?= $data["releaseDate"]->format('d/m/Y') ?></span>
                        </div>
                        <a class="btn btn-light" href="<?= $data["video"] ?>">Bande annonce</a>
                    </div>
                </div>
            </div>
        <?php
        } else {
        ?>
            <h1><?= $data["title"] ?></h1>
        <?php
        }
        ?>
    </div>
    </div>
</main>
<?php
include("templates/footer.php");
?>
