<?php

include("functions.php");
include("login.php");
include("header.php");

if ($belepve == 1) {
	if (!isset($_GET['id'])) {
		echo "<p class=\"error\">Nincs projekt kiválasztva!</p>\n";
	} else {
		$id=mysqli_real_escape_string($sql, $_GET['id']);

		$q="SELECT * FROM ".DB_PREFIX."projects WHERE id='$id'";
		$r=mysqli_query($sql, $q);
		$rec=mysqli_fetch_array($r);
		
		$project_color=$rec['color'];
		$project_name=$rec['name'];

		echo my_header("{$rec['name']}", (isset($_GET['tag'])?"projects.php?id=$id":"index.php")).
			($rec['description']!=""?"<p class=\"project_page_description\">{$rec['description']}</p>\n":"");

		if (isset($_GET['newtag'])) {
			# új tag form (ha már választott színt)
			
			echo "<form method=\"post\" action=\"?id=$id\">\n".
				"<input type=\"text\" name=\"name\" placeholder=\"Tag neve\" size=\"20\"><br />\n".
				"<input type=\"hidden\" name=\"color\" value=\"{$_GET['newtag']}\">\n".
				"<input type=\"submit\" value=\"Létrehoz\">".
				"</form>";
		} elseif (isset($_POST['name'])) {
			# új tag form (INSERT, ha már beírta az összes adatát)
			
			$name=mysqli_real_escape_string($sql, $_POST['name']);
			$color=mysqli_real_escape_string($sql, $_POST['color']);
			
			$q="INSERT INTO ".DB_PREFIX."tags (project, tag, color) VALUES ('$id', '$name', '$color');";
			mysqli_query($sql, $q) or print(mysqli_error($sql));
			
			echo "<script>parent.location.href='projects.php?id=$id'</script>\n";
		} elseif (isset($_GET['newticket'])) {
			# új ticket form
			
			echo "<form method=\"post\" action=\"?id=$id\">\n".
				"<input type=\"text\" name=\"ticketname\" placeholder=\"Ticket címe\" size=\"20\"><br />\n".
				"<textarea name=\"description\" rows=\"5\" cols=\"70\" placeholder=\"Leírása\"></textarea><br>\n".
				"<input type=\"submit\" value=\"Létrehoz\">".
				"</form>";
		} elseif (isset($_POST['ticketname'])) {
			# új ticket form (INSERT, ha már beírta az összes adatát)
			
			$name=mysqli_real_escape_string($sql, $_POST['ticketname']);
			$description=mysqli_real_escape_string($sql, $_POST['description']);
			
			$q="INSERT INTO ".DB_PREFIX."tickets (project, created, updated, owner, name, description) VALUES ('$id', now(), now(), '{$_SESSION['uid']}', '$name', '$description');";
			mysqli_query($sql, $q) or print(mysqli_error($sql));
			
			echo "<script>parent.location.href='projects.php?id=$id'</script>\n";
		} else {
			# aktív ticketek listája az adott projektben
			
			$color=brighter($rec['color']);
			
			echo "<div id=\"project_box\" style=\"background-color: #$color\">\n";

			$tickets_open=1;
			if (isset($_GET['closed']) && $_GET['closed']==1) {
				$tickets_open=0;
			}
			
//			$q="SELECT tickets.id, tickets.created, tickets.description, tickets.name, ticket_tags.tag AS tag_id FROM tickets LEFT JOIN ticket_tags ON tickets.id=ticket_tags.ticket WHERE tickets.project='$id' AND tickets.open='$tickets_open'  ORDER BY tickets.created DESC";
			$q="SELECT ".DB_PREFIX."tickets.id, ".DB_PREFIX."tickets.created, ".DB_PREFIX."tickets.description, ".DB_PREFIX."tickets.name as ticket_name FROM ".DB_PREFIX."tickets WHERE ".DB_PREFIX."tickets.project='$id' AND ".DB_PREFIX."tickets.open='$tickets_open' ORDER BY ".DB_PREFIX."tickets.updated DESC";

			if (isset($_GET['tag'])) {
				$tag_filter=mysqli_real_escape_string($sql, $_GET['tag']);

				$q="SELECT ".DB_PREFIX."tickets.id, ".DB_PREFIX."tickets.created, ".DB_PREFIX."tickets.description, ".DB_PREFIX."tickets.name as ticket_name FROM ".DB_PREFIX."tickets LEFT JOIN ".DB_PREFIX."ticket_tags ON ".DB_PREFIX."tickets.id=".DB_PREFIX."ticket_tags.ticket WHERE ".DB_PREFIX."tickets.project='$id' AND ".DB_PREFIX."tickets.open='$tickets_open' AND ".DB_PREFIX."ticket_tags.tag='$tag_filter' ORDER BY ".DB_PREFIX."tickets.updated DESC";
				//echo $q;
			}

			$r=mysqli_query($sql, $q);

			echo "<div id=\"dashboard_tickets\">\n".
				"<div class=\"dashboard_ticket\" style=\"background-color: #{$rec['color']}\">".
				"<p class=\"ticket_title\" style=\"margin-bottom: 10px\"><a href=\"?id=$id&newticket=\">új ticket</a></p>\n".
				"</div>\n";
			
			while ($rec=mysqli_fetch_array($r)) {
				$rec['color']=$project_color;
				$rec['project_name']=$project_name;
				echo show_ticket($sql, $rec, 0, 1);
			}
			echo "</div>\n";
			
			show_tags($sql, $id);

			echo "</div>\n";
		}
	}
}

?>
</body>
</html>
