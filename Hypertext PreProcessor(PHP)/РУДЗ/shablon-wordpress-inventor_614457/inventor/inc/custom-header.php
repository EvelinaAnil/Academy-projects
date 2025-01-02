<?php
/**
 * @package Inventor
 * Setup the WordPress core custom header feature.
 *
 * @uses inventor_header_style()
 * @uses inventor_admin_header_style()
 * @uses inventor_admin_header_image()

 */
function inventor_custom_header_setup() {
	add_theme_support( 'custom-header', apply_filters( 'inventor_custom_header_args', array(
		'default-text-color'     => 'fff',
		'header-text'			=> true,
		'header_textcolor'		=> true,
		'width'                  => 1600,
		'height'                 => 400,
		'wp-head-callback'       => 'inventor_header_style',
		'admin-head-callback'    => 'inventor_admin_header_style',
		'admin-preview-callback' => 'inventor_admin_header_image',
	) ) );
}
add_action( 'after_setup_theme', 'inventor_custom_header_setup' );

if ( ! function_exists( 'inventor_header_style' ) ) :
/**
 * Styles the header image and text displayed on the blog
 *
 * @see inventor_custom_header_setup().
 */
function inventor_header_style() {
	$header_text_color = get_header_textcolor();
	?>
	<style type="text/css">
	<?php
		//Check if user has defined any header image.
		if ( get_header_image() || get_header_textcolor() ) :
	?>
		#header{
			background: url(<?php echo get_header_image(); ?>) no-repeat;
			background-position: center top;
		}
		.logo h1 a { color:#<?php echo get_header_textcolor(); ?>;}
	<?php endif; ?>	
	</style>
	<?php
	// If the header text option is untouched, let's bail.
	if ( display_header_text() ) {
		return;
	}

	// If the header text has been hidden.
	?>
    <style type="text/css">
		.logo {
			margin: 0 auto 0 0;
		}

		.logo h1,
		.logo p{
			clip: rect(1px, 1px, 1px, 1px);
			position: absolute;
		}
    </style>
	
    <?php
	
}
endif; // inventor_header_style

if ( ! function_exists( 'inventor_admin_header_style' ) ) :
/**
 * Styles the header image displayed on the Appearance > Header admin panel.
 *
 * @see inventor_custom_header_setup().
 */
function inventor_admin_header_style() {?>
	<style type="text/css">
	.appearance_page_custom-header #headimg { border: none; }
	</style><?php
}
endif; // inventor_admin_header_style


add_action( 'admin_head', 'admin_header_css' );
function admin_header_css(){ ?>
	<style>pre{white-space: pre-wrap;}</style><?php
}


if ( ! function_exists( 'inventor_admin_header_image' ) ) :
/**
 * Custom header image markup displayed on the Appearance > Header admin panel.
 *
 * @see inventor_custom_header_setup().
 */
function inventor_admin_header_image() {
	$style = sprintf( ' style="color:#%s;"', get_header_textcolor() );
?>
	<div id="headimg">
		<?php if ( get_header_image() ) : ?>
		<img src="<?php header_image(); ?>" alt="">
		<?php endif; ?>
	</div>
<?php
}
endif; // inventor_admin_header_image 