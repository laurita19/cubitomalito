 // JavaScript para mostrar y ocultar el modal de añadir noticia
 const modalAddNoticia = document.getElementById('modalAddNoticia');
 const openAddNoticiaModal = document.getElementById('openAddNoticiaModal');
 const closeAddNoticiaModal = document.getElementById('closeAddNoticiaModal');

 openAddNoticiaModal.addEventListener('click', () => {
     modalAddNoticia.classList.remove('hidden');
 });

 closeAddNoticiaModal.addEventListener('click', () => {
     modalAddNoticia.classList.add('hidden');
 });
 