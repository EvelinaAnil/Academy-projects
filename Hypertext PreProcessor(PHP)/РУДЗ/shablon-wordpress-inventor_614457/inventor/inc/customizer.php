<?php
/**
 * Inventor Theme Customizer
 *
 * @package Inventor
 */

/**
 * Add postMessage support for site title and description for the Theme Customizer.
 *
 * @param WP_Customize_Manager $wp_customize Theme Customizer object.
 */
function inventor_customize_register( $wp_customize ) {

//Add a class for titles
    class inventor_info extends WP_Customize_Control {
        public $type = 'info';
        public $label = '';
        public function render_content() {
        ?>
			<h3 style="text-decoration: underline; color: #DA4141; text-transform: uppercase;"><?php echo esc_html( $this->label ); ?></h3>
        <?php
        }
    }
	
	$wp_customize->get_setting( 'blogname' )->transport         = 'postMessage';
	$wp_customize->get_setting( 'blogdescription' )->transport  = 'postMessage';
		
	$wp_customize->add_setting('color_scheme', array(
		'default' => '#efc62c',
		'sanitize_callback'	=> 'sanitize_hex_color',
	));
	
	$wp_customize->add_control(
		new WP_Customize_Color_Control($wp_customize,'color_scheme',array(
			'label' => __('Color Scheme','inventor'),
			'section' => 'colors',
			'settings' => 'color_scheme'
		))
	);
	
	$wp_customize->add_section('contact_sec',array(
		'title'	=> __('Contact Details','inventor'),
		'description'	=> __('Add contact details here.','inventor'),
		'priority'		=> null
	));
	
	$wp_customize->add_setting('call_text',array(
		'default'	=> __('Call Us Free :','inventor'),
		'sanitize_callback'	=> 'sanitize_text_field'
	));
	
	$wp_customize->add_control('call_text',array(
		'label'	=> __('Add phone number here','inventor'),
		'description'	=> __('Add call text here','inventor'),
		'section'	=> 'contact_sec',
		'setting'	=> 'call_text',
		'type'		=> 'text'
	));
	
	$wp_customize->add_setting('firstcol_text',array(
		'default'	=> __('12 8888 6666','inventor'),
		'sanitize_callback'	=> 'sanitize_text_field'
	));
	
	$wp_customize->add_control('firstcol_text',array(
		'description'	=> __('Add phone number here','inventor'),
		'section'	=> 'contact_sec',
		'setting'	=> 'firstcol_text',
		'type'		=> 'text'
	));
	
	$wp_customize->add_setting('rss_link',array(
		'default'	=> __('#','inventor'),
		'sanitize_callback'	=> 'esc_url_raw'
	));
	
	$wp_customize->add_control('rss_link',array(
		'label'	=> __('Add social icons link here','inventor'),
		'description'	=> __('Add RSS link here','inventor'),
		'section'	=> 'contact_sec',
		'setting'	=> 'rss_link',
		'type'		=> 'text'
	));
	
	$wp_customize->add_setting('pint_link',array(
		'default'	=> __('#','inventor'),
		'sanitize_callback'	=> 'esc_url_raw'
	));
	
	$wp_customize->add_control('pint_link',array(
		'description'	=> __('Add pinterest link here','inventor'),
		'section'	=> 'contact_sec',
		'setting'	=> 'pint_link',
		'type'		=> 'text'
	));
	
	$wp_customize->add_setting('twitt_link',array(
		'default'	=> __('#','inventor'),
		'sanitize_callback'	=> 'esc_url_raw'
	));
	
	$wp_customize->add_control('twitt_link',array(
		'description'	=> __('Add twitter link here','inventor'),
		'section'	=> 'contact_sec',
		'setting'	=> 'twitt_link',
		'type'		=> 'text'
	));
	
	$wp_customize->add_setting('fb_link',array(
		'default'	=> __('#','inventor'),
		'sanitize_callback'	=> 'esc_url_raw'
	));
	
	$wp_customize->add_control('fb_link',array(
		'description'	=> __('Add facebok link here','inventor'),
		'section'	=> 'contact_sec',
		'setting'	=> 'fb_link',
		'type'		=> 'text'
	));

	
	// Slider Section Start		
	$wp_customize->add_section(
        'slider_section',
        array(
            'title' => __('Slider Settings', 'inventor'),
            'priority' => null,
			'description'	=> __('Recommended image size (1420x567)','inventor'),	
        )
    );
	
	$wp_customize->add_setting('page-setting7',array(
			'default' => '0',
			'capability' => 'edit_theme_options',
			'sanitize_callback'	=> 'absint'
	));
	
	$wp_customize->add_control('page-setting7',array(
			'type'	=> 'dropdown-pages',
			'label'	=> __('Select page for slide one:','inventor'),
			'section'	=> 'slider_section'
	));	
	
	$wp_customize->add_setting('page-setting8',array(
			'default' => '0',
			'capability' => 'edit_theme_options',	
			'sanitize_callback'	=> 'absint'
	));
	
	$wp_customize->add_control('page-setting8',array(
			'type'	=> 'dropdown-pages',
			'label'	=> __('Select page for slide two:','inventor'),
			'section'	=> 'slider_section'
	));	
	
	$wp_customize->add_setting('page-setting9',array(
			'default' => '0',
			'capability' => 'edit_theme_options',	
			'sanitize_callback'	=> 'absint '
	));
	
	$wp_customize->add_control('page-setting9',array(
			'type'	=> 'dropdown-pages',
			'label'	=> __('Select page for slide three:','inventor'),
			'section'	=> 'slider_section'
	));	
	
	
	$wp_customize->add_setting('hide_slider',array(
			'default' => true,
			'sanitize_callback' => 'sanitize_text_field',
			'capability' => 'edit_theme_options',
	));	 

	$wp_customize->add_control( 'hide_slider', array(
		   'settings' => 'hide_slider',
    	   'section'   => 'slider_section',
    	   'label'     => __('Check this to hide slider','inventor'),
    	   'type'      => 'checkbox'
     ));
	 
	 $wp_customize->add_setting('slidelink_text',array(
			'default' => __('Read More','inventor'),
			'sanitize_callback' => 'sanitize_text_field',
	));	 

	$wp_customize->add_control( 'slidelink_text', array(
		   'settings' => 'slidelink_text',
    	   'section'   => 'slider_section',
    	   'label'     => __('Add slide link text.','inventor'),
    	   'type'      => 'text'
     ));	
	
	// Slider Section End
	
	$wp_customize->add_section('footer_section',array(
		'title'	=> __('Footer Text','inventor'),
		'description'	=> __('Add some text for footer like copyright etc.','inventor'),
		'priority'	=> null
	));
	
	$wp_customize->add_setting('footer_copy',array(
		'default'	=> __('Inventor 2016 | All Rights Reserved.','inventor'),
		'sanitize_callback'	=> 'sanitize_text_field',
	));
	
	$wp_customize->add_control('footer_copy',array(
		'label'	=> __('Copyright Text','inventor'),
		'section'	=> 'footer_section',
		'type'		=> 'text'
	));
	
	
}
add_action( 'customize_register', 'inventor_customize_register' );

