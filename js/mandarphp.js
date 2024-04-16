$(document).ready(function() {
    $('#addNoticiaForm').submit(function(event) {
        // Evita el comportamiento predeterminado de enviar el formulario
        event.preventDefault();

        // Realiza una solicitud AJAX para enviar los datos del formulario
        $.ajax({
            type: 'POST',
            url: 'guardar_noticia.php',
            data: $('#addNoticiaForm').serialize(),
            success: function() {
                // Recarga la página
                location.reload();
            },
            error: function() {
                // Si hay un error en la solicitud AJAX, muestra un mensaje de error
                alert('Error al enviar los datos del formulario.');
            }
        });
    });
});