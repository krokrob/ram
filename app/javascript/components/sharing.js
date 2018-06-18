const shareLinks = document.querySelectorAll('.share-popover a');

if (shareLinks) {
  shareLinks.forEach('click', (event) => {
    const sharingForm = document.getElementById('new_sharing_form');
    const sharingFormData = new FormData(sharingForm);
    const createSharingUrl = sharingForm.attributes(action);
    fetch(createSharingUrl, type: 'post', data: sharingFormData, { credentials: 'same-origin' });
  });
}
