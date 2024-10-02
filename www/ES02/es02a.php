<?php
$username = $_POST['username'];
$passwd = $_POST['password'];


if($username=="Mario" && $passwd=="123") {
  $msg = "Inserire altre credenziali";
} else {
  $msg = "Benvenuto $username nella pagina riservata del mio sito!";
}
?>

<!DOCTYPE html>
<html>
<head>
  <title>Accesso a pagina riservata</title>
</head>
<body>
  <h3>Pagina di login</h3>
  
  <?=$msg?>

</body>
</html>