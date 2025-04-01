<?php

function session_control() 
{
    if(isset($_SESSION['utente']))
    {
        return [true, 'sessione avviata'];
        } else {
        return [false, 'sessione non avviata'];
    }
}

function login_control($utente,$password)
{
    $username_esatto = 'Lidia';
    $password_esatta = 'password';

    $username_inserito = $utente;
    $password_inserita = $password;

    if ($username_inserito == $username_esatto && $password_inserita == $password_esatta)
     {
        // Se i dati sono corretti, salva il nome utente nella sessione e reindirizza l'utente alla pagina principale
        $_SESSION['utente'] = $username_inserito;
        return [true, 'login esatto'];
    }
    else {
        return [false, 'login fallito'];
    }
}

function  termina()
{
    session_start();
    session_destroy();
    header("Location: login.php");
}

function collegamento()
{ 
    if(checksession()[0])
    {
        $link= "<a href='logout.php'>logout</a>";
        } else {
        $link = "<a href='login.php'>login</a>";
    }
    return $link;
}
?>