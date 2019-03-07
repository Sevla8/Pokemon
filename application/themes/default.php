<!DOCTYPE html> 
<html> 
	<head>
		<meta charset="<?php echo $charset; ?>">
		<title><?php echo $titre; ?></title>
		<?php foreach ($css as $url): ?>
			<link rel="stylesheet" type="text/css" href="<?php echo $url; ?>">
		<?php endforeach; ?>
	</head>
	<body>
		<div id="container">
			<?php echo $output; ?>
		</div>
		<?php foreach ($js as $url): ?>
			<script type="text/javascript" src="<?php echo $url; ?>"></script>
		<?php endforeach; ?>
	</body>
</html>