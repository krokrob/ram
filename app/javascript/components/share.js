const share = (e) => {
  if (navigator.share) {
    navigator.share({
      title: e.currentTarget.dataset.title,
      text: e.currentTarget.dataset.text,
      url: e.currentTarget.dataset.url
    })
    .then(() => console.log('Successful share'))
    .catch((error) => console.log('Error sharing', error));
  }
  else {
    // copy url to clipboard
  }
}

const bindShareButtonClick = () => {
  const shareButton = document.querySelector('.card-share');
  if (shareButton) {
    shareButton.addEventListener('click', share);
  }
}

export { bindShareButtonClick };
