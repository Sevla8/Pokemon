<h1>PC</h1>
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

		<?php print_r($pokemon);
		$tmp_id = '';
		foreach ($pokemon as $row => $poke) {
			if ($poke['id_pokemon'] != $tmp_id) {
				$tmp_id = $poke['id_pokemon'];
				echo '<tr>';
				echo '<td>'.img($poke['id_pokemon'].'.png', $poke['name_pokemon']).'</td>';
				echo '<td>'.$poke['name_pokemon'].'</td>';
				echo '<td>'.$poke['name_type'];
				if ($poke['id_pokemon'] == $pokemon[$row+1]['id_pokemon'])
					echo '/'.$pokemon[$row+1]['name_type'];
				echo '</td>';
				echo '<td>'.$poke['level'].'</td>';
				echo '<td>'.$poke['xp'].'</td>';
				echo '<td>'.$poke['%_hp']/100*$poke['hp'].'/'.$poke['hp'].'</td>';
				echo '<td>'.$poke['attack'].'</td>';
				echo '<td>'.$poke['defense'].'</td>';
				echo '<td>'.$poke['sp_attack'].'</td>';
				echo '<td>'.$poke['sp_defense'].'</td>';
				echo '<td>'.$poke['speed'].'</td>';
				echo '<td>'.$poke['description'].'</td>';
				echo '<td>'.$poke['capacity_name'];
				$tmp_capa = $poke['capacity_name'];
				for ($i = 1; $i <= 8; $i += 1) {
					if (isset($pokemon[$row+$i])) {
						if ($poke['id_pokemon'] == $pokemon[$row+$i]['id_pokemon'] && $tmp_capa != $pokemon[$row+$i]['capacity_name']) {
							echo '<br>'.$pokemon[$row+$i]['capacity_name'];
							$tmp_capa = $pokemon[$row+$i]['capacity_name'];
						}
					}
				}
				echo '</td>';
				echo '<td>'.$poke['class'];
				for ($i = 1; $i <= 8; $i += 1) {
					if (isset($pokemon[$row+$i])) {
						if ($poke['id_pokemon'] == $pokemon[$row+$i]['id_pokemon'] && $tmp_capa != $pokemon[$row+$i]['capacity_name']) {
							echo '<br>'.$pokemon[$row+$i]['class'];
							$tmp_capa = $pokemon[$row+$i]['capacity_name'];
						}
					}
				}
				echo '</td>';
				echo '<td>'.$poke['puis'];
				for ($i = 1; $i <= 8; $i += 1) {
					if (isset($pokemon[$row+$i])) {
						if ($poke['id_pokemon'] == $pokemon[$row+$i]['id_pokemon'] && $tmp_capa != $pokemon[$row+$i]['capacity_name']) {
							echo '<br>'.$pokemon[$row+$i]['puis'];
							$tmp_capa = $pokemon[$row+$i]['capacity_name'];
						}
					}
				}
				echo '</td>';
				echo '<td>'.$poke['prec'];
				for ($i = 1; $i <= 8; $i += 1) {
					if (isset($pokemon[$row+$i])) {
						if ($poke['id_pokemon'] == $pokemon[$row+$i]['id_pokemon'] && $tmp_capa != $pokemon[$row+$i]['capacity_name']) {
							echo '<br>'.$pokemon[$row+$i]['prec'];
							$tmp_capa = $pokemon[$row+$i]['capacity_name'];
						}
					}
				}
				echo '</td>';
				echo '<td>'.$poke['eff_sec'];
				for ($i = 1; $i <= 8; $i += 1) {
					if (isset($pokemon[$row+$i])) {
						if ($poke['id_pokemon'] == $pokemon[$row+$i]['id_pokemon'] && $tmp_capa != $pokemon[$row+$i]['capacity_name']) {
							echo '<br>'.$pokemon[$row+$i]['eff_sec'];
							$tmp_capa = $pokemon[$row+$i]['capacity_name'];
						}
					}
				}
				echo '</td>';
				echo '<td>'.$poke['pp'].'/'.$poke['pp_max'];
				for ($i = 1; $i <= 8; $i += 1) {
					if (isset($pokemon[$row+$i])) {
						if ($poke['id_pokemon'] == $pokemon[$row+$i]['id_pokemon'] && $tmp_capa != $pokemon[$row+$i]['capacity_name']) {
							echo '<br>'.$poke['pp'].'/'.$poke['pp_max'];
							$tmp_capa = $pokemon[$row+$i]['capacity_name'];
						}
					}
				}
				echo '</td>';
			}
		}
		?>

	</tbody>
</table>