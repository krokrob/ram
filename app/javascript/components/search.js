import React from 'react';
import ReactDOM from 'react-dom';
import Searchbar from './search/searchbar';

const searchbar = document.getElementById('searchbar');
if (searchbar) {
  ReactDOM.render(<Searchbar />, searchbar);
}

function bindSearchButtonClick() {
  const searchButton = document.getElementById("search-button");
  if (searchButton) {
    searchButton.addEventListener('click', () => {
      const searchBar = document.getElementById('searchbar');
      searchBar.classList.toggle('visible-input');
      searchbar.querySelector('input').focus();
      document.querySelector('.navbar-wagon-brand').classList.toggle('hidden');
      document.querySelector('.navbar-wagon-link').classList.toggle('hidden');
    });
  }
}

export { bindSearchButtonClick };
