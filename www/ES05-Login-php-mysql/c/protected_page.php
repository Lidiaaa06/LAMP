<?php 
    require 'funzioni.php';

    session_start();

    [$sessionRestval, $sessionmsg] = sessioncontroll();

    if (!$sessionRestval) {
        $url = 'Location: login.php?from=' . basename($_SERVER['PHP_SELF']) . '&error=' . $sessionmsg;
        header($url);
        die();
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Pagina Riservata</title>
</head>
<body>
    <?="<h3>Benvenuto " . $_SESSION['utente'] . "</h3>"?>

    <a href="index.php">Home page</a>
    <br>
    <a href="logout.php">Logout</a>
</body>
</html>

    