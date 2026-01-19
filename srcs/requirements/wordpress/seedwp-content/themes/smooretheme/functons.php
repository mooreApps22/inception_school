<?php
add_action('wp_enqueue_scripts', function () {
	wp_enqueue_style(
		'smooretheme-style',
		get_stylesheet_uri(),
		[],
		filemtime(get_stylesheet_directory() . '/style.css')
	);
});
?>
