<h1>Pokemon</h1>
<table>
	<caption><?php echo $pokemon['name']; ?></caption>
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
		<tr>
			<td rowspan="2"><?php echo img($pokemon['id'].'.png', $pokemon['name']); ?></td>
			<td rowspan="2"><?php echo $pokemon['id']; ?></td>
			<td rowspan="2"><?php echo $pokemon['name']; ?></td>
			<td rowspan="<?php if (sizeof($pokemon['type']) == 1) echo '2'; else echo '1' ?>"><?php echo $pokemon['type'][0]['name']; ?></td>
			<td rowspan="2"><?php echo $pokemon['hp']; ?></td>
			<td rowspan="2"><?php echo $pokemon['attack']; ?></td>
			<td rowspan="2"><?php echo $pokemon['defense']; ?></td>
			<td rowspan="2"><?php echo $pokemon['sp_attack']; ?></td>
			<td rowspan="2"><?php echo $pokemon['sp_defense']; ?></td>
			<td rowspan="2"><?php echo $pokemon['speed']; ?></td>
			<td rowspan="2"><?php echo $pokemon['description']; ?></td>
			<td rowspan="2"><?php if ($pokemon['caught']) echo img('pokeball.png', 'pokeball'); ?></td>
		</tr>
		<tr>
			<?php 
			if (sizeof($pokemon['type']) == 2) 
				echo '<td>'.$pokemon['type'][1]['name'].'</td>';
			?>
		</tr>
	</tbody>
</table>
<a href="<?php echo site_url('pokedex/'); ?>">Pokedex</a>
<a href="<?php echo site_url('user/home'); ?>">Home</a>
