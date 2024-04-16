const hamburger = document.getElementById('hamburger');
const nav = document.getElementById('nav');


hamburger.addEventListener('click', () => {
    var isSelected = false;



    if(hamburger.classList.contains('selected')){
        isSelected = true;
    }else{
        isSelected = false;
    }

    if(isSelected){
        hamburger.classList.remove('selected');
        nav.classList.remove('hidden');
    }else
    {
        hamburger.classList.add('selected');
        nav.classList.add('hidden');
    }
});
    