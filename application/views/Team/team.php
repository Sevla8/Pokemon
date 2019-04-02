<h1>Team</h1>
<table>
	<caption>Team</caption>
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
		for ($i = 0; $i < sizeof($id); $i += 1) {
			echo '<tr>';
			echo '<td>'.img($i.'.png', $name[$i]).'</td>';
			echo '<td>'.$id[$i].'</td>';
			echo '<td>'.$level[$i].'</td>';
			echo '<td>'.$xp[$i].'</td>';
			echo '<td>'.$hp[$i].'</td>';
			echo '</tr>';
		}
		?>

	</tbody>
</table>