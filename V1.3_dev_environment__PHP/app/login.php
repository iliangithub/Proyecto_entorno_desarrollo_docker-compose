<?php
session_start();

$host = 'mysql-db-entorno-desarrollo-v1';  // Usamos el nombre del contenedor de la base de datos, este está en el docker-compose.yml
$dbname = 'entorno_desarrollo_esquema_bd';
$username = 'user';
$password = 'password';

$conexion = mysqli_connect($host, $username, $password, $dbname);

if (!$conexion) {
    die("Error al conectar con la base de datos: " . mysqli_connect_error());
}

if (isset($_POST['iniciosesion'])) {
    if (!empty($_POST['username']) && !empty($_POST['password'])) {
        $usuario = $_POST['username'];
        $contrasena = $_POST['password'];

        $consulta = "SELECT * FROM users WHERE username = '$usuario' AND password = '$contrasena'";
        $resultado = mysqli_query($conexion, $consulta);

        if (mysqli_num_rows($resultado) > 0) {
            $_SESSION['valid_user'] = $usuario;
            echo "<span>Inicio de sesión exitoso. Bienvenido, $usuario.</span>";
        } else {
            echo "<span class='codigos_error'>Error, usuario o contraseña inválido</span>";
        }
    } else {
        echo "<span class='codigos_error'>Por favor, completa todos los campos.</span>";
    }
}

mysqli_close($conexion);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión</title>
    <link rel="stylesheet" href="/CSS/login_style/styles.css">
    <link rel="stylesheet" href="/CSS/CSS-common/nav-bar/nav-bar_common-css.css">
</head>
<body>
    <nav>
        <ul>
            <li><a href='index.php'>Home</a></li>
            <li><a href='#'>Servicio</a></li>
            <li><a href='#'>Contacto</a></li>
            <?php 
            if (!isset($_SESSION['valid_user'])) {
                echo "<li><a href='login.php'>Iniciar Sesión</a></li>";
            }else{
                $user = $_SESSION['valid_user'];
                echo "<li>Usuario: " . $user ."</li>";
            }
            ?>

        </ul>
    </nav>
    <main>
        <h1>Iniciar Sesión</h1>

        <form action="login.php" method="post">
            <label for="username">Usuario:</label>
            <input type="text" name="username" id="username" required>
            <br>
            <label for="password">Contraseña:</label>
            <input type="password" name="password" id="password" required>
            <br>
            <button type="submit" name="iniciosesion">Iniciar sesión</button>
        </form>
        <?php
        if (!isset($_SESSION['valid_user'])) {
                echo "<div class='crear_una_cuenta'>¿No tienes cuenta? <a href=''>Crear una cuenta</a>.</div>";
            }
        ?>
    </main>
</body>
</html>
