<?php

$sql=mysqli_connect('localhost','root', "12345", "chovato") or die ('Hiba a csatlakozásnál!');

mysqli_set_charset($sql, "utf8");

ini_set('session.gc_maxlifetime', 60 * 60 * 24 * 7); 
ini_set('session.cookie_lifetime', 60 * 60 * 24 * 7); 
session_start();

$belepve=0;

if (isset($_SESSION['uid'])) {
	$belepve=1;
}

if (isset($_POST['submit'])) {
	$username=$_POST['username'];
	$password=$_POST['password'];

	if ($username && $password) {
		$q="SELECT * FROM ".DB_PREFIX."users WHERE name='$username' and password=password('$password')";
		$r=mysqli_query($sql, $q) or print($q);
		$rows=mysqli_num_rows($r);
		
		if ($rows==1) {
			$user=mysqli_fetch_array($r);
			
			$_SESSION['uid']=$user['id'];
			$_SESSION['name']=$user['name'];
			
			$belepve=1;
		} else {
			echo("Hibás felhasználónév vagy jelszó!");
		}
	} else {
		echo("Kérem, adjon meg adatokat!");
	}
}

if ($belepve == 0) {

?><form action="?" method="POST">
Felhasználónév: <br/><input type="text" name="username"/><br/>
Jelszó: <br/><input type="password" name="password"><br/>
<input type="submit" name="submit" value="Belépés">
</form><?php

}

?>
