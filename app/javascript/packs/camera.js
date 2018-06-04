(function() {
  var width = screen.width;    // We will scale the photo width to this
  var height = 0;     // This will be computed based on the input stream

  var streaming = false;

  var video = null;
  var canvas = null;
  var photo = null;
  var startButton = null;
  var resetButton = null;

  function startup() {
    video = document.getElementById('video');
    canvas = document.getElementById('canvas');
    photo = document.getElementById('photo');
    startButton = document.getElementById('startbutton');
    resetButton = document.getElementById('resetbutton');

    navigator.mediaDevices.getUserMedia({
      video: { facingMode: "environment" },
      audio: false
    }).then(function(stream) {
        video.srcObject = stream;
        video.play();
      })
      .catch(function(err) {
        const camera = document.querySelector('.camera');
        camera.classList.add('hidden');
        const output = document.querySelector('.output');
        output.classList.add('hidden');
        const addPhotoButton = document.getElementById('add-photo-button');
        addPhotoButton.classList.remove('hidden');
      });
    video.addEventListener('canplay', function(ev){
      if (!streaming) {
        height = video.videoHeight / (video.videoWidth/width);

        video.setAttribute('width', width);
        video.setAttribute('height', height);
        canvas.setAttribute('width', width);
        canvas.setAttribute('height', height);
        streaming = true;
      }
    }, false);

    startButton.addEventListener('click', function(ev){
      takepicture();
      ev.preventDefault();
    }, false);

    resetButton.addEventListener('click', function(e) {
      clearphoto();

    });

    clearphoto();
  }

  function clearphoto() {
    const camera = document.querySelector('.camera');
    camera.classList.remove('hidden');
    document.getElementById('photo-box').classList.add('hidden');

    var context = canvas.getContext('2d');
    context.fillStyle = "#AAA";
    context.fillRect(0, 0, canvas.width, canvas.height);

    var data = canvas.toDataURL('image/png');
    photo.setAttribute('src', data);
  }

  function takepicture() {
    var context = canvas.getContext('2d');
    if (width && height) {
      const camera = document.querySelector('.camera');
      camera.classList.add('hidden');

      canvas.width = width;
      canvas.height = height;
      context.drawImage(video, 0, 0, width, height);

      var data = canvas.toDataURL('image/png');
      photo.setAttribute('src', data);
      document.getElementById('photo-box').classList.remove('hidden');
      const photoInput = document.getElementById('memory_photo');
      photoInput.value = data;
    } else {
      clearphoto();
    }
  }

  // flip camera
  // var front = false;
  // document.getElementById('flip-button').onclick = function() { front = !front; };
  // var constraints = { video: { facingMode: (front? "user" : "environment") } };

  window.addEventListener('DOMContentLoaded', () => startup());
})();