function inventor_css(){
		?>
        <style>
				a, 
				.tm_client strong,
				.postmeta a:hover,
				#sidebar ul li a:hover,
				.blog-post h3.entry-title,
				.woocommerce ul.products li.product .price,
				.main-nav ul li a:hover,
				.main-nav ul li a:hover,
				h2.entry-title a:hover,
				#sidebar a:hover{
					color:<?php echo esc_html(get_theme_mod('color_scheme','#efc62c')); ?>;
				}
				a.blog-more:hover,
				.nav-links .current, 
				.nav-links a:hover,
				#commentform input#submit,
				input.search-submit,
				.nivo-controlNav a.active,
				.blog-date .date,
				a.read-more,
				.contact-strip,
				#topbar{
					background-color:<?php echo esc_html(get_theme_mod('color_scheme','#efc62c')); ?>;
				}
				#header .para-shaper{
					border-top:80px solid <?php echo esc_html(get_theme_mod('color_scheme','#efc62c')); ?>;
				}
				.para-foot-shaper{
					border-top:64px solid <?php echo esc_html(get_theme_mod('color_scheme','#efc62c')); ?>;
				}
		</style>
	<?php }
add_action('wp_head','inventor_css');

function inventor_custom_customize_enqueue() {
	wp_enqueue_script( 'inventor-custom-customize', get_template_directory_uri() . '/js/custom.customize.js', array( 'jquery', 'customize-controls' ), false, true );
	wp_localize_script( 'inventor-custom-customize', 'inventorjsvar', array(
	'upgrade' => __('Upgrade to PRO Version', 'inventor')
	));
}
add_action( 'customize_controls_enqueue_scripts', 'inventor_custom_customize_enqueue' );