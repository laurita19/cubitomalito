const contenedorCarrusel = document.getElementById('contenedorCarrusel');
const carruselNext = document.getElementById('carruselNext');
const carruselPrev = document.getElementById('carruselBefore');

let carruselIndex = 0;
const carruselLength = contenedorCarrusel.children[0].children.length;

carruselNext.addEventListener('click', () => {
    contenedorCarrusel.children[0].children[carruselIndex].children[0].classList.add('hidden');
    carruselIndex++;
    if (carruselIndex >= carruselLength) {
        carruselIndex = 0;
    }
    var carruselSeleccionado = contenedorCarrusel.children[0].children[carruselIndex].children[0];
    carruselSeleccionado.classList.remove('hidden');
    console.log(carruselSeleccionado);
}
);

carruselPrev.addEventListener('click', () => {
    contenedorCarrusel.children[0].children[carruselIndex].children[0].classList.add('hidden');
    carruselIndex--;
    if (carruselIndex < 0) {
        carruselIndex = carruselLength - 1;
    }
    var carruselSeleccionado = contenedorCarrusel.children[0].children[carruselIndex].children[0];
    carruselSeleccionado.classList.remove('hidden');
    console.log(carruselSeleccionado);
});