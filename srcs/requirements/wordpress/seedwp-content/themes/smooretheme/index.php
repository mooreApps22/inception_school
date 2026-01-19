<?php
	get_header();
?>
<main id="site-content" role="main">
	<?php if ( have_posts() ) : ?>
	<?php while ( have_posts() ) : the_post(); ?>
	<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
	<h1 class="entry-title">
		<a href="<?php the_permalink(); ?>"><?php the_title(); ?></a>
	</h1>

	<div class="entry-content">
		<?php the_content(); ?>
	</div>
	</article>
	<?php endwhile; ?>

	<?php else : ?>
		<h1>No post found</h1>
		<p>CREATE a page or a post in the WP admin.</p>
	<?php endif; ?>
</main>
<?php
get_footer();
