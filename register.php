<?php
// Iniciar la sesión
session_start();

// Verificar si se han enviado datos del formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtener los valores del formulario
    $nombre = $_POST['nombre'];
    $apellido = $_POST['apellido'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $confirmPassword = $_POST['confirmPassword'];

    // Validar que las contraseñas coincidan
    if ($password !== $confirmPassword) {
        echo "<script>alert('Las contraseñas no coinciden. Por favor, inténtalo de nuevo.');</script>";
    } else {
        // Cargar el archivo XML
        $xml = simplexml_load_file('usuarios.xml');

        // Verificar si el usuario ya existe en el archivo XML
        foreach ($xml->children() as $user) {
            if ($user->email == $email) {
                echo "<script>alert('El correo electrónico ya está registrado. Por favor, utiliza otro correo electrónico.');</script>";
                exit;
            }
        }

        // Crear un nuevo usuario
        $newUser = $xml->addChild('usuario');
        $newUser->addChild('nombre', $nombre);
        $newUser->addChild('apellido', $apellido);
        $newUser->addChild('email', $email);
        $newUser->addChild('password', $password);

        // Guardar los cambios en el archivo XML
        $xml->asXML('usuarios.xml');
    }
}
?>
