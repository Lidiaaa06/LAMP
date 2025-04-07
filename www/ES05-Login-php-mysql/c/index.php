<?php
session_start(); // Avvio la sessione PHP

// Verifica se l'utente è autenticato
$utente = $_SESSION['utente'] ?? 'Ospite';

// Creazione dei link in funzione dell'utente Ospite o Autenticato
if ($utente === 'Ospite') {
    $html_link = '<a href="login.php"><h2>Accedi</h2></a>';
} else {
    $html_link = '<a href="protected_page.php"><h2>Riservata</h2></a> <a href="logout.php"><h2>Esci</h2></a>';
}
?>

<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
</head>
<body>
  <h2>ES05 - Login con PHP e MySQL</h2>
  <p>Benvenuto <?= $utente ?>. Home page del sito.<br />

  <!-- Link -->
  <p><?= $html_link ?></p>
</body>
</html>