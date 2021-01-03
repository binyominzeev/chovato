<?php

define("DB_PREFIX", "chovato_");
//define("DB_PREFIX", "");

include("Parsedown.php");
$Parsedown=new Parsedown();

function my_header($title, $link="index.php") {
	if (isset($_GET['closed']) && $_GET['closed'] == 1) {
		$closed="<a href=\"".add_parameter("closed", 0)."\">nyitott</a> | ";
	} else {
		$closed="<a href=\"".add_parameter("closed", 1)."\">lezárt</a> | ";
	}
	
	return "<div id=\"loginmenu\">".
		"<span class=\"left\"><a href=\"$link\">$title</a></span>\n".
		"<span class=\"right\">üdv, {$_SESSION['name']}! ".
		$closed.
		"<a href=\"logout.php\">kilépés</a></span></div>\n";
}

function add_parameter($name, $value) {
	$url=$_SERVER['SCRIPT_NAME'];
	
	$params=array();
	$added=0;
	
	foreach ($_GET as $key => $val) {
		if ($key == $name) {
			$params[]="$name=$value";
			$added=1;
		} else {
			$params[]="$key=$val";
		}
	}
	
	if ($added == 0) {
		$params[]="$name=$value";
	}
	
	$url=$url."?".implode("&", $params);
	return $url;
}

function show_ticket($sql, $rec, $without_div=0, $without_tooltip=0) {
	global $Parsedown;
	
	$q="SELECT ".DB_PREFIX."tags.* FROM ".DB_PREFIX."ticket_tags LEFT JOIN ".DB_PREFIX."tags ON ".DB_PREFIX."ticket_tags.tag=".DB_PREFIX."tags.id WHERE ".DB_PREFIX."ticket_tags.ticket='{$rec['id']}'";
	$r=mysqli_query($sql, $q);
	
	$tags=array();
	
	while ($tag_rec=mysqli_fetch_array($r)) {
		$tags[]="<div class=\"dashboard_project\" style=\"background-color: #{$tag_rec['color']}\">".
			"<a href=\"projects.php?id={$tag_rec['project']}&tag={$tag_rec['id']}\">{$tag_rec['tag']}</a>".
			"</div>\n";
	}
	
	return ($without_div==0?"<div id=\"ticket_{$rec['id']}\" class=\"dashboard_ticket droppable ui-widget-header\"".($without_tooltip==0?" title=\"{$rec['project_name']}\"":"")." style=\"background-color: #{$rec['color']}\">":"").
		"<p class=\"ticket_title\"><a href=\"tickets.php?id={$rec['id']}\">#{$rec['id']}: {$rec['ticket_name']}</a></p>\n".
		(count($tags)>0?join("", $tags):"").
		"<p class=\"ticket_date\">{$rec['created']}</p>\n".
		"<p class=\"ticket_desc\">".$Parsedown->text($rec['description'])."</p>\n".
		($without_div==0?"</div>\n":"");
}	

function show_projects($sql) {
	$q="SELECT * FROM ".DB_PREFIX."projects WHERE closed=0";
	$r=mysqli_query($sql, $q);
	
	echo "<div id=\"dashboard_projects\">".
		"<form method=\"get\" action=\"?\">\n".
		"<input name=\"newproj\" type=\"hidden\" id=\"color_value\" value=\"ffffff\">".
		"<button class=\"jscolor {valueElement:'color_value', onFineChange:'setTextColor(this);'}\" onchange=''>új projekt</button>\n".
		"<input type=\"submit\" value=\"Rajta\">\n".
		"</form>";
	
	while ($rec=mysqli_fetch_array($r)) {
		echo "<div class=\"dashboard_project\" style=\"background-color: #{$rec['color']}\">".
			"<a href=\"projects.php?id={$rec['id']}\">{$rec['name']}</a>".
			"</div>\n";
	}
		
	echo "</div>\n";	
}

function show_tags($sql, $id) {
	$q="SELECT * FROM ".DB_PREFIX."tags WHERE project='$id'";
	$r=mysqli_query($sql, $q);
	
	echo "<div id=\"dashboard_projects\">".
		"<form method=\"get\" action=\"?\">\n".
		"<input name=\"id\" type=\"hidden\" value=\"$id\">".
		"<input name=\"newtag\" type=\"hidden\" id=\"color_value\" value=\"ffffff\">".
		"<button class=\"jscolor {valueElement:'color_value', onFineChange:'setTextColor(this);'}\" onchange=''>új tag</button>\n".
		"<input type=\"submit\" value=\"Rajta\">\n".
		"</form>";
	
	while ($rec=mysqli_fetch_array($r)) {
		echo "<div id=\"tag_{$rec['id']}\" class=\"dashboard_project draggable ui-widget-content\" style=\"background-color: #{$rec['color']}\">".
			"<a href=\"projects.php?id=$id&tag={$rec['id']}\">{$rec['tag']}</a>".
			"</div>\n";
	}
		
	echo "</div>\n";	
}

function brighter($color) {
	list($r, $g, $b) = sscanf($color, "%02x%02x%02x");

	$inv_r=255-$r;
	$inv_g=255-$g;
	$inv_b=255-$b;
	
	$length=sqrt($inv_r**2+$inv_g**2+$inv_b**2);
	
	$inv_r/=$length;
	$inv_g/=$length;
	$inv_b/=$length;
	
	$amount=80;
	
	$inv_r*=$amount;
	$inv_g*=$amount;
	$inv_b*=$amount;
	
	$r=255-$inv_r;
	$g=255-$inv_g;
	$b=255-$inv_b;

	$color=sprintf("%02x%02x%02x", $r, $g, $b);
	
	return $color;
}

?>
