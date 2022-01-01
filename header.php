<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="Content-type" content="text/html; charset=utf-8"/>
<meta name="mobile-web-app-capable" content="yes">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<?php

if (!isset($html_title)) {
	$html_title="Chovato";
} else {
	$html_title="Chovato – $html_title";
}

?>
<title><?php echo $html_title; ?></title>
<link rel="stylesheet" href="chovato.css?<? echo rand(0, 1000) ?>">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="js/jscolor.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="chovato.js?<? echo rand(0, 1000) ?>"></script>
</head>
<body>
