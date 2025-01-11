<?php
session_start();
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página Principal</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="/CSS/CSS-common/nav-bar/nav-bar_common-css.css">
</head>
<body>
    <nav>
        <ul>
            <li><a href='#'>Home</a></li>
            <li><a href='#'>Servicio</a></li>
            <li><a href='#'>Contacto</a></li>
            <?php 
            if (!isset($_SESSION['valid_user'])) {
                echo "<li><a href='login.php'>Iniciar Sesión</a></li>";
            }else{
                $user = $_SESSION['valid_user'];
                echo "<li>Usuario: " . $user ."
                        <ul>
                            <li><a href='PHP/logout/logout.php'>Cerrar Sesión</a></li>
                        </ul>
                      </li>";
            }
            ?>

        </ul>
    </nav>

    <main>
        <?php 
        if (isset($_SESSION['valid_user'])) {
            echo "Has iniciado sesión felicidades";
        }else{
            echo "Inicia sesión para comprobar que funciona todo.";
        }
        ?>
    </main>
</body>
</html>
