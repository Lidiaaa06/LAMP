<?php 

require 'funzioni.php';

session_start();

$utente = $_POST['utente'];
$password = $_POST['password'];
echo "Nome utente = $utente<br>";
echo "Password = $password<br>";


if (isset($_SESSION['utente'])) {
    echo "Utente già loggato";
    $mess = 'Accesso gia effettuato';
} else if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    
  

    [$Accessorestval, $Accessomsg] = logincontroll($utente, $password);

    $mess = $Accessomsg;

    if ($Accessorestval) {
        $_SESSION['utente'] = $utente;
        
        $coll = 'Location: ';
        $coll.= $_POST['from'] != null ? $_POST['from'] : 'index.php';

        header($coll);
        exit;
    }

    $link= collegamento();
} else {
   echo "Condizione altrernativa<br>";
}

echo "Fine controlli";
?>


<!DOCTYPE html>
<html lang="it">
<head>
    <title>Login</title>
</head>
<body>
        <h2>Login</h2>

        <?= $mess ?>

        <form action="<?= $_SERVER['PHP_SELF']; ?>" method="POST">
            
            <input type="text" name="utente" id="utente" placeholder="utente" pattern=".{3,}" required title="Minimo 3 lettere">
            <br>
            
            <input type="password" name="password" id="password" placeholder="password" pattern=".{3,}" required title="Minimo 3 lettere">
            <br>
            <input type="submit" value="Login" id="login-button">

            <input type="hidden" name="from" value="<?= $_GET['from'] ?? null ?>"> 
        </form>
            <?= $links ?>
</body>
</html>


    