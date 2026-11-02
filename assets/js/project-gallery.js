document.querySelectorAll('.project-gallery').forEach((gallery) => {
  const dialog = gallery.nextElementSibling;
  if (!(dialog instanceof HTMLDialogElement)) return;
  const image = dialog.querySelector('img');
  const caption = dialog.querySelector('figcaption');
  let opener;

  gallery.addEventListener('click', (event) => {
    const link = event.target.closest('a');
    if (!link || event.button !== 0 || event.metaKey || event.ctrlKey || event.shiftKey || event.altKey) return;
    event.preventDefault();
    opener = link;
    image.src = link.href;
    image.alt = link.querySelector('img').alt;
    caption.textContent = image.alt;
    dialog.showModal();
  });

  dialog.querySelector('button').addEventListener('click', () => dialog.close());
  dialog.addEventListener('click', (event) => {
    if (event.target === dialog) dialog.close();
  });
  dialog.addEventListener('close', () => {
    image.removeAttribute('src');
    opener?.focus();
  });
});
