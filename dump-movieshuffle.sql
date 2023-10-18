--
-- Database: `movieshuffle`
--
CREATE DATABASE movieshuffle;
USE movieshuffle;

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id`, `name`) VALUES
(1, 'Action'),
(2, 'Science-fiction'),
(3, 'Aventure'),
(4, 'Drame'),
(5, 'Guerre'),
(6, 'Thriller'),
(7, 'Crime'),
(8, 'Comédie'),
(9, 'Western');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `image` varchar(250) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `releaseDate` date DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `video` varchar(100) DEFAULT NULL,
  `highlighted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `title`, `image`, `description`, `releaseDate`, `duration`, `video`, `highlighted`) VALUES
(1, 'Inception', 'https://www.themoviedb.org/t/p/w1280/aej3LRUga5rhgkmRP6XMFw3ejbl.jpg', 'Dom Cobb est un voleur expérimenté, le meilleur dans l\'art dangereux de l\'extraction, voler les secrets les plus intimes enfouis au plus profond du subconscient durant une phase de rêve, lorsque l\'esprit est le plus vulnérable. Les capacités de Cobb ont fait des envieux dans le monde tourmenté de l\'espionnage industriel alors qu\'il devient fugitif en perdant tout ce qu\'il a un jour aimé. Une chance de se racheter lui est alors offerte. Une ultime mission grâce à laquelle il pourrait retrouver sa vie passée mais uniquement s\'il parvient à accomplir l\'impossible inception.', '2010-07-21', 148, 'https://www.youtube.com/embed/5BW_1D5byw8', 0),
(2, 'Interstellar', 'https://www.themoviedb.org/t/p/w1280/1pnigkWWy8W032o9TKDneBa3eVK.jpg', 'Dans un futur proche, face à une Terre exsangue, un groupe d\'explorateurs utilise un vaisseau interstellaire pour franchir un trou de ver permettant de parcourir des distances jusque-là infranchissables. Leur but : trouver un nouveau foyer pour l\'humanité.', '2014-11-07', 169, 'https://www.youtube.com/embed/eIWs2IUr3Vs', 0),
(3, 'Matrix', 'https://www.themoviedb.org/t/p/w1280/pEoqbqtLc4CcwDUDqxmEDSWpWTZ.jpg', 'Programmeur anonyme dans un service administratif le jour, Thomas Anderson devient Neo la nuit venue. Sous ce pseudonyme, il est l\'un des pirates les plus recherchés du cyber-espace. À cheval entre deux mondes, Neo est assailli par d\'étranges songes et des messages cryptés provenant d\'un certain Morpheus. Celui-ci l\'exhorte à aller au-delà des apparences et à trouver la réponse à la question qui hante constamment ses pensées : qu\'est-ce que la Matrice ? Nul ne le sait, et aucun homme n\'est encore parvenu à en percer les défenses. Mais Morpheus est persuadé que Neo est l’Élu, le libérateur mythique de l\'humanité annoncé selon la prophétie. Ensemble, ils se lancent dans une lutte sans retour contre la Matrice et ses terribles agents...', '1999-03-30', 135, 'https://www.youtube.com/embed/wV-Q0o2OQjQ', 0),
(4, 'La Liste de Schindler', 'https://www.themoviedb.org/t/p/w1280/vHgf8NE7tXV4DJPEnqVLZDof8fT.jpg', 'Évocation des années de guerre d\'Oskar Schindler, fils d\'industriel d\'origine autrichienne rentré à Cracovie en 1939 avec les troupes allemandes. Il va, tout au long de la guerre, protéger des juifs en les faisant travailler dans sa fabrique et en 1944 sauver 800 hommes et 300 femmes du camp d\'extermination d\'Auschwitz-Birkenau.', '1994-02-04', 195, 'https://www.youtube.com/embed/sXsr_7Una_A', 0),
(5, 'Pulp Fiction', 'https://www.themoviedb.org/t/p/w1280/4TBdF7nFw2aKNM0gPOlDNq3v3se.jpg', 'L\'odyssée sanglante et burlesque de petits malfrats dans la jungle d\'Hollywood : deux petits tueurs, un dangereux gangster marié à une camée, un boxeur roublard, des prêteurs sur gages sadiques, un caïd élégant et dévoué, un dealer bon mari et de deux tourtereaux à la gâchette facile.', '1994-09-10', 154, 'https://www.youtube.com/embed/_cfMFdsJytA', 0),
(6, 'The Dark Knight', 'https://www.themoviedb.org/t/p/w1280/pyNXnq8QBWoK3b37RS6C3axwUOy.jpg', 'Dans ce nouveau volet, Batman augmente les mises dans sa guerre contre le crime. Avec l\'appui du lieutenant de police Jim Gordon et du procureur de Gotham, Harvey Dent, Batman vise à éradiquer le crime organisé qui pullule dans la ville. Leur association est très efficace mais elle sera bientôt bouleversée par le chaos déclenché par un criminel extraordinaire que les citoyens de Gotham connaissent sous le nom de Joker.', '2008-07-18', 147, 'https://www.youtube.com/embed/nDRCOf-o8VY', 0),
(7, 'Le Parrain', 'https://www.themoviedb.org/t/p/w1280/wnDNKCeBQzioXYQrXcSyrmRHVxf.jpg', 'En 1945, à New York, les Corleone sont une des cinq familles de la mafia. Don Vito Corleone, \"parrain\" de cette famille, marie sa fille à un bookmaker. Sollozzo, \" parrain \" de la famille Tattaglia, propose à Don Vito une association dans le trafic de drogue, mais celui-ci refuse. Sonny, un de ses fils, y est quant à lui favorable. Afin de traiter avec Sonny, Sollozzo tente de faire tuer Don Vito, mais celui-ci en réchappe. Michael, le frère cadet de Sonny, recherche alors les commanditaires de l\'attentat et tue Sollozzo et le chef de la police, en représailles. Michael part alors en Sicile, où il épouse Apollonia, mais celle-ci est assassinée à sa place. De retour à New York, Michael épouse Kay Adams et se prépare à devenir le successeur de son père...', '1972-03-15', 177, 'https://www.youtube.com/embed/nDRCOf-o8VY', 0),
(8, 'Forrest Gump', 'https://www.themoviedb.org/t/p/w1280/A0Th0x8QIzP0njrFAJnYQ5ouIoB.jpg', 'Forrest Gump est le symbole d\'une époque, un candide dans une Amérique qui a perdu son innocence. Merveilleusement interprété par Tom Hanks, Forrest vit une série d\'aventures, de l\'état d\'handicapé physique à celui de star du football, de héros du Vietnam au roi de la crevette, des honneurs de la Maison Blanche au bonheur d\'une grande histoire d\'amour. Son cœur dépasse les limites de son Q.I.', '1994-07-06', 142, 'https://www.youtube.com/embed/nDRCOf-o8VY', 0),
(9, 'Fight Club', 'https://www.themoviedb.org/t/p/w1280/jSziioSwPVrOy9Yow3XhWIBDjq1.jpg', 'Le narrateur, sans identité précise, vit seul, travaille seul, dort seul, mange seul ses plateaux-repas pour une personne comme beaucoup d’autres personnes seules qui connaissent la misère humaine, morale et sexuelle. C’est pourquoi il va devenir membre du Fight club, un lieu clandestin où il va pouvoir retrouver sa virilité, l’échange et la communication. Ce club est dirigé par Tyler Durden, une sorte d’anarchiste entre gourou et philosophe qui prêche l’amour de son prochain.', '1999-10-15', 139, 'https://www.youtube.com/embed/nDRCOf-o8VY', 0),
(10, 'Le Silence des agneaux', 'https://www.themoviedb.org/t/p/w1280/mGLHYHHMmkzbXd5oDeWJKHjL9cn.jpg', 'Un psychopathe connu sous le nom de Buffalo Bill sème la terreur dans le Middle West en kidnappant et en assassinant de jeunes femmes. Clarice Starling, une jeune agent du FBI, est chargée d\'interroger l\'ex-psychiatre Hannibal Lecter. Psychopathe redoutablement intelligent et porté sur le cannibalisme, Lecter est capable de lui fournir des informations concernant Buffalo Bill ainsi que son portrait psychologique. Mais il n\'accepte de l\'aider qu\'en échange d\'informations sur la vie privée de la jeune femme. Entre eux s\'établit un lien de fascination et de répulsion.', '1991-02-14', 118, 'https://www.youtube.com/embed/nDRCOf-o8VY', 0),
(11, 'Django Unchained', 'https://www.themoviedb.org/t/p/w1280/hodO0759IB5LbzUiiLKB50gT2UO.jpg', 'Dans le sud des États-Unis, deux ans avant la guerre de Sécession, le Dr King Schultz, un chasseur de primes allemand, fait l’acquisition de Django, un esclave qui peut l’aider à traquer les frères Brittle, les meurtriers qu’il recherche. Schultz promet à Django de lui rendre sa liberté lorsqu’il aura capturé les Brittle – morts ou vifs. Alors que les deux hommes pistent les dangereux criminels, Django n’oublie pas que son seul but est de retrouver Broomhilda, sa femme, dont il fut séparé à cause du commerce des esclaves… Lorsque Django et Schultz arrivent dans l’immense plantation du puissant Calvin Candie, ils éveillent les soupçons de Stephen, un esclave qui sert Candie et a toute sa confiance. Le moindre de leurs mouvements est désormais épié par une dangereuse organisation de plus en plus proche… Si Django et Schultz veulent espérer s’enfuir avec Broomhilda, ils vont devoir choisir entre l’indépendance et la solidarité, entre le sacrifice et la survie…', '2012-12-25', 165, 'https://www.youtube.com/embed/nDRCOf-o8VY', 0),
(12, 'Seven', 'https://www.themoviedb.org/t/p/w1280/c6cPPttk4Pirbd0ywCVawW8Z6vc.jpg', 'Pour conclure sa carrière, l\'inspecteur Somerset, vieux flic blasé, tombe à sept jours de la retraite sur un criminel peu ordinaire. John Doe, c\'est ainsi que se fait appeler l\'assassin, a décidé de nettoyer la société des maux qui la rongent en commettant sept meurtres basés sur les sept péchés capitaux : la gourmandise, l\'avarice, la paresse, l\'orgueil, la luxure, l\'envie et la colère.', '1995-09-22', 130, 'https://www.youtube.com/embed/nDRCOf-o8VY', 0),
(13, 'Joker', 'https://www.themoviedb.org/t/p/w1280/zDyT3gIeae39UgL9P6jL5Zc3zyt.jpg', 'Dans les années 1980, à Gotham City, Arthur Fleck, un humoriste de stand-up raté, bascule dans la folie et devient le Joker.', '2019-10-04', 122, 'https://www.youtube.com/embed/nDRCOf-o8VY', 0),
(14, 'Retour vers le futur', 'https://www.themoviedb.org/t/p/w1280/y9bs2N5rEM51YBXbU7N5PaXJc6W.jpg', '1985. Le jeune Marty McFly mène une existence anonyme auprès de sa petite amie Jennifer, seulement troublée par sa famille en crise et un proviseur qui serait ravi de l\'expulser du lycée. Ami de l\'excentrique professeur Emmett Brown, il l\'accompagne un soir tester sa nouvelle expérience : le voyage dans le temps via une DeLorean modifiée. La démonstration tourne mal : des trafiquants d\'armes débarquent et assassinent le scientifique. Marty se réfugie dans la voiture et se retrouve transporté en 1955. Là, il empêche malgré lui la rencontre de ses parents, et doit tout faire pour les remettre ensemble, sous peine de ne pouvoir exister...', '1985-07-03', 116, 'https://www.youtube.com/embed/nDRCOf-o8VY', 0),
(15, 'Gladiator', 'https://www.themoviedb.org/t/p/w1280/bNOyVfXmWq0kLrZ1tsiq26cf0jq.jpg', 'Le général romain Maximus est le plus fidèle soutien de l\'empereur Marc Aurèle, qu\'il a conduit de victoire en victoire avec une bravoure et un dévouement exemplaires. Jaloux du prestige de Maximus, et plus encore de l\'amour que lui voue l\'empereur, le fils de Marc Aurèle, Commode, s\'arroge brutalement le pouvoir, puis ordonne l\'arrestation du général et son exécution. Maximus échappe à ses assassins mais ne peut empêcher le massacre de sa famille. Capturé par un marchand d\'esclaves, il devient gladiateur et prépare sa vengeance.', '2000-05-01', 155, 'https://www.youtube.com/embed/nDRCOf-o8VY', 0),
(16, 'Matrix Reloaded', 'https://www.themoviedb.org/t/p/w1280/4ZVnFZUjahpLz7B42mkVjtEl9Wl.jpg', 'Neo apprend à mieux contrôler ses dons naturels, alors même que Sion s\'apprête à tomber sous l\'assaut de l\'Armée des Machines. D\'ici quelques heures, 250 000 Sentinelles programmées pour anéantir notre espèce envahiront la dernière enclave humaine de la Terre. Mais Morpheus galvanise les citoyens de Sion en leur rappelant la Parole de l\'Oracle : il est encore temps pour l’Élu d\'arrêter la guerre contre les Machines. Tous les espoirs se reportent dès lors sur Neo. Au long de sa périlleuse plongée au sein de la Matrix et de sa propre destinée, ce dernier sera confronté à une résistance croissante, une vérité encore plus aveuglante, un choix encore plus douloureux que tout ce qu\'il avait jamais imaginé.', '2003-05-15', 138, 'https://www.youtube.com/embed/0ha2XYVC7_s', 0),
(17, 'Matrix Revolutions', 'https://www.themoviedb.org/t/p/w1280/xOCeckuZDzqydvt3vLlzftZkef1.jpg', 'La longue quête de liberté des rebelles culmine en une bataille finale explosive. Tandis que l\'armée des Machines sème la désolation sur Sion, ses citoyens organisent une défense acharnée. Mais pourront-ils retenir les nuées implacables des Sentinelles en attendant que Neo s\'approprie l\'ensemble de ses pouvoirs et mette fin à la guerre ? L\'agent Smith est quant à lui parvenu à prendre possession de l\'esprit de Bane, l\'un des membres de l\'équipage de l\'aéroglisseur. De plus en plus puissant, il est désormais incontrôlable et n\'obéit plus aux Machines : il menace de détruire leur empire ainsi que le monde réel et la Matrice...', '2003-11-05', 128, 'https://www.youtube.com/embed/sK51m1tj_bE', 0);

-- --------------------------------------------------------

--
-- Table structure for table `movies_genres`
--

CREATE TABLE `movies_genres` (
  `movie_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movies_genres`
--

INSERT INTO `movies_genres` (`movie_id`, `genre_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 2),
(2, 3),
(2, 4),
(3, 1),
(3, 2),
(4, 4),
(4, 5),
(5, 6),
(6, 1),
(6, 6),
(7, 4),
(7, 7),
(8, 4),
(8, 8),
(9, 4),
(10, 4),
(10, 6),
(11, 4),
(11, 9),
(12, 6),
(12, 7),
(13, 6),
(13, 7),
(14, 4),
(14, 8),
(15, 1),
(15, 4),
(16, 1),
(16, 2),
(17, 1),
(17, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movies_genres`
--
ALTER TABLE `movies_genres`
  ADD PRIMARY KEY (`movie_id`,`genre_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `movies_genres`
--
ALTER TABLE `movies_genres`
  ADD CONSTRAINT `movies_genres_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`);
COMMIT;

ALTER TABLE `movies_genres`
  ADD CONSTRAINT `movies_genres_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
