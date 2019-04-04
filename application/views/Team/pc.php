<h1>PC</h1>
<table>
	<caption>PC</caption>
	<thead>
		<tr>
			<th>Appearance</th>
			<th>Id</th>
			<th>Level</th>
			<th>Xp</th>
			<th>Hp</th>
		</tr>
	</thead>
	<tbody>

		<?php 
		print_r($pokemon);
		// foreach ($pokemon as $poke) {	
		// 	echo '<tr>';
		// 	echo '<td>'.img($poke['id'].'.png', $poke['name']).'</td>';
		// 	echo '<td>'.$poke['id'].'</td>';
		// 	echo '<td>'.$poke['name'].'</td>';
		// 	echo '<td>'.$poke['hp'].'</td>';
		// 	echo '<td>'.$poke['attack'].'</td>';
		// 	echo '<td>'.$poke['defense'].'</td>';
		// 	echo '<td>'.$poke['sp_attack'].'</td>';
		// 	echo '<td>'.$poke['sp_defense'].'</td>';
		// 	echo '<td>'.$poke['speed'].'</td>';
		// 	echo '<td>'.$poke['description'].'</td>';
		// 	echo '<td>';
		// 	foreach ($caught as $ball) {
		// 		if (in_array($poke['id'], $ball))
		// 			echo img('pokeball.png', 'pokeball').'</td>';
		// 	}
		// 	echo '</tr>';
		// }
		?>

	</tbody>
</table>