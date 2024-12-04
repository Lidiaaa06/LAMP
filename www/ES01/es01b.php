<!DOCTYPE html>
<html lang >
<head>
<title>Esercizio B</title>
</head>
<body>
    <?php
        $name = "Lidia";

       
        $today = new DateTime("now", new DateTimeZone('Europe/Rome'));
        $hour = $today->format('H');

       
        if ($hour >= 8 && $hour < 12) 
        {
            $saluto= "Buongiorno";
        } elseif ($hour >= 12 && $hour < 20)
        {
            $saluto = "Buonasera";
        } else {
            $saluto = "Buonanotte";
        }

        $browser = $_SERVER['HTTP_USER_AGENT'];

        
        echo "$greeting $name, benvenuta nella mia prima pagina PHP!<br>";
        echo "Stai usando il browser: $browser";
    ?>