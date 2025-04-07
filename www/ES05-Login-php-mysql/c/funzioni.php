<?php 

define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'ES05_new');
define('DB_PASSWORD', 'pwd');
define('DB_NAME', 'ES05');

function sessioncontroll()  
{  
    if (isset($_SESSION['utente'])) {  
        return [true, 'sessione avviata '];  
    } else {  
        return [false, 'sessione non avviata'];  
    }  
}  


function logincontroll()  
{ 
    $conn = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);

    if (!$conn) {
        die("Attenzione! Connessione fallita." . mysqli_connect_error());
    }

    $query = "SELECT * FROM account WHERE utente = '$utente' AND password = '$password'";
    $result = mysqli_query($conn, $query);

    // Verifica se la query ha restituito risultati
    if (mysqli_num_rows($result) > 0) {
        echo "Login riuscito. Benvenuto!"; // L'utente è autenticato con successo
    } else {
        echo "Credenziali errate. Riprova."; // L'utente non è autenticato
    }

    // Chiudi la connessione al database
    mysqli_close($conn);
}

function logout()
{
    session_start();
    session_destroy();
    header("Location: login.php");
    die();
}

function collegamento()
{ 
    if(checksession()[0]){
        $link= "<a href='logout.php'>logout</a>";
        } else {
        $link = "<a href='login.php'>login</a>";
    }
    return $link;
}