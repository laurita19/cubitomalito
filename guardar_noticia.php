<?php
// Verifica si se han enviado los datos del formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtén los valores del formulario
    $titulo = $_POST["titulo"];
    $contenido = $_POST["contenido"];
    $imagen = $_FILES["imagen"]; // Utiliza $_FILES para acceder a la información del archivo

    // Renombra la imagen con el título de la noticia
    $imagenNombreOriginal = $imagen["name"];
    $extension = pathinfo($imagenNombreOriginal, PATHINFO_EXTENSION); // Obtiene la extensión del archivo
    $imagenNombreNuevo = str_replace(" ", "_", $titulo) . "." . $extension; // Reemplaza los espacios en blanco por guiones bajos y agrega la extensión

    // Ruta donde se guardará la imagen
    $directorioDestino = "imagenesnoticias/";

    // Guarda la imagen en el directorio destino con el nuevo nombre
    if (move_uploaded_file($imagen["tmp_name"], $directorioDestino . $imagenNombreNuevo)) {
        // La imagen se ha subido correctamente

        // Crea un objeto DOMDocument para cargar el archivo XML
        $xml = new DOMDocument();
        $xml->load('noticias.xml');

        // Crea el elemento <noticia> y sus hijos
        $noticia = $xml->createElement("noticia");

        $tituloElem = $xml->createElement("titulo", $titulo);
        $contenidoElem = $xml->createElement("descripcion", $contenido);
        $imagenElem = $xml->createElement("imagen", $directorioDestino . $imagenNombreNuevo); // Utiliza la ruta completa de la imagen

        // Agrega los hijos al elemento <noticia>
        $noticia->appendChild($tituloElem);
        $noticia->appendChild($contenidoElem);
        $noticia->appendChild($imagenElem);

        // Obtiene el elemento raíz <noticias>
        $noticias = $xml->getElementsByTagName("noticias")->item(0);

        // Agrega la nueva noticia al elemento raíz
        $noticias->appendChild($noticia);

        // Guarda el archivo XML
        $xml->save('noticias.xml');

        // Devuelve un código de estado HTTP 200 para indicar éxito
        header("Location: noticias.xml");
    } else {
        // Error al subir la imagen
        echo "Error al subir la imagen.";
    }
}
?>
