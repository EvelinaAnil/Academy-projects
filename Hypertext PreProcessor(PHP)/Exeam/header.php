<!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
  <meta charset="<?php bloginfo('charset'); ?>">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title><?php bloginfo('name'); ?></title>
  <?php wp_head(); ?>
</head>
<body <?php body_class(); ?>>

<div id="page" class="site">
  <header id="masthead" class="site-header" role="banner">
    <div class="site-branding">
      <h1 class="site-title"><a href="<?php echo esc_url(home_url('header.php')); ?>" rel="home"><?php bloginfo('name'); ?></a></h1>
    </div>
    <nav id="site-navigation" class="main-navigation" role="navigation">
      <?php wp_nav_menu(array('theme_location' => 'primary', 'menu_id' => 'primary-menu')); ?>
    </nav>
  </header>

  <div id="content" class="site-content">
