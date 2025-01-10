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
</head>
<body>
    <header>
        <h1>Bienvenido a mi web</h1>
        <?php if (isset($_SESSION['username'])): ?>
            <p>Hola, <?= htmlspecialchars($_SESSION['username']) ?>. <a href="logout.php">Cerrar sesión</a></p>
        <?php else: ?>
            <a href="login.php">Iniciar sesión</a>
        <?php endif; ?>
    </header>

    <main>
        <?php if (!isset($_SESSION['username'])): ?>
            <p>Por favor, inicia sesión para acceder al contenido exclusivo.</p>
        <?php else: ?>
            <p>Bienvenido al contenido exclusivo para usuarios registrados.</p>
        <?php endif; ?>
    </main>
</body>
</html>
