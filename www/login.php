<?php
$utente_corretto = 'utente';
$password_corretta = 'password';

$username = $_POST['username'] ?? '';
$password = $_POST['password'] ?? '';

if ($username === $utente_corretto && $password === $password_corretta)
{
    echo "<h2>Benvenuto, $username!</h2>";
    echo "<p>Login effettuato con successo.</p>";
} else 
{
    echo "<h2>Accesso negato</h2>";
    echo "<p>Username o password errati.</p>";
}
?>
