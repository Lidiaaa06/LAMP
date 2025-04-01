<?php
    session_start();

    if($_SERVER['REQUEST_METHOD'] == 'GET') 
    {
        $_SESSION['Tentativi'] = 3 ;
        $_SESSION['tempo'] = null;
    }

    require 'funzioni.php';

    [$rest_val, $rest_mess] = session_control();

    if($rest_val) 
    {
        $link = 'Location: ';
        $link .= $_GET['from'] ?? 'index.php';
    
        header($link);
        die();
    }

    $error_mess = $_GET['errore'] ?? '';

    [$rest_val, $rest_mess] = login_control($username, $password);

    if ($_SERVER['REQUEST_METHOD'] === 'POST' && 
    (!isset($_SESSION['tempo']) || time() - $_SESSION['tempo'] >= 60)) 
    {

    $username = $_POST['username'];
    $password = $_POST['password'];

    [$rest_val, $rest_mess] = login_control($username, $password);

    if ($rest_val)
     {
        session_unset(); 

        $_SESSION['username'] = $username;

        header('Location: ' . ($_POST['from'] ?? 'index.php'));
        die();
}else {
            $error_mess = $rest_mess;
            $_SESSION['Tentativi']--;
            $error_mess .= '. Tentativi rimasti: '.$_SESSION['Tentativi'];
            if($_SESSION['Tentativi'] == 0) {
                $error_mess = 'Tentativi esauriti, riprova piu tardi';
                $_SESSION['tempo'] = $_SERVER['REQUEST_TIME'];
            }
        }
    }
    else if ($_SESSION['timestamp']) 
    {
        $timeLeft = $_SESSION['timestamp'] + 60 - $_SERVER['REQUEST_TIME'];
    
        if ($timeLeft <= 0) 
        {
            $_SESSION['prove'] = 3;
            $_SESSION['timestamp'] = null;
        } else {
            $err_mess = "Account bloccato. Riprova tra $timeLeft secondi";
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
        <div id="error-container"><?= $err_mess ?></div>
        <form action="<?php ($_SERVER['PHP_SELF']) ?>" method="POST">
            <input type="text" name="utente" id="utente" placeholder="utente" required>
            <br>
            <input type="password" name="password" id="password" placeholder="Password" required>
            <br>
            <input type="submit" value="Login" id="login-button">
            <input type="hidden" name="from" value="<?=$_GET['from'] ?? ''?>">
        </form>
    </div>
</body>
</html>