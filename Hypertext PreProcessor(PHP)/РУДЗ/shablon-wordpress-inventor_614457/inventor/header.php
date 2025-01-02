 <?php
/**
 * The Header for our theme.
 *
 * Displays all of the <head> section and everything up till <div id="content">
 *
 * @package Inventor
 */
?><!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
<meta charset="<?php bloginfo( 'charset' ); ?>">
<meta name="viewport" content="width=device-width">
<link rel="profile" href="http://gmpg.org/xfn/11">
<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>">
<?php wp_head(); ?>
</head>

<body <?php body_class(); ?>>
		<div id="topbar">
			<div class="container">	
				<div class="row">
					<div class="col-md-6 col-sm-12 col-sm-5">
						<div class="callus">
                        <?php if(get_theme_mod('firstcol_text',true) != '') { ?>
							<i class="fa fa-phone-square"></i><p><?php echo esc_attr(get_theme_mod('call_text',__('Call Us Free :','inventor'))); ?> <?php echo esc_attr( get_theme_mod('firstcol_text','1234-567-890')); ?></p>
                        <?php } ?>
						</div>
					</div>	
					<div class="col-md-6 col-sm-12 col-sm-3">
						<div class="top-social">
                        	<div class="social-icons">
                            	<?php if(get_theme_mod('rss_link',true) != '') { ?>
									<a title="rss" class="fa fa-rss fa-2x" target="_blank" href="<?php echo esc_url(get_theme_mod('rss_link','#')); ?>"></a>
                                <?php } ?>
                                <?php if(get_theme_mod('twitt_link',true) != '') { ?>
                                	<a title="twitter" class="fa fa-twitter fa-2x" target="_blank" href="<?php echo esc_url(get_theme_mod('twitt_link','#')); ?>"></a>
                                <?php } ?>
                                <?php if(get_theme_mod('pint_link',true) != '') { ?>
                                	<a title="pinterest-p" class="fa fa-pinterest-p fa-2x" target="_blank" href="<?php echo esc_url(get_theme_mod('pint_link','#')); ?>"></a>
                                <?php } ?>
                                <?php if(get_theme_mod('fb_link',true) != '') { ?>
                                	<a title="facebook" class="fa fa-facebook fa-2x" target="_blank" href="<?php echo esc_url(get_theme_mod('fb_link','#')); ?>"></a> 
                                <?php } ?>
                        </div>
						<div class="clear"></div>
                       </div>
					</div>
				</div>
			</div>			
		</div>		
		
		<div id="header">
            <div class="container">	
						<div class="logo">
							<?php inventor_the_custom_logo(); ?>
						<h1><a href="<?php echo esc_url( home_url( '/' ) ); ?>" rel="home"><?php esc_attr(bloginfo( 'name' )); ?></a></h1>

					<?php $description = get_bloginfo( 'description', 'display' );
					if ( $description || is_customize_preview() ) : ?>
						<p><?php echo $description; ?></p>
					<?php endif; ?>
                    </div>
						<div class="toggle">
							<a class="toggleMenu" href="#"><?php _e('Menu','inventor'); ?></a>
						</div> 						
						<div class="main-nav">
							<?php wp_nav_menu( array('theme_location'  => 'primary') ); ?>							
						</div><div class="clear"></div>						
            </div><!--container--> 
            <div class="header-shadow"></div>
		</div><!-- header -->
        
		
<?php if ( is_front_page() && !is_home() ) { ?>
	<?php $hideslide = get_theme_mod('hide_slider', '1'); ?>
		<?php if($hideslide == ''){ ?>
                <!-- Slider Section -->
                <?php for($sld=7; $sld<10; $sld++) { ?>
                	<?php if( get_theme_mod('page-setting'.$sld)) { ?>
                	<?php $slidequery = new WP_query('page_id='.get_theme_mod('page-setting'.$sld,true)); ?>
                	<?php while( $slidequery->have_posts() ) : $slidequery->the_post();
                			$image = wp_get_attachment_url( get_post_thumbnail_id($post->ID));
                			$img_arr[] = $image;
               				$id_arr[] = $post->ID;
                		endwhile;
                	}
                }
                ?>
<?php if(!empty($id_arr)){ ?>
        <div id="slider" class="nivoSlider">
            <?php 
            $i=1;
            foreach($img_arr as $url){ ?>
            <?php if(!empty($url)){ ?>
            <img src="<?php echo $url; ?>" title="#slidecaption<?php echo $i; ?>" />
            <?php }else{ ?>
            <img src="<?php echo esc_url( get_template_directory_uri() ) ; ?>/images/slides/default-slide.jpg" title="#slidecaption<?php echo $i; ?>" />
            <?php } ?>
            <?php $i++; }  ?>
        </div>   
<?php 
	$i=1;
		foreach($id_arr as $id){ 
		$title = get_the_title( $id ); 
		$post = get_post($id); 
		$content = apply_filters('the_content', substr(strip_tags($post->post_content), 0, 150)); 
?>                 
<div id="slidecaption<?php echo $i; ?>" class="nivo-html-caption">
    <div class="top-bar">
    	<h2><?php echo $title; ?></a></h2>
    	<?php echo $content; ?>
        <a class="read-more" href="<?php the_permalink(); ?>"><?php echo esc_attr(get_theme_mod('slidelink_text','Read More')); ?></a>
    </div>
</div>      
    <?php $i++; } ?>       
     </div>
<div class="clear"></div>        
</section>
<?php } else { ?>
<div class="slider-wrapper theme-default">
    <div id="slider" class="nivoSlider">
    <img src="<?php echo esc_url( get_template_directory_uri() ) ; ?>/images/slides/slider1.jpg" alt="" title="#slidecaption1" />
    <img src="<?php echo esc_url( get_template_directory_uri() ) ; ?>/images/slides/slider2.jpg" alt="" title="#slidecaption2" />
    <img src="<?php echo esc_url( get_template_directory_uri() ) ; ?>/images/slides/slider3.jpg" alt="" title="#slidecaption3" />
    </div>                    
      <div id="slidecaption1" class="nivo-html-caption">
        <div class="top-bar">
                <h2><?php esc_html_e('Welcome to Inventor.','inventor'); ?></h2>
                <p><?php esc_html_e('For setup slider go to Appearace >> Customize >> Slider Settings >> Here you can select the pages for slider.','inventor'); ?></p>
        </div>
        </div>
        
        <div id="slidecaption2" class="nivo-html-caption">
            <div class="top-bar">
                   <h2><?php esc_html_e('Architecture Inventory','inventor'); ?></h2>
                <p><?php esc_html_e('For setup slider go to Appearace >> Customize >> Slider Settings >> Here you can select the pages for slider.','inventor'); ?></p>
            </div>
        </div>
        
        <div id="slidecaption3" class="nivo-html-caption">
            <div class="top-bar">
                    <h2><?php esc_html_e('Get 24x7 Support.','inventor'); ?></h2>
                <p><?php esc_html_e('For setup slider go to Appearace >> Customize >> Slider Settings >> Here you can select the pages for slider.','inventor'); ?></p>
            </div>
        </div>
<div class="clear"></div>
<!-- Slider Section -->
<?php } } } ?>

      <div class="main-container">
         <?php if( function_exists('is_woocommerce') && is_woocommerce() ) { ?>
		 	<div class="content-area">
                <div class="middle-align content_sidebar">
                	<div id="sitemain" class="site-main">
         <?php } ?>