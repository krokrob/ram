import React from 'react';
import { AsyncTypeahead } from 'react-bootstrap-typeahead';
import 'react-bootstrap-typeahead/css/Typeahead.css';
import MemoryMenuItem from './memory_menu_item';

const makeAndHandleRequest = (query) => {
  const url = `/api/v1/memories?query=${query}`;
  return fetch(url, { credentials: 'same-origin' })
    .then(response => response.json());
}

class Searchbar extends React.Component {
  state = {
    allowNew: false,
    isLoading: false,
    multiple: false,
    options: [],
  };

  render() {
    return (
      <div>
        <AsyncTypeahead
          {...this.state}
          labelKey='title'
          minLength={3}
          onSearch={this._handleSearch}
          onChange={(selected) => {
            window.location = selected[0].url;
          }}
          placeholder="Search for a memory"
          renderMenuItemChildren={(option, props) => (
            <MemoryMenuItem key={option.id} memory={option} />
          )}
        />
      </div>
    );
  }

  _handleSearch = (query) => {
    this.setState({isLoading: true});
    makeAndHandleRequest(query)
      .then((options) => {
        this.setState({
          isLoading: false,
          options,
        });
      });
  }
}

export default Searchbar;
