<?php
$db = new PDO('mysql:host=localhost;dbname=movieshuffle;charset=UTF8', 'root', '');

$find = false;
$length = 0;
$limit = 5;
if (isset($_GET["q"])) {
    $find = true;

    $page = isset($_GET["page"]) && !empty($_GET["page"]) ? $_GET["page"] : 1;
    $start = ($page - 1) * $limit;

    $searchString = $_GET['q'];
    $query = $db->prepare("SELECT m.*, GROUP_CONCAT(g.name) AS listGenres 
                        FROM movies AS m
                        INNER JOIN movies_genres AS mg ON m.id = mg.movie_id
                        INNER JOIN genres AS g ON mg.genre_id = g.id
                        WHERE m.title LIKE :title
                        GROUP BY m.id
                        LIMIT " . $start . ", " . $limit . "");
    // Possibilité de rechercher sur les titres films mais aussi sur les genres par exemple
    // $query = $db->prepare("SELECT m.*, GROUP_CONCAT(g.name) AS listGenres FROM movies AS m
    //                     INNER JOIN movies_genres AS mg ON m.id = mg.movie_id
    //                     INNER JOIN genres AS g ON mg.genre_id = g.id
    //                     WHERE m.title LIKE :title
    //                     OR g.name LIKE :title
    //                     GROUP BY m.id
    //                     LIMIT " . $start . ", " . $limit . "");
    $query->bindValue(':title', "%{$searchString}%");
    $query->execute();
    $movies = $query->fetchAll();

    $query = $db->prepare("SELECT COUNT(*) FROM movies
                        WHERE title LIKE :title");
    $query->bindValue(':title', "%{$searchString}%");
    $query->execute();
    $length = $query->fetch();
    if ($length) {
        $length = $length[0];
    }
}

$data["headerTitle"] = "Recherche {$searchString} - MovieShuffle";
include('./templates/header.php');
?>

<main>
    <div class="search container">
        <h1><?= $length ?> <?= $length > 1 ? "films" : "film" ?> pour votre recherche</h1>
        <?php
        if ($find) {
        ?>
            <div class="items">
                <?php
                foreach ($movies as $movie) {
                    $movie["genres"] = explode(",", $movie["listGenres"]);
                    $description = $movie["description"];
                    if (strlen($description) > 200) {
                        $description = wordwrap($description, 200);
                        $description = substr($description, 0, strpos($description, "\n"));
                        $description .= "...";
                    }
                ?>
                    <div class="item">
                        <a href="movie.php?id=<?= $movie["id"] ?>">
                            <img src="<?= $movie["image"] ?>" alt="">
                        </a>
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
                            <p><?= $description ?></p>
                        </div>
                    </div>
                <?php
                }
                ?>
            </div>
            <?php
            if ($length > $limit) {
                $pages = ceil($length / $limit);
                // J'ai une recherche qui me retourne 55 résultats
                // Je divise par 10 pour obtenir le nombre de pages
                // Ce qui me donne 5.5 or je ne peux pas avoir des demies pages
                // D'où la présence de la fonction ceil qui permet d'arrondir à l'entier supérieur
                // Dans notre exemple on obtiendra donc la valeur 6 pour 6 pages de résultats
            ?>
                <ul class="pagination">
                    <?php
                    for ($i = 1; $i <= $pages; $i++) {
                    ?>
                        <li class="pagination-item <?= $i == $page ? "active" : "" ?>">
                            <a rel="nofollow" href="search.php?q=<?= $searchString ?>&page=<?= $i ?>"><?= $i ?></a>
                        </li>
                    <?php
                    }
                    ?>
                </ul>
        <?php
            }
        }
        ?>
    </div>
</main>
</body>

</html>