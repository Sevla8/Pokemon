<h1>Pc</h1>
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
			<th>Load</th>
		</tr>
	</thead>
	<tbody>
		<?php foreach ($pokemon_pc as $poke) { ?>
		<tr>
			<td rowspan="2"><?php echo img($poke['id_pokedex'].'.png', $poke['name']); ?></td>
			<td rowspan="2"><?php echo $poke['name']; ?></td>
			<td rowspan="<?php if (sizeof($poke['type']) == 1) echo '2'; else echo '1' ?>"><?php echo $poke['type'][0]['name']; ?></td>
			<td rowspan="2"><?php echo $poke['level']; ?></td>
			<td rowspan="2"><?php echo $poke['xp'].'/100'; ?></td>
			<td rowspan="2"><?php echo $poke['%_hp']/100*$poke['hp']*(1+$poke['level']/100).'/'.$poke['hp']*(1+$poke['level']/100); ?></td>
			<td rowspan="2"><?php echo $poke['attack']*(1+$poke['level']/100); ?></td>
			<td rowspan="2"><?php echo $poke['defense']*(1+$poke['level']/100); ?></td>
			<td rowspan="2"><?php echo $poke['sp_attack']*(1+$poke['level']/100); ?></td>
			<td rowspan="2"><?php echo $poke['sp_defense']*(1+$poke['level']/100); ?></td>
			<td rowspan="2"><?php echo $poke['speed']*(1+$poke['level']/100); ?></td>
			<td rowspan="2"><a href="<?php echo site_url('team/load/'.$poke['id']); ?>"><?php echo img('load.png', 'load'); ?></a></td>
		</tr>
		<tr>
			<?php 
			if (sizeof($poke['type']) == 2) 
				echo '<td rowspan="1">'.$poke['type'][1]['name'].'</td>';
			?>
		</tr>
		<?php } ?>
	</tbody>
</table>

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
			<th>Store</th>
		</tr>
	</thead>
	<tbody>
		<?php foreach ($pokemon_team as $poke) { ?>
		<tr>
			<td rowspan="2"><?php echo img($poke['id_pokedex'].'.png', $poke['name']); ?></td>
			<td rowspan="2"><?php echo $poke['name']; ?></td>
			<td rowspan="<?php if (sizeof($poke['type']) == 1) echo '2'; else echo '1' ?>"><?php echo $poke['type'][0]['name']; ?></td>
			<td rowspan="2"><?php echo $poke['level']; ?></td>
			<td rowspan="2"><?php echo $poke['xp'].'/100'; ?></td>
			<td rowspan="2"><?php echo $poke['%_hp']/100*$poke['hp']*(1+$poke['level']/100).'/'.$poke['hp']*(1+$poke['level']/100); ?></td>
			<td rowspan="2"><?php echo $poke['attack']*(1+$poke['level']/100); ?></td>
			<td rowspan="2"><?php echo $poke['defense']*(1+$poke['level']/100); ?></td>
			<td rowspan="2"><?php echo $poke['sp_attack']*(1+$poke['level']/100); ?></td>
			<td rowspan="2"><?php echo $poke['sp_defense']*(1+$poke['level']/100); ?></td>
			<td rowspan="2"><?php echo $poke['speed']*(1+$poke['level']/100); ?></td>
			<td rowspan="2"><a href="<?php echo site_url('team/store/'.$poke['id']); ?>"><?php echo img('store.png', 'store'); ?></a></td>
		</tr>
		<tr>
			<?php 
			if (sizeof($poke['type']) == 2) 
				echo '<td rowspan="1">'.$poke['type'][1]['name'].'</td>';
			?>
		</tr>
		<?php } ?>
	</tbody>
</table>
<a href="<?= site_url('team/') ?>">Back</a>
