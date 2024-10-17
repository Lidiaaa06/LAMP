<?php
$username_corretta = "Lidia";
$password_corretta = "123456";

if ($_SERVER["REQUEST_METHOD"] == "POST") 
{
    if (isset($_POST["username"]) || isset($_POST["password"])) 
    {
        $username_inserito = $_POST["username"];
        $password_inserita = $_POST["password"];

        if ($username_inserito == $username_giusta && $password_inserita == $password_giusta) 
        {
           echo "<h2>Accesso riuscito! Benvenuto\a, $username_inserito! </h2>";
        } else {
            echo "<h2>password o username errati! Riprova.</h2>";
            
            visualform();
               }
    }else {
       
        visualform();
          }
}else {
   
    visualform();
      }


function visualform() 
{
  echo '
  <form action="" method="post">
   <label for="name">Username:</label>
   <input type="text" id="username" name="username" placeholder= "nome"><br>
   <label for="password">Password:</label>
   <input type="password" id="password" name="password" placeholder = "password"><br>
   <input type="submit" value="invia">
   </form>';  
}

?>