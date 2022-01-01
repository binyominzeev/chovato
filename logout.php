<?php

include("login.php");

if ($belepve == 1) {
	session_unset();
	header('Location:index.php');
}


?>
<html>
<head>
<title>Chovato</title>
<link rel="stylesheet" href="chovato.css">
</head>
<body>
</body>
</html>
