<!DOCTYPE html> 
<html> 
	<head>
		<meta charset="<?php echo $charset; ?>">
		<title><?php echo $title; ?></title>
		<?php foreach ($css as $url): ?>
			<link rel="stylesheet" href="<?php echo $url; ?>">
		<?php endforeach; ?>
	</head>
	<body>
		<?php echo $output; ?>
		<?php foreach ($js as $url): ?>
			<script type="text/javascript" src="<?php echo $url; ?>"></script>
		<?php endforeach; ?>
	</body>
</html>
