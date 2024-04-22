$(document).ready(function(){
    var skins = [
        {name: "AK-47 | Vulcan", image: "skins/ak47.png"},
        {name: "AWP | Dragon Lore", image: "skins/awp.png"},
        {name: "M4A4 | Howl", image: "skins/m4a4.png"},
        {name: "SCAR-20 | Sand Mesh", image: "skins/scar20.png"},
        {name: "Nova | Walnut", image: "skins/nova.png"},
        {name: "UMP-45 | Scorched", image: "skins/ump.png"},
        {name: "MP7 | Army Recon", image: "skins/mp7.png"},
        {name: "AWP | Asiimov", image: "skins/awp_asiimov.png"},
        {name: "AK-47 | Redline", image: "skins/ak47_redline.png"},
        {name: "M4A4 | Desolate Space", image: "skins/m4a4_desolate_space.png"}
        // Agrega más objetos con el nombre y la imagen correspondiente según sea necesario
    ];

    var loadout = $("#loadout"),
        insert_times = 30,
        duration_time = 10000;

    // Función para seleccionar un número aleatorio dentro de un rango
    function randomEx(min,max) {
        return Math.floor(Math.random() * (max - min + 1) + min);
    }

    // Función para realizar la animación y seleccionar al ganador
    $("#roll").click(function(){
        $("#roll").attr("disabled", true);
        var scrollsize = 0,
            diff = 0;
        $(loadout).html("");
        $("#log").html("");
        loadout.css("left","100%");
        
        // Clonar y barajar el array de skins
        var shuffledSkins = skins.slice(); // Copia el array original
        shuffledSkins.sort(function() { return 0.5 - Math.random() }); // Baraja el array

        // Determinar el número de inserciones y duración del tiempo de animación
        insert_times = shuffledSkins.length < 10 ? 20 : 10; 
        duration_time = shuffledSkins.length < 10 ? 5000 : 10000;

        // Generar todos los cuadros de una vez
        for (var i = 0; i < shuffledSkins.length * insert_times; i++) {
            var index = i % shuffledSkins.length;
            // Agregar el nombre del arma y la imagen correspondiente dentro del cuadro del arma
            loadout.append('<td><div class="skin-container" style="position: relative;"><img src="' + shuffledSkins[index].image + '" alt="' + shuffledSkins[index].name + '" class="skin-image" style="width: 150px;"><div class="skin-name" style="position: absolute; bottom: 0; left: 0; right: 0; background-color: rgba(0, 0, 0, 0.7); color: white; padding: 5px;">' + shuffledSkins[index].name + '</div></div></td>');
            scrollsize = scrollsize + 192;
        }
        
        diff = Math.round(scrollsize / 2);
        diff = randomEx(diff - 300, diff + 300);

        $( "#loadout" ).animate({
            left: "-="+diff
        }, duration_time, function() {
            $("#roll").attr("disabled", false);
            var center = window.innerWidth / 2;
            var winnerFound = false;
            $('#loadout').children('td').each(function () {
                if(!winnerFound){
                    var leftOffset = $(this).offset().left;
                    var rightOffset = leftOffset + $(this).width();
                    if(leftOffset < center && rightOffset > center){
                        var text = $(this).find('.skin-name').text();
                        $("#log").append("THE WINNER IS<br/> <span class=\"badge\">"+text+"</span>");
                        winnerFound = true;
                    }
                }
            });
        });
    });
});
