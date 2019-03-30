<h1>A wild Pokemon appears !</h1>
<p>a wild <?php echo $name.' appears !' ?></p>
<p><?php echo img($id.'.png', $name) ?></p>
<a href="<?php echo site_url('hunt/pokeball') ?>">Pokeball</a>
<a href="<?php echo site_url('user/home/') ?>">Run</a>
<a href="<?php echo site_url('fight/') ?>">Fight</a>
<a href="<?php echo site_url('hunt/pokedex') ?>">Pokedex</a>