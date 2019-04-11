<h1>Pokedex</h1>
<form method="POST">
	<label for="search">Pokemon</label>
	<input type="text" name="name" id="search" value="" autocomplete="off">
	<div id="results"></div>
	<input type="submit" name="submit" value="find">
<?php echo validation_errors(); ?>
</form>
<table border="solid">
	<caption>Pokedex</caption>
	<thead>
		<tr>
			<th>Appearance</th>
			<th>Id</th>
			<th>Name</th>
			<th>Type</th>
			<th>HP</th>
			<th>Attack</th>
			<th>Defense</th>
			<th>Special Attack</th>
			<th>Special Defense</th>
			<th>Speed</th>
			<th>Description</th>
			<th>Caught</th>
		</tr>
	</thead>
	<tbody>
		<?php foreach ($pokemon as $poke) {	?>
			<tr>
				<td rowspan="2"><?php echo img($poke['id'].'.png', $poke['name']); ?></td>
				<td rowspan="2"><?php echo $poke['id']; ?></td>
				<td rowspan="2"><?php echo $poke['name']; ?></td>
				<td rowspan="<?php if (sizeof($poke['type']) == 1) echo '2'; else echo '1' ?>"><?php echo $poke['type'][0]['name']; ?></td>
				<td rowspan="2"><?php echo $poke['hp']; ?></td>
				<td rowspan="2"><?php echo $poke['attack']; ?></td>
				<td rowspan="2"><?php echo $poke['defense']; ?></td>
				<td rowspan="2"><?php echo $poke['sp_attack']; ?></td>
				<td rowspan="2"><?php echo $poke['sp_defense']; ?></td>
				<td rowspan="2"><?php echo $poke['speed']; ?></td>
				<td rowspan="2"><?php echo $poke['description']; ?></td>
				<td rowspan="2"><?php if ($poke['caught']) echo img('pokeball.png', 'pokeball'); ?></td>
			</tr>
			<tr>
				<?php 
				if (sizeof($poke['type']) == 2) 
					echo '<td>'.$poke['type'][1]['name'].'</td>';
				?>
			</tr>
		<?php } ?>
	</tbody>
</table>
<div id="pagination"><?php echo $pagination; ?></div>
<a href="<?php echo site_url('user/home'); ?>">Home</a>
<script src="<?php echo js_url('pokedex') ?>"></script>
