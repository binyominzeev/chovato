<?php

include("functions.php");
include("login.php");
include("header.php");

if ($belepve == 1) {
	$id=mysqli_real_escape_string($sql, $_GET['id']);
	
	# ticket adatai
	
	$q="SELECT ".DB_PREFIX."tickets.created, ".DB_PREFIX."tickets.open, ".DB_PREFIX."tickets.description, ".DB_PREFIX."tickets.name as ticket_name, ".DB_PREFIX."projects.name as project_name, ".DB_PREFIX."projects.id as project_id, ".DB_PREFIX."projects.color FROM ".DB_PREFIX."tickets LEFT JOIN ".DB_PREFIX."projects ON ".DB_PREFIX."tickets.project=".DB_PREFIX."projects.id WHERE ".DB_PREFIX."tickets.id='$id'";
	$r=mysqli_query($sql, $q);
	$rec=mysqli_fetch_array($r);
	
	$open_ticket=$rec['open'];

	echo my_header("#$id: {$rec['ticket_name']} ({$rec['project_name']})", "projects.php?id={$rec['project_id']}");

	if (isset($_POST['comment'])) {
		# új komment (INSERT, ha már küldött)

		$closing=0;
		if (isset($_POST['closing'])) {
			$closing=1;
			$q="UPDATE ".DB_PREFIX."tickets SET open='".(1-$open_ticket)."' WHERE id='$id'";
			mysqli_query($sql, $q) or print(mysqli_error($sql));
			$open_ticket=1-$open_ticket;
		}
		
		$comment=mysqli_real_escape_string($sql, $_POST['comment']);
		$q="INSERT INTO ".DB_PREFIX."comments (ticket, user, datetime, text, closing) VALUES ('$id', '{$_SESSION['uid']}', now(), '$comment', '$closing')";
		mysqli_query($sql, $q) or print(mysqli_error());
		
		$q="UPDATE ".DB_PREFIX."tickets SET updated=NOW() WHERE id='$id'";
		mysqli_query($sql, $q) or print(mysqli_error($sql));
	}

	$color=brighter($rec['color']);
	
	echo "<div id=\"project_box\" style=\"background-color: #$color\">\n".
		"<p class=\"ticket_date\">{$rec['created']}</p>\n".
		"<p class=\"ticket_desc\">".$Parsedown->text($rec['description'])."</p>\n";
	
	# ticket kommentjei
	
	$q="SELECT * FROM ".DB_PREFIX."comments WHERE ticket='$id' ORDER BY datetime ASC";
	$r=mysqli_query($sql, $q) or print(mysqli_error());
	
	$open_at_time=1;

	while ($rec=mysqli_fetch_array($r)) {
		$closing_text="";
		if ($rec['closing'] == 1) {
			if ($open_at_time == 1) {
				$closing_text="<p class=\"open_close_event\">Ticket lezárva.</p>";
				$open_at_time=0;
			} else {
				$closing_text="<p class=\"open_close_event\">Ticket újból megnyitva.</p>";
				$open_at_time=1;
			}
		}
		
		echo "<div class=\"comment\">\n".
			"<p class=\"ticket_date\">#{$rec['id']}: {$rec['datetime']}</p>\n".
			"<p>".$Parsedown->text($rec['text'])."</p>\n".
			$closing_text.
			"</div>\n";
	}
	
	echo "<form method=\"post\" action=\"?id=$id\" accept-charset=\"UTF-8\">\n".
		"<textarea name=\"comment\" rows=\"5\" cols=\"70\" placeholder=\"Új komment\"></textarea><br>\n".
		"<p><label><input type=\"checkbox\" name=\"closing\">".($open_ticket==1?"Ticket lezárása":"Ticket újbóli megnyitása")."</label></p>\n".
		"<input type=\"submit\" value=\"Hozzáfűz\">\n".
		"</form>";
	
	echo "</div>\n";
	echo "</div>\n";
	
}

?>
</body>
</html>
