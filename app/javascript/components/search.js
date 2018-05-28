function bindSearchButtonClick() {
  const searchButton = document.getElementById("search-button");
  if (searchButton) {
    searchButton.addEventListener('click', () => {
      const searchInput = document.getElementById('search-input');
      searchInput.classList.add('visible-input');
      searchInput.focus();
      document.querySelector('.navbar-wagon-brand').classList.add('hidden');
      document.querySelector('.navbar-wagon-link').classList.add('hidden');
    });
  }
}

export { bindSearchButtonClick };
