<?php
require 'funzioni.php';

session_start();

//
$error_mess = $_GET['errore'] ?? '';

//Ogni volta che arrivo su questa pagina utilizzando il metodo GET
//Inizializzo tentativi e tempo
if($_SERVER['REQUEST_METHOD'] == 'GET') 
{
    $_SESSION['Tentativi'] = 4 ;
    $_SESSION['tempo'] = null;
}

//Se l'utente ha già fatto il login vado subito alla home page
[$rest_val, $rest_mess] = session_control();
if($rest_val) 
{
    $link = 'Location: ';
    $link .= $_GET['from'] ?? 'index.php'; //concatenazione

    header($link); //reinderizza
    die();
}



if ($_SERVER['REQUEST_METHOD'] === 'POST' &&  (!isset($_SESSION['tempo']) ||  $_SESSION['tempo'] + 60 < $_SERVER['REQUEST_TIME'])) 
{
    $username = $_POST['username'];
    $password = $_POST['password'];

    [$rest_val, $rest_mess] = login_control($username, $password);

    if ($rest_val)
    {
        $_SESSION['username'] = $username;

        $link = 'Location: ';
        $link .= $_POST['from'] != null ? $_POST['from'] : 'index.php';

        header($link);
        die();
        
    }
    else 
    {
        $error_mess = $rest_mess;
        $_SESSION['Tentativi']-1;
        $error_mess .= '. Tentativi rimasti: '.$_SESSION['Tentativi'];
        if($_SESSION['Tentativi'] == 0) {
            $error_mess = 'Tentativi esauriti, riprova piu tardi';
            $_SESSION['tempo'] = $_SERVER['REQUEST_TIME'];
        }
    }
} 
else if ($_SESSION['time']) 
{
    $timeLeft = $_SESSION['time'] + 60 < $_SERVER['REQUEST_TIME']; 

    if ($timeLeft <= 0) 
    {
        $_SESSION['prove'] = 4;
        $_SESSION['time'] = null;
    } else {
        $error_mess = "Account bloccato. Riprova tra $timeLeft secondi";
    }
}
    
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login</title>
</head>
<body>
    <div id="login-container">
        <h2>Login</h2>
        <div id="error-container"><?= $error_mess ?></div>
        <form action="<?php ($_SERVER['PHP_SELF']) ?>" method="POST">
            <input type="text" name="utente" id="utente" placeholder="username" required>
            <br><br>
            <input type="password" name="password" id="password" placeholder="Password" required>
            <br><br>
            <input type="submit" value="Login" id="login-button">
            <input type="hidden" name="from" value="<?=$_GET['from'] ?? ''?>">
        </form>
    </div>
</body>
</html>