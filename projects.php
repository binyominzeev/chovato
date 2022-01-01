<?php

include("functions.php");
include("login.php");

if ($belepve == 1) {
	if (!isset($_GET['id'])) {
		echo "<p class=\"error\">Nincs projekt kiválasztva!</p>\n";
	} else {
		$id=mysqli_real_escape_string($sql, $_GET['id']);
		init_check_access($sql, $_SESSION['uid']);
		
		if (!check_access($_GET['id'])) {
			die("no access to this");
		}

		$q="SELECT * FROM ".DB_PREFIX."projects WHERE id='$id'";
		$r=mysqli_query($sql, $q);
		$rec=mysqli_fetch_array($r);
		
		$project_color=$rec['color'];
		$project_name=$rec['name'];

		$html_title=$rec['name'];
		include("header.php");

		echo my_header($rec['name'], (isset($_GET['tag'])?"projects.php?id=$id":"index.php")).
			($rec['description']!=""?"<p class=\"project_page_description\">{$rec['description']}</p>\n":"");

		if (isset($_GET['newtag'])) {
			# új tag form (ha már választott színt)
			
			echo "<form method=\"post\" action=\"?id=$id\">\n".
				"<input type=\"text\" name=\"name\" placeholder=\"Tag neve\" size=\"100\"><br />\n".
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
				"<input type=\"text\" name=\"ticketname\" placeholder=\"Ticket címe\" size=\"100\"><br />\n".
				"<textarea name=\"description\" rows=\"35\" cols=\"100\" placeholder=\"Leírása\"></textarea><br>\n".
				"<p><label><input type=\"checkbox\" name=\"linewise\">Soronként új ticket</label></p>\n".
				"<input type=\"submit\" value=\"Létrehoz\">".
				"</form>";
		} elseif (isset($_POST['ticketname'])) {
			# új ticket form (INSERT, ha már beírta az összes adatát)
			
			if (isset($_POST['linewise'])) {
				# soronként új ticket, cím ignorálása
				
				$lines=explode(PHP_EOL, $_POST['description']);
				
				foreach ($lines as $line) {
					$name=mysqli_real_escape_string($sql, trim($line));
					$q="INSERT INTO ".DB_PREFIX."tickets (project, created, updated, owner, name, description) VALUES ('$id', now(), now(), '{$_SESSION['uid']}', '$name', '');";
					mysqli_query($sql, $q) or print(mysqli_error($sql));
				}
			} else {
				# egy új ticket
				
				$name=mysqli_real_escape_string($sql, $_POST['ticketname']);
				$description=mysqli_real_escape_string($sql, $_POST['description']);
				
				$q="INSERT INTO ".DB_PREFIX."tickets (project, created, updated, owner, name, description) VALUES ('$id', now(), now(), '{$_SESSION['uid']}', '$name', '$description');";
				mysqli_query($sql, $q) or print(mysqli_error($sql));
			}
			
			echo "<script>parent.location.href='projects.php?id=$id'</script>\n";
		} else {
			# aktív ticketek listája az adott projektben
			
			$color=brighter($rec['color']);
			
			echo "<div id=\"project_box\" style=\"background-color: #$color\">\n";

			$tickets_open=1;
			if (isset($_GET['closed']) && $_GET['closed']==1) {
				$tickets_open=0;
			}
			
			if (isset($_GET['refresh'])) {
				$ticket=mysqli_real_escape_string($sql, $_GET['refresh']);
				$q="INSERT INTO ".DB_PREFIX."comments (ticket, user, datetime, text, closing) VALUES ('$ticket', '{$_SESSION['uid']}', now(), '(refresh)', '0')";
				mysqli_query($sql, $q) or print(mysqli_error());

				$q="UPDATE ".DB_PREFIX."tickets SET updated=NOW() WHERE id='$ticket'";
				mysqli_query($sql, $q) or print(mysqli_error($sql));
			} elseif (isset($_GET['close'])) {
				$ticket=mysqli_real_escape_string($sql, $_GET['close']);
				$q="INSERT INTO ".DB_PREFIX."comments (ticket, user, datetime, text, closing) VALUES ('$ticket', '{$_SESSION['uid']}', now(), '', '1')";
				mysqli_query($sql, $q) or print(mysqli_error());

				$q="UPDATE ".DB_PREFIX."tickets SET updated=NOW() WHERE id='$ticket'";
				mysqli_query($sql, $q) or print(mysqli_error($sql));

				$q="UPDATE ".DB_PREFIX."tickets SET open='0' WHERE id='$ticket'";
				mysqli_query($sql, $q) or print(mysqli_error($sql));
			} elseif (isset($_GET['bounce'])) {
				$ticket=mysqli_real_escape_string($sql, $_GET['bounce']);
				$days=mysqli_real_escape_string($sql, $_GET['day']);

				$q="UPDATE ".DB_PREFIX."tickets SET bounceback=NOW() + INTERVAL $days DAY WHERE id='$ticket'";
				mysqli_query($sql, $q) or print(mysqli_error($sql));
			}
			
//			$q="SELECT tickets.id, tickets.created, tickets.description, tickets.name, ticket_tags.tag AS tag_id FROM tickets LEFT JOIN ticket_tags ON tickets.id=ticket_tags.ticket WHERE tickets.project='$id' AND tickets.open='$tickets_open'  ORDER BY tickets.created DESC";
			$q="SELECT ".DB_PREFIX."tickets.id, ".DB_PREFIX."users.name as username, ".DB_PREFIX."tickets.created, ".DB_PREFIX."tickets.bounceback, ".DB_PREFIX."tickets.description, ".DB_PREFIX."tickets.name as ticket_name, ".DB_PREFIX."tickets.updated AS tickets_updated FROM ".DB_PREFIX."tickets LEFT JOIN ".DB_PREFIX."users ON ".DB_PREFIX."tickets.owner=".DB_PREFIX."users.id ".
				"WHERE ".DB_PREFIX."tickets.project='$id' AND ".
				DB_PREFIX."tickets.open='$tickets_open' AND ".
				DB_PREFIX."tickets.bounceback<NOW()".
				"ORDER BY ".DB_PREFIX."tickets.updated DESC";
			
			//echo "<p>$q</p>\n";
			
			// not supporting tags anymore

/*			if (isset($_GET['tag'])) {
				$tag_filter=mysqli_real_escape_string($sql, $_GET['tag']);

				$q="SELECT ".DB_PREFIX."tickets.id, ".DB_PREFIX."tickets.created, ".DB_PREFIX."tickets.description, ".DB_PREFIX."tickets.name as ticket_name, ".DB_PREFIX."tickets.updated AS tickets_updated FROM ".DB_PREFIX."tickets LEFT JOIN ".DB_PREFIX."ticket_tags ON ".DB_PREFIX."tickets.id=".DB_PREFIX."ticket_tags.ticket ".
					"WHERE ".DB_PREFIX."tickets.project='$id' AND ".
						DB_PREFIX."tickets.open='$tickets_open' AND ".
						DB_PREFIX."ticket_tags.tag='$tag_filter' AND ".
						DB_PREFIX."tickets.bounceback<NOW()".
					"ORDER BY ".DB_PREFIX."tickets.updated DESC";
				echo $q;
			} */

			$r=mysqli_query($sql, $q);
			
			// ======== preview table ========

			echo "<table class=\"quicktickets\">\n".
				"<thead>\n".
				"<th>Ticket</th>\n".
				"<th>Bounceback (days)</th>\n".
				"<th>Bounced at</th>\n".
				"<th>Last updated</th>\n".
				"<th align=\"center\">Refresh</th>\n".
				"<th align=\"center\">Close</th>\n".
				"</thead>\n";

			while ($rec=mysqli_fetch_array($r)) {
				$class="";
				$bounceback=$rec['bounceback'];
				if ($bounceback == "0000-00-00 00:00:00") {
					$bounceback="&nbsp;";
				} else {
					$class=" class=\"bounced_back\"";
					$bounceback=show_date($bounceback);
				}
				
				echo "<tr$class>\n".
					"<td><a href=\"tickets.php?id={$rec['id']}\">{$rec['ticket_name']}</a></td>\n".
					"<td>";
				
				for ($i=1;$i<=10;$i++) {
					echo "<a href=\"?id=$id&bounce={$rec['id']}&day=$i\">$i</a> ";
				}
				
				$updated=show_date($rec['tickets_updated']);
				
				echo "</td>\n".
					"<td>$bounceback</td>\n".
					"<td>$updated</td>\n".
					"<td align=\"center\"><a href=\"?id=$id&refresh={$rec['id']}\">(refresh)</a></td>\n".
					"<td align=\"center\"><a href=\"?id=$id&close={$rec['id']}\">(close)</a></td>\n".
					"</tr>\n";
			}
			
			echo "</table>\n";

			// ======== full list ========

			echo "<div id=\"dashboard_tickets\">\n".
				"<div class=\"dashboard_ticket\" style=\"background-color: #{$rec['color']}\">".
				"<p class=\"ticket_title\" style=\"margin-bottom: 10px\"><a href=\"?id=$id&newticket=\">új ticket</a></p>\n".
				"</div>\n";
			
			mysqli_data_seek($r, 0);
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
} else {
	include("header.php");
}

?>
</body>
</html>
