const searchIcon = document.querySelector(".nav-search-icon");
const searchInput = document.querySelector(".nav-search-input");

searchIcon.addEventListener("click", () => {
    searchInput.classList.toggle("visible");
});

searchInput.addEventListener("keyup", e => {
    // Le code 13 représente la touche Entrée
    if (e.keyCode === 13) {
      // Annuler le potentiel comportement par défaut
      e.preventDefault();
      // Envoi de l'utilisateur vers la page de recherche avec le paramètre GET
      document.location.href=`./search.php?q=${e.target.value}`;
    }
});