function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    const memoryAddress = document.getElementById('memory_address');

    if (memoryAddress) {
      const autocomplete = new google.maps.places.Autocomplete(memoryAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(memoryAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
