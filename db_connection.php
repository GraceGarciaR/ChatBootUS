<?php
$host = 'localhost';  // O el host de tu servidor
$dbname = 'UNISA_ASISTENCIA';
$username = 'root';    // Tu usuario de MySQL
$password = '';        // Tu contraseña de MySQL

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Error de conexión: " . $e->getMessage());
}
?>