<?php

include("login.php");
include("functions.php");

if ($belepve == 1 && isset($_GET['ticket']) && isset($_GET['tag'])) {
	$ticket_id=mysqli_real_escape_string($sql, $_GET['ticket']);
	$tag_id=mysqli_real_escape_string($sql, $_GET['tag']);
	
	$q="INSERT INTO ".DB_PREFIX."ticket_tags (ticket, tag) VALUES ('$ticket_id', '$tag_id')";
	mysqli_query($sql, $q) or print(mysqli_error($sql));
	
	$q="SELECT ".DB_PREFIX."tickets.id, ".DB_PREFIX."tickets.created, ".DB_PREFIX."tickets.description, ".DB_PREFIX."tickets.name as ticket_name, ".DB_PREFIX."projects.name as project_name, ".DB_PREFIX."projects.color FROM ".DB_PREFIX."tickets LEFT JOIN ".DB_PREFIX."projects ON ".DB_PREFIX."tickets.project=".DB_PREFIX."projects.id WHERE ".DB_PREFIX."tickets.id='$ticket_id'";
	$r=mysqli_query($sql, $q);
		
	$rec=mysqli_fetch_array($r);
	echo show_ticket($sql, $rec, 1);
}

?>
