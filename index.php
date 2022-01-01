<?php

include("functions.php");
include("login.php");
include("header.php");

if ($belepve == 1) {
	echo my_header("Chovato");
	
	if (isset($_GET['newproj'])) {
		# új projekt form (ha már választott színt)
		
		echo "<form method=\"post\" action=\"?\">\n".
			"<input type=\"text\" name=\"name\" placeholder=\"Projekt neve\" size=\"20\"><br />\n".
			"<input type=\"hidden\" name=\"color\" value=\"{$_GET['newproj']}\">\n".
			"<textarea name=\"description\" rows=\"5\" cols=\"70\" placeholder=\"Leírása\"></textarea><br>\n".
			"<input type=\"submit\" value=\"Létrehoz\">".
			"</form>";
	} elseif (isset($_POST['name'])) {
		# új projekt form (INSERT, ha már beírta az összes adatát)
		
		$name=mysqli_real_escape_string($sql, $_POST['name']);
		$description=mysqli_real_escape_string($sql, $_POST['description']);
		$color=mysqli_real_escape_string($sql, $_POST['color']);
		
		$q="INSERT INTO ".DB_PREFIX."projects (name, description, created, color) VALUES ('$name', '$description', now(), '$color');";
		mysqli_query($sql, $q) or print(mysqli_error($sql));
		$id=mysqli_insert_id($sql);
		
		echo "<script>parent.location.href='projects.php?id=$id'</script>\n";
	} else {
		# dashboard, aktív ticketek listája az összes projektből
		
		$tickets_open=1;
		if (isset($_GET['closed']) && $_GET['closed']==1) {
			$tickets_open=0;
		}
				
		$q="SELECT ".DB_PREFIX."tickets.id, ".DB_PREFIX."users.name as username, ".DB_PREFIX."tickets.created, ".DB_PREFIX."tickets.description, ".DB_PREFIX."tickets.project, ".DB_PREFIX."tickets.name as ticket_name, ".DB_PREFIX."projects.name as project_name, ".DB_PREFIX."projects.color FROM (".DB_PREFIX."tickets LEFT JOIN ".DB_PREFIX."users ON ".DB_PREFIX."tickets.owner=".DB_PREFIX."users.id) LEFT JOIN ".DB_PREFIX."projects ON ".DB_PREFIX."tickets.project=".DB_PREFIX."projects.id WHERE ".DB_PREFIX."tickets.open='$tickets_open' AND ".DB_PREFIX."projects.closed='0' ORDER BY ".DB_PREFIX."tickets.updated DESC";
		$r=mysqli_query($sql, $q);
		
		init_check_access($sql, $_SESSION['uid']);
		echo "<div id=\"dashboard_tickets\">\n";

		while ($rec=mysqli_fetch_array($r)) {
			if (check_access($rec['project'])) {
				echo show_ticket($sql, $rec);
			}
		}
		
		echo "</div>\n";
		
		show_projects($sql);
	}
}

?>
</body>
</html>
