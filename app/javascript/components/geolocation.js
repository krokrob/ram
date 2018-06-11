const geolocation = (success, error) => {
  navigator.geolocation.getCurrentPosition(success, error);
}
const bindNewMemoryGeolocation = () => {
  const addMemoryButton = document.getElementById('add-memory');
  if (addMemoryButton) {
    addMemoryButton.addEventListener('click', (e) =>  {
      e.preventDefault();
      const targetUrl = e.currentTarget.dataset.targetUrl;
      geolocation((position) => {
        window.location = `${targetUrl}?latitude=${position.coords.latitude}&longitude=${position.coords.longitude}`;
      }, (err) => {
        window.location = `${targetUrl}?position=false`;
      });
    });
  }
}

export { bindNewMemoryGeolocation };
