<?php
session_start();
if (isset($_SESSION['username'])) 
{
    header('Location: index.php'); //reindirizza 
    die();
}

if (isset($_GET['error'])) 
{
    $mes_err = $_GET['error'];
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') 
{
    $username = $_POST['username'];
    $password = $_POST['password'];
    if ($username == 'Lidia' && $password == 'password') 
    {
        $_SESSION['username'] = $username;
        
        $url = 'Location: ';
        $url .= $_POST['from'] == null ? 'index.php' : $_POST['from'];

        header($url);
        die();

    } else {
        $mes_err ="<h3> username o pasword sbagliati </h3>";
    }
}


?>



<!DOCTYPE html>
<html>
<head>
    <title>Pagina_di_Login</title>
</head>
<body>

<h3>Benvenuto!</h3>

    <?=$mes_err?>
    <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
        <label for="username">username</label>
        <input type="text" name="username" id="username">
        <br>
        <label for="password">password</label>
        <input type="password" name="password" id="password">
        <br>
        <input type="submit" value="Accedi">

        <input type="hidden" name="from" value="<?=$_GET['from'] ?? null ?>" > 
    </form>
</body>
</html>



