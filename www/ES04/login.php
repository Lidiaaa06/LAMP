<title>Form validazione</title>
</head>
<body>
    <h2>Form di Registrazione Utente</h2>
    <form action="es03a1.php" method="POST">
        <!-- Nome -->
        <label for="nome">Nome*:</label>
        <input type="text" id="nome" name="nome" pattern="[A-Za-zÀ-ÿ\s]+" required>
        <br><br>

        <!-- Cognome -->
        <label for="cognome">Cognome*:</label>
        <input type="text" id="cognome" name="cognome" pattern="[A-Za-zÀ-ÿ\s']+" required>
        <br><br>

        <!-- Password -->
        <label for="password">Password* :</label>
        <input type="password" id="password" name="password" pattern="(?=.*[A-Z])(?=.*\d)(?=.*\W).{8,}" required>
        <br><br>

        <input type="submit" value="Invia">
    </form>
</body>
</html>