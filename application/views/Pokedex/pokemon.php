<h1>Pokemon</h1>
<table>
	<caption><?php echo $pokemon['name']; ?></caption>
	<thead>
		<tr>
			<th>Appearance</th>
			<th>Id</th>
			<th>Name</th>
			<th>HP</th>
			<th>Attack</th>
			<th>Defense</th>
			<th>Special Attack</th>
			<th>Special Defense</th>
			<th>Speed</th>
			<th>Description</th>
		</tr>
	</thead>
	<tbody>

		<?php 	
		echo '<tr>';
		echo '<td>'.img($pokemon['id'].'.png', $pokemon['name']).'</td>';
		echo '<td>'.$pokemon['id'].'</td>';
		echo '<td>'.$pokemon['name'].'</td>';
		echo '<td>'.$pokemon['hp'].'</td>';
		echo '<td>'.$pokemon['attack'].'</td>';
		echo '<td>'.$pokemon['defense'].'</td>';
		echo '<td>'.$pokemon['sp_attack'].'</td>';
		echo '<td>'.$pokemon['sp_defense'].'</td>';
		echo '<td>'.$pokemon['speed'].'</td>';
		echo '<td>'.$pokemon['description'].'</td>';
		echo '</tr>';
		?>

	</tbody>
</table>