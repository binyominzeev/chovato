<?php

include("functions.php");
include("login.php");

if ($belepve == 1) {
	$id=mysqli_real_escape_string($sql, $_GET['id']);
	
	# ticket adatai
	
	$q="SELECT ".DB_PREFIX."tickets.created, ".DB_PREFIX."users.name as username, ".DB_PREFIX."tickets.open, ".DB_PREFIX."tickets.description, ".DB_PREFIX."tickets.name as ticket_name, ".DB_PREFIX."projects.name as project_name, ".DB_PREFIX."projects.id as project_id, ".DB_PREFIX."projects.color FROM (".DB_PREFIX."tickets LEFT JOIN ".DB_PREFIX."users ON ".DB_PREFIX."tickets.owner=".DB_PREFIX."users.id) LEFT JOIN ".DB_PREFIX."projects ON ".DB_PREFIX."tickets.project=".DB_PREFIX."projects.id WHERE ".DB_PREFIX."tickets.id='$id'";
	$r=mysqli_query($sql, $q);
	$rec=mysqli_fetch_array($r);

	init_check_access($sql, $_SESSION['uid']);
	
	if (!check_access($rec['project_id'])) {
		die("no access to this");
	}
	
	$open_ticket=$rec['open'];

	$html_title=$rec['ticket_name'];
	include("header.php");
	
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
		$reply_to=mysqli_real_escape_string($sql, substr($_POST['reply_to'], 8));
		
		$q="INSERT INTO ".DB_PREFIX."comments (ticket, user, datetime, text, closing, reply_to) VALUES ('$id', '{$_SESSION['uid']}', now(), '$comment', '$closing', '$reply_to')";
		mysqli_query($sql, $q) or print(mysqli_error());
		
		$q="UPDATE ".DB_PREFIX."tickets SET updated=NOW() WHERE id='$id'";
		mysqli_query($sql, $q) or print(mysqli_error($sql));
	}
	
	if (isset($_GET['del'])) {
		$delid=mysqli_real_escape_string($sql, $_GET['del']);
		$q="DELETE FROM ".DB_PREFIX."comments WHERE id='$delid'";
		mysqli_query($sql, $q) or print(mysqli_error($sql));
	}

	$color=brighter($rec['color']);
	
	echo "<div id=\"project_box\" style=\"background-color: #$color\">\n".
		"<p class=\"ticket_date\">{$rec['created']} ({$rec['username']})</p>\n".
		"<p class=\"ticket_desc\">".$Parsedown->text($rec['description'])."</p>\n";
	
	# ticket kommentjei
	
	$q="SELECT ".DB_PREFIX."comments.*, ".DB_PREFIX."users.name as username FROM ".DB_PREFIX."comments LEFT JOIN ".DB_PREFIX."users ON ".DB_PREFIX."comments.user=".DB_PREFIX."users.id WHERE ticket='$id' ORDER BY datetime ASC";
	$r=mysqli_query($sql, $q) or print(mysqli_error());
	
	$open_at_time=1;
	
	$id_list=array();
	$comment_list=array();

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
		
		$class="";
		if ($rec['reply_to'] > 0) {
			$key=array_search($rec['reply_to'], $id_list);
			$elotte=array_slice($id_list, 0, $key+1);
			$utana=array_slice($id_list, $key+1);
			$kozotte=array($rec['id']);
			
			$id_list=array_merge($elotte, $kozotte, $utana);
			$class=" child_comment";
		} else {
			$id_list[]=$rec['id'];
		}
		
		$comment_list[$rec['id']]="<div class=\"comment$class\">\n".
			"<p class=\"ticket_date\">#{$rec['id']}: {$rec['datetime']} ({$rec['username']}) (<a href=\"#\" id=\"comment_{$rec['id']}\" class=\"reply_link\">reply</a>) (<a href=\"?id=$id&del={$rec['id']}\">delete</a>)</p>\n".
			"<p>".$Parsedown->text($rec['text'])."</p>\n".
			$closing_text.
			"</div>\n";
	}
	
	foreach ($id_list as $myid) {
		echo $comment_list[$myid];
	}
	
	
	echo "<form method=\"post\" action=\"?id=$id\" accept-charset=\"UTF-8\">\n".
		"<input type=\"hidden\" name=\"reply_to\" id=\"reply_to\" value=\"\">\n".
		"<div id=\"reply_to_show\"></div>\n".
		"<textarea name=\"comment\" rows=\"25\" cols=\"100\" placeholder=\"Új komment\"></textarea><br>\n".
		"<p><label><input type=\"checkbox\" name=\"closing\">".($open_ticket==1?"Ticket lezárása":"Ticket újbóli megnyitása")."</label></p>\n".
		"<input type=\"submit\" value=\"Hozzáfűz\">\n".
		"</form>";
	
	echo "</div>\n";
	echo "</div>\n";
	
} else {
	include("header.php");
}

?>
</body>
</html>
