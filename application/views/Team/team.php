<h1>Team</h1>
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

		<?php 

		print_r($pokemon);


		/*$tmp_id = '';
		$tmp_type = '';
		$tmp_capacity = '';
		$type_counter = 0;
		$capacity_counter = 0;
		$move_counter = 0;
		foreach ($pokemon as $row => $poke) {
			if ($tmp_id != $poke['id_pokemon']) {
				$type_counter = 0;
				$capacity_couter = 0;
			}
			echo '<tr>';
			echo '<td>';
			if ($poke['id_pokemon'] != $tmp_id)
				echo img($poke['id_pokedex'].'.png', $poke['name_pokemon']);
			echo '</td>';
			echo '<td>';
			if ($poke['id_pokemon'] != $tmp_id)
				echo $poke['name_pokemon'];
			echo '</td>';
			echo '<td>';
			if (($poke['id_pokemon'] == $tmp_id && $tmp_type != $poke['name_type'] && $type_counter < 2) ||
					$poke['id_pokemon'] != $tmp_id)
				echo $poke['name_type'];
			$tmp_type = $poke['name_type'];
			$type_counter += 1;
			echo '</td>';
			echo '<td>';
			if ($poke['id_pokemon'] != $tmp_id)
				echo $poke['level'];
			echo '</td>';
			echo '<td>';
			if ($poke['id_pokemon'] != $tmp_id)
				echo $poke['xp'];
			echo '</td>';
			echo '<td>';
			if ($poke['id_pokemon'] != $tmp_id)
				echo $poke['%_hp']/100*$poke['hp'].'/'.$poke['hp'];
			echo '</td>';
			echo '<td>';
			if ($poke['id_pokemon'] != $tmp_id)
				echo $poke['attack'];
			echo '</td>';
			echo '<td>';
			if ($poke['id_pokemon'] != $tmp_id)
				echo $poke['defense'];
			echo '</td>';
			echo '<td>';
			if ($poke['id_pokemon'] != $tmp_id)
				echo $poke['sp_attack'];
			echo '</td>';
			echo '<td>';
			if ($poke['id_pokemon'] != $tmp_id)
				echo $poke['sp_defense'];
			echo '</td>';
			echo '<td>';
			if ($poke['id_pokemon'] != $tmp_id)
				echo $poke['speed'];
			echo '</td>';
			echo '<td>';
			if ($poke['id_pokemon'] != $tmp_id)
				echo $poke['description'];
			echo '</td>';
			echo '<td>';
			if (($poke['id_pokemon'] == $tmp_id && $tmp_capacity != $poke['capacity_name'] && $capacity_counter < 4) ||
					$poke['id_pokemon'] != $tmp_id)
				echo $poke['capacity_name'];
			echo '</td>';
			echo '<td>';
			if (($poke['id_pokemon'] == $tmp_id && $tmp_capacity != $poke['capacity_name'] && $capacity_counter < 4) ||
					$poke['id_pokemon'] != $tmp_id)
				echo $poke['class'];
			echo '</td>';
			echo '<td>';
			if (($poke['id_pokemon'] == $tmp_id && $tmp_capacity != $poke['capacity_name'] && $capacity_counter < 4) ||
					$poke['id_pokemon'] != $tmp_id)
				echo $poke['puis'];
			echo '</td>';
			echo '<td>';
			if (($poke['id_pokemon'] == $tmp_id && $tmp_capacity != $poke['capacity_name'] && $capacity_counter < 4) ||
					$poke['id_pokemon'] != $tmp_id)
				echo $poke['prec'];
			echo '</td>';
			echo '<td>';
			if (($poke['id_pokemon'] == $tmp_id && $tmp_capacity != $poke['capacity_name'] && $capacity_counter < 4) ||
					$poke['id_pokemon'] != $tmp_id)
				echo $poke['eff_sec'];
			echo '</td>';
			echo '<td>';
			if (($poke['id_pokemon'] == $tmp_id && $tmp_capacity != $poke['capacity_name'] && $capacity_counter < 4) ||
					$poke['id_pokemon'] != $tmp_id)
				echo $poke['pp'].'/'.$poke['pp_max'];
			echo '</td>';
			$tmp_capacity = $poke['capacity_name'];
			$capacity_couter += 1;
			echo '<td>';
			if ($poke['id_pokemon'] != $tmp_id)
				echo '<a href="'.site_url('team/potion/'.$poke['id_pokemon']).'">use</a>';
			echo '</td>';
			// echo '<td>';
			// if ($move_counter == 0) {
			// 	echo '<a href="'.site_url('team/move_up/'.$poke['id_pokemon']).'">move up</a>';
			// }
			// if ($move_counter == 1) {
			// 	echo '<a href="'.site_url('team/move_down/'.$poke['id_pokemon']).'">move down</a>';
			// }
			// echo '</td>';
			
			// $move_counter += 1;
			// if ($move_counter == 4)
			// 	$move_counter = 0;
			
			echo '</tr>';
			
			$tmp_id = $poke['id_pokemon'];
		}*/
		?>

	</tbody>
</table>
