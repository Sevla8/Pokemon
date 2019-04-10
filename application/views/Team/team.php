<h1>Team</h1>
<?php
print_r($capacity);
?>

<!-- 
<table border="solid">
	<caption>PC</caption>
	<thead>
		<tr>
			<th>Appearance</th>
			<th>Name</th>
			<th>Type</th>
			<th>Level</th>
			<th>Xp</th>
			<th>Hp</th>
			<th>Attack</th>
			<th>Defense</th>
			<th>Special Attack</th>
			<th>Special Defense</th>
			<th>Speed</th>
			<th>Description</th>
			<th>Capacity</th>
			<th>Class</th>
			<th>Puissance</th>
			<th>Precision</th>
			<th>Side Effect</th>
			<th>PP</th>
			<th>Potion</th>
			<th>Postion</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td rowspan="4"><?php echo img($pokemon[0]['id_pokedex'].'.png', $pokemon[0]['name_pokemon']); ?></td>
			<td rowspan="4"><?php echo $pokemon[0]['name_pokemon']; ?></td>
			<td rowspan="2"><?php echo $pokemon[0]['name_type']; ?></td>
			<td rowspan="4"><?php echo $pokemon[0]['level']; ?></td>
			<td rowspan="4"><?php echo $pokemon[0]['xp'].'/100'; ?></td>
			<td rowspan="4"><?php echo $pokemon[0]['%_hp']/100*$pokemon[0]['hp'].'/'.$pokemon[0]['hp']; ?></td>
			<td rowspan="4"><?php echo $pokemon[0]['attack']; ?></td>
			<td rowspan="4"><?php echo $pokemon[0]['defense']; ?></td>
			<td rowspan="4"><?php echo $pokemon[0]['sp_attack']; ?></td>
			<td rowspan="4"><?php echo $pokemon[0]['sp_defense']; ?></td>
			<td rowspan="4"><?php echo $pokemon[0]['speed']; ?></td>
			<td rowspan="4"><?php echo $pokemon[0]['description']; ?></td>
			<td><?php echo $pokemon[0]['capacity_name']; ?></td>
			<td><?php echo $pokemon[0]['class']; ?></td>
			<td><?php echo $pokemon[0]['puis']; ?></td>
			<td><?php echo $pokemon[0]['prec']; ?></td>
			<td><?php echo $pokemon[0]['eff_sec']; ?></td>
			<td><?php echo $pokemon[0]['pp']; ?></td>
			<td rowspan="4"><?php echo '<a href="'.site_url('team/potion/'.$pokemon[0]['id_pokemon']).'">use</a>'; ?></td>
			<td rowspan="<?php if ($pokemon[0]['in_team'] == 1 || $pokemon[0]['id_pokemon'] == 6) echo '4'; else echo '2'; ?>">
				<?php 
				if ($pokemon[0]['in_team'] == 1) 
					echo '<a href="'.site_url('team/move_down/'.$pokemon[0]['id_pokemon']).'">move down</a>'; 
				else if ($pokemon[0]['in_team'] == 6)
					echo '<a href="'.site_url('team/move_up/'.$pokemon[0]['id_pokemon']).'">move up</a>';
				else 
					echo '<a href="'.site_url('team/move_up/'.$pokemon[0]['id_pokemon']).'">move up</a>';
				?></td>
		</tr>
		<tr>
			<td><?php echo $pokemon[4]['capacity_name']; ?></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td rowspan="2"><?php echo $pokemon[1]['name_type']; ?></td>
			<td><?php echo $pokemon[8]['capacity_name']; ?></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<?php 
			if ($pokemon[0]['in_team'] != 1 && $pokemon[0]['id_pokemon'] != 6)
				echo '<td rowspan="2"><a href="'.site_url('team/move_down/'.$pokemon[0]['id_pokemon']).'">move down</a></td>';
			?>
		</tr>
		<tr>
			<td><?php echo $pokemon[12]['capacity_name']; ?></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>

	</tbody>
</table>
 -->