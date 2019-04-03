<h1>Pokedex</h1>
<form method="POST" action="<?php echo site_url('pokedex/get_pokedex_pokemon'); ?>">
	<input type="text" name="name" id="search" value="" autocomplete="off">
	<div id="results"></div>
	<input type="submit" name="submit" value="find">
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
		foreach ($pokemons as $pokemon) {	
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
		}
		?>

	</tbody>
</table>
<script src="<?php echo js_url('pokedex') ?>"></script>