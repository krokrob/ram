const geolocation = (callback) => {
  navigator.geolocation.getCurrentPosition(callback);
}
const initGeolocation = () => {
  if ("geolocation" in navigator) {
    return true;
  } else {
    return false;
  }
}
const bindNewMemoryGeolocation = () => {
  const addMemoryButton = document.getElementById('add-memory');
  if (addMemoryButton) {
    addMemoryButton.addEventListener('click', (e) =>  {
      e.preventDefault();
      const targetUrl = e.currentTarget.dataset.targetUrl;
      geolocation((position) => {
        window.location = `${targetUrl}?latitude=${position.coords.latitude}&longitude=${position.coords.longitude}`;
      });
    });
  }
}

export { bindNewMemoryGeolocation, initGeolocation };
