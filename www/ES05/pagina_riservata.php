
<h1>Devi prima fare accesso!</h1>

<?php
    session_start();
    if(!isset($_SESSION['username']))
    {
        $url = 'login.php?error=Fare prima il login&from=';
        $url .= basename($_SERVER['PHP_SELF']);
        header("Location: $url");
        die();
    }
    echo "<h3>Benvenuto ". $_SESSION['username'] . "</h3>";
?>

<!DOCTYPE html>
<html>
<head>
    <title>Pagina Riservata</title>
</head>
<body>
    <a href="index.php">Index</a>
    <br>
    <a href="logout.php">Logout</a>
</body>
</html>