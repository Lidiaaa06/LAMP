<?php
    session_start();

    require 'funzioni.php';

    $link = collegamento();
    
?>

<!DOCTYPE html>
<html lang="it">
    <head>
        <title>Pagina di Benvenuto</title>
    </head>
    <body>
        <h1>Benvenuto\a</h1>
        <a href="riservata.php">Riservata</a>
        <br>
        <?php echo $link; ?>
    </body>
</html>