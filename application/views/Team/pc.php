<h1>Pc</h1>
<table>
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
		</tr>
	</thead>
	<tbody>

		<?php
		$tmp_id = '';
		$tmp_type = '';
		$tmp_capacity = '';
		$type_counter = 0;
		$capacity_counter = 0;
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
					$poke['id_pokemon'] != $tmp_id) {
				echo $poke['capacity_name'];
				echo '</td>';
				echo '<td>';
				echo $poke['class'];
				echo '</td>';
				echo '<td>';
				echo $poke['puis'];
				echo '</td>';
				echo '<td>';
				echo $poke['prec'];
				echo '</td>';
				echo '<td>';
				echo $poke['eff_sec'];
				echo '</td>';
				echo '<td>';
				echo $poke['pp'].'/'.$poke['pp_max'];
				echo '</td>';
			}
			echo '</tr>';
			$tmp_capacity = $poke['capacity_name'];
			$capacity_couter += 1;
			
			$tmp_id = $poke['id_pokemon'];
		}
		?>

	</tbody>
</table>
