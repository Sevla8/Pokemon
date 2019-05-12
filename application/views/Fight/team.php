<h1>Team</h1>
<table border="solid">
	<caption>Team</caption>
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
			<th>Capacity</th>
			<th>Class</th>
			<th>Puissance</th>
			<th>Precision</th>
			<th>Side Effect</th>
			<th>PP</th>
			<th>Postion</th>
		</tr>
	</thead>
	<tbody>
		<?php foreach ($pokemon as $poke) { ?>
		<tr>
			<td rowspan="4"><?php echo img($poke['id_pokedex'].'.png', $poke['name']); ?></td>
			<td rowspan="4"><?php echo $poke['name']; ?></td>
			<td rowspan="<?php if (sizeof($poke['type']) == 1) echo '4'; else echo '2' ?>"><?php echo $poke['type'][0]['name']; ?></td>
			<td rowspan="4"><?php echo $poke['level']; ?></td>
			<td rowspan="4"><?php echo $poke['xp'].'/100'; ?></td>
			<td rowspan="4"><?php echo $poke['%_hp']/100*$poke['hp']*(1+$poke['level']/100).'/'.$poke['hp']*(1+$poke['level']/100); ?></td>
			<td rowspan="4"><?php echo $poke['attack']*(1+$poke['level']/100); ?></td>
			<td rowspan="4"><?php echo $poke['defense']*(1+$poke['level']/100); ?></td>
			<td rowspan="4"><?php echo $poke['sp_attack']*(1+$poke['level']/100); ?></td>
			<td rowspan="4"><?php echo $poke['sp_defense']*(1+$poke['level']/100); ?></td>
			<td rowspan="4"><?php echo $poke['speed']*(1+$poke['level']/100); ?></td>
			<td><?php if (isset($poke['capacity']) && isset($poke['capacity'][0])) echo $poke['capacity'][0]['name']; ?></td>
			<td><?php if (isset($poke['capacity']) && isset($poke['capacity'][0])) echo $poke['capacity'][0]['class']; ?></td>
			<td><?php if (isset($poke['capacity']) && isset($poke['capacity'][0])) echo $poke['capacity'][0]['puis']; ?></td>
			<td><?php if (isset($poke['capacity']) && isset($poke['capacity'][0])) echo $poke['capacity'][0]['prec']; ?></td>
			<td><?php if (isset($poke['capacity']) && isset($poke['capacity'][0])) echo $poke['capacity'][0]['eff_sec']; ?></td>
			<td><?php if (isset($poke['capacity']) && isset($poke['capacity'][0])) echo $poke['capacity'][0]['nb_pp'].'/'.$poke['capacity'][0]['pp']; ?></td>
			<td rowspan="<?php if ($poke['in_team'] == 1 || $poke['in_team'] == 6) echo '4'; else echo '2'; ?>">
				<?php
				if ($poke['in_team'] == 1)
					echo '<a href="'.site_url('fight/move_down/'.$poke['id']).'">'.img('down.png', 'down').'</a>';
				else
					echo '<a href="'.site_url('fight/move_up/'.$poke['id']).'">'.img('up.png', 'up').'</a>';
				?>
			</td> 
		</tr>
		<tr>
			<td><?php if (isset($poke['capacity']) && isset($poke['capacity'][1])) echo $poke['capacity'][1]['name']; ?></td>
			<td><?php if (isset($poke['capacity']) && isset($poke['capacity'][1])) echo $poke['capacity'][1]['class']; ?></td>
			<td><?php if (isset($poke['capacity']) && isset($poke['capacity'][1])) echo $poke['capacity'][1]['puis']; ?></td>
			<td><?php if (isset($poke['capacity']) && isset($poke['capacity'][1])) echo $poke['capacity'][1]['prec']; ?></td>
			<td><?php if (isset($poke['capacity']) && isset($poke['capacity'][1])) echo $poke['capacity'][1]['eff_sec']; ?></td>
			<td><?php if (isset($poke['capacity']) && isset($poke['capacity'][1])) echo $poke['capacity'][1]['nb_pp'].'/'.$poke['capacity'][1]['pp']; ?></td>
		</tr>
		<tr>
			<?php 
			if (sizeof($poke['type']) == 2) 
				echo '<td rowspan="2">'.$poke['type'][1]['name'].'</td>';
			?>
			<td><?php if (isset($poke['capacity']) && isset($poke['capacity'][2])) echo $poke['capacity'][2]['name']; ?></td>
			<td><?php if (isset($poke['capacity']) && isset($poke['capacity'][2])) echo $poke['capacity'][2]['class']; ?></td>
			<td><?php if (isset($poke['capacity']) && isset($poke['capacity'][2])) echo $poke['capacity'][2]['puis']; ?></td>
			<td><?php if (isset($poke['capacity']) && isset($poke['capacity'][2])) echo $poke['capacity'][2]['prec']; ?></td>
			<td><?php if (isset($poke['capacity']) && isset($poke['capacity'][2])) echo $poke['capacity'][2]['eff_sec']; ?></td>
			<td><?php if (isset($poke['capacity']) && isset($poke['capacity'][2])) echo $poke['capacity'][2]['nb_pp'].'/'.$poke['capacity'][2]['pp']; ?></td>
			<?php 
			if ($poke['in_team'] != 1 && $poke['in_team'] != 6)
				echo '<td rowspan="2"><a href="'.site_url('fight/move_down/'.$poke['id']).'">'.img('down.png', 'down').'</a></td>';
			?> 
		</tr>
		<tr>
			<td><?php if (isset($poke['capacity']) && isset($poke['capacity'][3])) echo $poke['capacity'][3]['name']; ?></td>
			<td><?php if (isset($poke['capacity']) && isset($poke['capacity'][3])) echo $poke['capacity'][3]['class']; ?></td>
			<td><?php if (isset($poke['capacity']) && isset($poke['capacity'][3])) echo $poke['capacity'][3]['puis']; ?></td>
			<td><?php if (isset($poke['capacity']) && isset($poke['capacity'][3])) echo $poke['capacity'][3]['prec']; ?></td>
			<td><?php if (isset($poke['capacity']) && isset($poke['capacity'][3])) echo $poke['capacity'][3]['eff_sec']; ?></td>
			<td><?php if (isset($poke['capacity']) && isset($poke['capacity'][3])) echo $poke['capacity'][3]['nb_pp'].'/'.$poke['capacity'][3]['pp']; ?></td>
		</tr>
		<?php } ?>
	</tbody>
</table>
<a href="<?= site_url('fight/change_pokemon/') ?>">Ready</a>
