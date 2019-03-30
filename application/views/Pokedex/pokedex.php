<h1>Pokedex</h1>
<form>
	<input type="text" name="name" id="name" value="">
</form>
<table>
	<caption>Pokedex</caption>
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
		for ($i = 0; $i < sizeof($id); $i += 1) {
			echo '<tr>';
			echo '<td>'.img($i.'.png', $name[$i]).'</td>';
			echo '<td>'.$id[$i].'</td>';
			echo '<td>'.$name[$i].'</td>';
			echo '<td>'.$hp[$i].'</td>';
			echo '<td>'.$attack[$i].'</td>';
			echo '<td>'.$defense[$i].'</td>';
			echo '<td>'.$sp_attack[$i].'</td>';
			echo '<td>'.$sp_defense[$i].'</td>';
			echo '<td>'.$speed[$i].'</td>';
			echo '<td>'.$description[$i].'</td>';
			echo '</tr>';
		}
		?>

	</tbody>
</table>
