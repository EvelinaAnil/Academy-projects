get_header(); ?>

<div id="primary" class="content-area">
  <main id="main" class="site-main" role="main">

    <h1>Технології</h1>

    <?php
    $args = array(
      'post_type' => 'post',
      'posts_per_page' => 5,
      'category_name' => 'technology', // Назва вашої категорії технологій
    );

    $query = new WP_Query($args);

    if ($query->have_posts()) :
      while ($query->have_posts()) : $query->the_post(); ?>

        <article>
          <h2><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h2>
          <p><?php the_excerpt(); ?></p>
        </article>

      <?php endwhile;
    else :
      echo 'Новини відсутні для цієї категорії.';
    endif;

    wp_reset_postdata();
    ?>

  </main>
</div>

<?php
get_footer();
?>