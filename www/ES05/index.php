<?php
session_start();
if(isset($_SESSION['username']))
{
    $link = "<a href='logout.php'>Logout</a>";
} else {
    $link = "<a href='login.php'>Login</a>";
}

?>
<!DOCTYPE html>
<html>
<head>
<title>Benvenuto</title>
</head>
<body>
<h1>Benvenuto!</h1>
<a href="pagina_riservata.php">Accesso alla pagina riservata</a>
<br>
<?php echo $link; ?>
</body>
</html>





