<?php

$sql=mysqli_connect('localhost', 'binjomin', "2%0kc2q5d=0iZ9m", "binjomin") or die ('Hiba a csatlakozásnál!');
mysqli_set_charset($sql, "utf8");

include("functions.php");

$q="SELECT ".DB_PREFIX."tickets.id, ".DB_PREFIX."tickets.created, ".DB_PREFIX."tickets.description, ".DB_PREFIX."tickets.name as ticket_name, ".DB_PREFIX."projects.name as project_name, ".DB_PREFIX."projects.color FROM ".DB_PREFIX."tickets LEFT JOIN ".DB_PREFIX."projects ON ".DB_PREFIX."tickets.project=".DB_PREFIX."projects.id WHERE ".DB_PREFIX."tickets.open='1' ORDER BY ".DB_PREFIX."tickets.updated DESC";
$r=mysqli_query($sql, $q);

while ($rec=mysqli_fetch_array($r)) {
	$q="SELECT ".DB_PREFIX."tags.* FROM ".DB_PREFIX."ticket_tags LEFT JOIN ".DB_PREFIX."tags ON ".DB_PREFIX."ticket_tags.tag=".DB_PREFIX."tags.id WHERE ".DB_PREFIX."ticket_tags.ticket='{$rec['id']}'";
	$tags_r=mysqli_query($sql, $q);
	
	$tags=array();
	
	while ($tag_rec=mysqli_fetch_array($tags_r)) {
		$tags[]="[ {$tag_rec['tag']} ]";
	}
	
	echo "[{$rec['project_name']}] #{$rec['id']}: {$rec['ticket_name']}\n".
		(count($tags)>0?join("", $tags)."\n":"").
		"{$rec['created']}\n".
		"{$rec['description']}\n\n";
}
