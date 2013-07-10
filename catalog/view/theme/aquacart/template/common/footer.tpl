<?php 
$styler = isset($GLOBALS["styler"]) ? $GLOBALS["styler"] : NULL;
$store_settings = isset($GLOBALS["store_settings"]) ? $GLOBALS["store_settings"] : NULL;
?>


<div id="footer">
  <div class="footer_top"></div>
  <div class="column">
    <h3><?php echo $text_information; ?></h3>
    <ul>
      <?php foreach ($informations as $information) { ?>
      <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
      <?php } ?>
    </ul>
  </div>
  <div class="column shown-phone">
    <h3><?php echo $text_service; ?></h3>
    <ul>
      <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
      <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
      <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
    </ul>
  </div>
  <div class="column shown-phone">
    <h3><?php echo $text_extra; ?></h3>
    <ul>
      <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
      <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
      <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
      <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
    </ul>
  </div>
  <div class="column">
    <h3><?php echo $text_account; ?></h3>
    <ul>
      <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
      <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
      <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
      <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
    </ul>
  </div>
  <div class="big_column">
  
<?php if(isset($store_settings)){ ?>  
  <?php if(isset($store_settings['phone']) && $store_settings['phone']!=''){?>
	<div class='icon_phone' title='Phone'><?php echo $store_settings['phone'];?></div>
  <?php } ?>
  <?php if(isset($store_settings['email']) && $store_settings['email']!=''){?>
	<div class='icon_mail' title='Email'><?php echo $store_settings['email'];?></div>	
  <?php } ?>
  <?php if(isset($store_settings['location']) && $store_settings['location']!=''){?>
	<div class='icon_loc' title='Location'><?php echo $store_settings['location'];?></div>	
  <?php } ?>
<?php } ?>  
  	<div class='clear'></div>
  	<div class='h10'></div>

  </div>  
  <div class="clear"></div>
  <div class="footer_btm">
<?php if(isset($store_settings)){ ?>   
  <?php if(isset($store_settings['visa_icon']) && $store_settings['visa_icon']){?>
	  	<span class='icon_visa hidden-phone' title='Visa'>Visa</span>
  <?php } ?>
  <?php if(isset($store_settings['mastercard_icon']) && $store_settings['mastercard_icon']){?>
	  	<span class='icon_mastercard hidden-phone' title='Mastercard'>Mastercard</span>
  <?php } ?>
  <?php if(isset($store_settings['amex_icon']) && $store_settings['amex_icon']){?>
  	  	<span class='icon_amex hidden-phone' title='Amex'>Amex</span>
  <?php } ?>
  <?php if(isset($store_settings['discover_icon']) && $store_settings['discover_icon']){?>
  	  	<span class='icon_discover hidden-phone' title='Discover'>Discover</span>
  <?php } ?>
  <?php if(isset($store_settings['paypal_icon']) && $store_settings['paypal_icon']){?>
  	  	<span class='icon_paypal hidden-phone' title='Paypal'>Paypal</span>
  <?php } ?>


  <?php if(isset($store_settings['pinterest_icon']) && $store_settings['pinterest_icon']){?>  
	  	<a href='<?php echo $store_settings['pinterest_icon'];?>' target='_blank' class='icon_pinterest' title='Pinterest'>Pinterest</a>
  <?php } ?>
  <?php if(isset($store_settings['tweeter_icon']) && $store_settings['tweeter_icon']){?>
  	  	<a href='<?php echo $store_settings['tweeter_icon'];?>' target='_blank' class='icon_tweet' title='Tweeter'>Tweeter</a>
  <?php } ?>
  <?php if(isset($store_settings['skype_icon']) && $store_settings['skype_icon']){?> 	
		<script type="text/javascript" src="http://download.skype.com/share/skypebuttons/js/skypeCheck.js"></script>
		<a href="skype:<?php echo $store_settings['skype_icon'];?>?chat" class='icon_skype' title='Skype'>Skype</a>
		<style>
		#skypedetectionswf{display: none;}
		</style>
  <?php } ?>
  <?php if(isset($store_settings['google_icon']) && $store_settings['google_icon']){?>	  	
	  	<a href='<?php echo $store_settings['google_icon'];?>' target='_blank' class='icon_google' title='Google+'>Google+</a>
  <?php } ?>
  <?php if(isset($store_settings['facebook_icon']) && $store_settings['facebook_icon']){?>
  	  	<a href='<?php echo $store_settings['facebook_icon'];?>' target='_blank' class='icon_facebook' title='Facebook'>Facebook</a>
  <?php } ?>	  	
<?php } ?>  
	  	<div id="powered"><a href="http://sujaroyslabrenda.com" target="_blank">sujaroyslabrenda.com</a> © <?php echo date("Y");?> &nbsp; </div>
  </div>
</div>

</div>


<?php 
// Show if logged in as admin
$this->load->library('user');
$this->user = new User($this->registry);
if ($this->user->isLogged() && isset($styler) && $styler['display_theme_settings']) {
?>

<!-- STYLER :: Start -->
<link rel="stylesheet" href="admin/view/javascript/colorpicker/css/colorpicker.css" type="text/css" />
<script type="text/javascript" src="admin/view/javascript/colorpicker/js/colorpicker.js"></script>


<?php 
function ReadFolderDirectory($dir) 
    { 
        $listDir = array(); 
        if($handler = opendir($dir)) { 
            while (($sub = readdir($handler)) !== FALSE) { 
                if ($sub != "." && $sub != ".." && $sub != "Thumb.db") { 
                    if(is_file($dir."/".$sub)) { 
                        $listDir[] = $sub; 
                    }elseif(is_dir($dir."/".$sub)){ 
                        $listDir[$sub] = ReadFolderDirectory($dir."/".$sub); 
                    } 
                } 
            }    
            closedir($handler); 
        } 
        sort($listDir);
        return $listDir;    
    }
    
   	$bgrs_dir = 'admin/view/image/bgrs/'; 
	$bgrs = ReadFolderDirectory($bgrs_dir); 
?>

	
<script type="text/javascript">

$(document).ready(function(){

	$('#main_color').ColorPicker({
		onSubmit: function(hsb, hex, rgb, el) {
			$(el).val(hex);
			$(el).ColorPickerHide();
		},
		onBeforeShow: function () {
			$(this).ColorPickerSetColor(this.value);
		},
		onChange: function (hsb, hex, rgb) {
			$('#main_color').val(hex);
			$('#main_color').css('backgroundColor', '#' + hex);
			mainColorUpdate(hex);
		}
	})
	.bind('keyup', function(){
		$(this).ColorPickerSetColor(this.value);
	});


	$('#menu_color').ColorPicker({
		onSubmit: function(hsb, hex, rgb, el) {
			$(el).val(hex);
			$(el).ColorPickerHide();
		},
		onBeforeShow: function () {
			$(this).ColorPickerSetColor(this.value);
		},
		onChange: function (hsb, hex, rgb) {
			$('#menu_color').val(hex);
			$('#menu_color').css('backgroundColor', '#' + hex);
			menuColorUpdate(hex);
		}
	})
	.bind('keyup', function(){
		$(this).ColorPickerSetColor(this.value);
	});

	$('#bgr_color').ColorPicker({
		onSubmit: function(hsb, hex, rgb, el) {
			$(el).val(hex);
			$(el).ColorPickerHide();
		},
		onBeforeShow: function () {
			$(this).ColorPickerSetColor(this.value);
		},
		onChange: function (hsb, hex, rgb) {
			$('#bgr_color').val(hex);
			$('#bgr_color').css('backgroundColor', '#' + hex);
			bgrColorUpdate(hex);
		}
	})
	.bind('keyup', function(){
		$(this).ColorPickerSetColor(this.value);
	});
	

	$('#menu_style').change(function() {
		if($(this).val() == 'dark'){
			$('#menu').parent().removeClass('custom_menu').removeClass('basic_menu').addClass('dark_menu');
			$('#menu_color_row').hide();
		}else if($(this).val() == 'basic') {
			$('#menu_color_row').show();
			$('#menu').parent().removeClass('dark_menu').removeClass('custom_menu').addClass('basic_menu');
		}else if($(this).val() == 'custom') {
			$('#menu_color_row').show();
			$('#menu').parent().removeClass('dark_menu').removeClass('basic_menu').addClass('custom_menu');
		}else {
			$('#menu').parent().removeClass('dark_menu').removeClass('basic_menu').removeClass('custom_menu');
			$('#menu_color_row').hide();
		}
	});

	
	$('#nav_font_picker').change(function() {

		font_weight = false;
		font_picked = $(this).val();
		var split_font_name = font_picked.split(":");
		if(split_font_name.length > 0){
			font_picked = split_font_name[0];
			font_weight = split_font_name[1];
		}
		
		$('#nav_font_styles').html('<style>'+
			'.custom_menu #menu > ul > li > a { font-family: '+ font_picked +';'+ (font_weight ? ' font-weight: '+ font_weight +';' : '') +'}' +
			'#menu { font-family: '+ font_picked +';'+ (font_weight ? ' font-weight: '+ font_weight +';' : '') +'}' +
			'</style>');
	});
	
	$('#nav_fontsize_picker').change(function() {

		fontsize_picked = $(this).val();
		var split_fontsize_int = fontsize_picked.split("px");
		if(split_fontsize_int.length > 0){
			fontsize_picked_int = split_fontsize_int[0];
		}

		$('#nav_fontsize_styles').html('<style>'+
			'#menu > ul > li > a { font-size: '+ fontsize_picked_int +'px;}' +
			'#menu > ul > li ul > li > a  { font-size: '+ parseInt(fontsize_picked_int-2) +'px;}' +
			'</style>');
	});


	
	$('#title_font_picker').change(function() {

		font_weight = false;
		font_picked = $(this).val();
		var split_font_name = font_picked.split(":");
		if(split_font_name.length > 0){
			font_picked = split_font_name[0];
			font_weight = split_font_name[1];
		}

		$('#title_font_styles').html('<style>'+
			'h1, h2, h3, .welcome, .box-heading, .general_heading, #footer h3, #column-left .general_heading, #column-right .general_heading { font-family: '+ font_picked +';'+ (font_weight ? ' font-weight: '+ font_weight +';' : '') +'}' +
			'</style>');

	});

	$('#button_font_picker').change(function() {

		font_weight = false;
		font_picked = $(this).val();
		var split_font_name = font_picked.split(":");
		if(split_font_name.length > 0){
			font_picked = split_font_name[0];
			font_weight = split_font_name[1];
		}

		$('#button_font_styles').html('<style>'+
			'.button { font-family: '+ font_picked +';'+ (font_weight ? ' font-weight: '+ font_weight +';' : '') +'}' +
			'</style>');

	});

	$('#body_font_picker').change(function() {

		font_picked = $(this).val();


		$('#body_font_styles').html('<style>'+
			'body { font-family: '+ font_picked +';}' +
			'</style>');

	});
	

	
	$('#footer_style').change(function() {
		if($(this).val() == 'dark'){
			$('#footer').addClass('footer_dark');
		}else {
			$('#footer').removeClass('footer_dark');
		}
	});
	
	$('#bgr_picker').change(function() {
		if($(this).val()=='none'){
			$('#bgr_color_row').show();
			$('body').css('backgroundImage', 'none');
			$('body').css('backgroundColor', $('#bgr_color').val());
		}else{
			$('#bgr_color_row').hide();
			$('body').css('backgroundImage', 'url(<?php echo $bgrs_dir;?>' + $(this).val() + ')');
		}
	});
	
});

function mainColorUpdate(hex){

	hex = '#'+hex;

	$('#styler_styles').html('<style>'+
		'	a:hover { color: '+ hex +';}'+
		'	a.button:hover, input.button:hover { background-color:'+ hex +';}'+		
	    '   .breadcrumb a:hover{ color: '+ hex +';}'+		
		'	.buttons .right .button:hover { background-color:'+ hex +';}'+
		'	.product_holder .name a:hover { color:'+ hex +';}'+
		'	.product-info .description a:hover { color:'+ hex +';}'+
		'	.product-info .cart .button { background-color:'+ hex +';}'+
		'	.product-info a.icon_plus:hover { color:'+ hex +';}'+
		'	.product-info .review a.rev_count:hover { color:'+ hex +';}'+
		'	#language a:hover  { color:'+ hex +';}'+
		'	#currency a:hover  { color:'+ hex +';}'+
		'	#header #welcome a:hover  { color:'+ hex +';}'+
		'	#header .links a:hover  { color:'+ hex +';}'+
		'	#footer a:hover { color:'+ hex +';}'+

		'	.camera_prevThumbs:hover, .camera_nextThumbs:hover, .camera_prev:hover, .camera_next:hover, .camera_commands:hover, .camera_thumbs_cont:hover { background-color:'+ hex +';}'+
		'	.camera_wrap .camera_pag .camera_pag_ul li.cameracurrent > span  { background-color:'+ hex +';}'+

		'	.jcarousel-skin-opencart .jcarousel-next-horizontal:hover, .custom-next:hover { background-color:'+ hex +';}'+
		'	.jcarousel-skin-opencart .jcarousel-prev-horizontal:hover, .custom-prev:hover   { background-color:'+ hex +';}'+
		'	.jcarousel-skin-opencart .jcarousel-next-disabled-horizontal:hover  { background-color: #ccc;}'+
		'	.jcarousel-skin-opencart .jcarousel-prev-disabled-horizontal:hover  { background-color: #ccc;}'+
		
		'	.pagination .links a:hover  { background-color:'+ hex +';}'+		
		'	.product-filter .display a:hover  { color:'+ hex +';}'+		
		'	.product-compare a:hover  { color:'+ hex +';}'+		
		'	.product-list .compare a:hover, .product-list .wishlist a:hover  { color:'+ hex +';}'+		

		'	a.icon_compare:hover  { color:'+ hex +';}'+		
		'	a.icon_wishlist:hover  { color:'+ hex +';}'+		
		'	a.icon_comment:hover  { color:'+ hex +';}'+		
		
		'</style>');	
}

function bgrColorUpdate(hex){
	$('body').css('background-color', '#'+hex);
}

function menuColorUpdate(hex){
	hex = '#'+hex;

	$('#menu_styles').html('<style>'+
		'   .basic_menu #menu > ul > li > a:hover { background-color: '+ hex +';}'+
		'   .basic_menu #menu > ul > li:hover > a { background-color: '+ hex +';}'+
	    '   .custom_menu #menu { background-color: '+ hex +';}'+
	    '   .custom_menu #menu > ul > li > a { background-color: '+ hex +';}'+	
		'</style>');
}


$(document).ready(function() {

	$('#styler_toggler').bind('click', function() {
		if($('#styler_slider').css('left') == '0px'){
			$('#styler_slider').stop(false, true).animate({left:'-220px'}, 400, 'easeOutExpo', function(){
				if($('#styler_toggler').hasClass('styler_toggler_off')){
					$('#styler_toggler').removeClass('styler_toggler_off').addClass('styler_toggler_on');	
				}else{
					$('#styler_toggler').removeClass('styler_toggler_on').addClass('styler_toggler_off');				
				}
			});
		}else {
			$('#styler_slider').stop(false, true).animate({left:'0px'}, 400, 'easeOutExpo', function(){
				if($('#styler_toggler').hasClass('styler_toggler_off')){
					$('#styler_toggler').removeClass('styler_toggler_off').addClass('styler_toggler_on');	
				}else{
					$('#styler_toggler').removeClass('styler_toggler_on').addClass('styler_toggler_off');				
				}
			});
		}	
	});

	// Update colors of colorpicker from those set in Admin
	$('#main_color').css('background-color', '#<?php echo (isset($styler['main_color']) ? $styler['main_color'] : "00d0dd");?>');
	$('#menu_color').css('background-color', '#<?php echo (isset($styler['menu_color']) ? $styler['menu_color'] : "00d0dd");?>');
	$('#bgr_color').css('background-color', '#<?php echo (isset($styler['bgr_color']) ? $styler['bgr_color'] : "eeeeee");?>');
	if($('#bgr_picker').val()=='none'){
		$("#bgr_color_row").show();
	}
	if(($('#menu_style').val()=='custom')||($('#menu_style').val()=='basic')){
		$('#menu_color_row').show();
	}
	
});
</script>



<!--  Fonts  -->

<?php 

	$g_fonts=array(
		'Allan',
		'Cabin',
		'Cardo',
		'Chivo',
		'Courgette',
		'Cuprum',
		'Dancing Script:700',
		'Droid Sans',
		'Droid Serif',
		'Dosis:500',
		'Lobster',
		'Lobster Two',
		'Mako',
		'Merienda One',	
		'Miniver',	
		'Molengo',
		'Open Sans',
		'Oxygen',
		'Playball',
		'Pontano Sans',
		'Philosopher',
		'PT Sans',
		'PT Sans Narrow',
		'Radley',
		'Salsa',
		'Vollkorn',
		'Ubuntu',
		'Yanone Kaffeesatz'
	);
	$sys_fonts=array(
		'Arial',
		'Georgia',
		'Tahoma',
		'Trebuchet MS',
		'Times New Roman',
		'Verdana'
	);

?>
<script type="text/javascript">
      WebFontConfig = {
        google: { families: ['Lato'<?php foreach($g_fonts as $font){ echo ',"'.$font.'"';}?>] }
      };
      (function() {
        var wf = document.createElement('script');
        wf.src = ('https:' == document.location.protocol ? 'https' : 'http') +
            '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
        wf.type = 'text/javascript';
        wf.async = 'true';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(wf, s);
      })();
</script>




<div id="styler_slider"> 
	<div class="styler_inner">
		<div class="styler_toggler_holder">
			<div id="styler_toggler" class="styler_toggler_off"></div>
		</div>
		
		<div class="styler_content">
		
			<form action="<?php echo (isset($styler['action_url']) ? $styler['action_url'] : "");?>" method="post">
			<input type="hidden" name="styler_module[status]" value="1"/>
			<input type="hidden" name="styler_module[display_theme_settings]" value="1"/>
			<div class="styler_heading">Template Styles</div>
			
			<table width="100%" cellspacing="3">

				<tr><td>Menu Style:</td>
					<td><select name="styler_module[menu_style]" id="menu_style">                				                		                
			                <option <?php echo ((isset($styler['menu_style']) && ($styler['menu_style'] == 'light') ) ? "selected = 'selected'" : "");?>  value="light">Light</option>
			                <option <?php echo ((isset($styler['menu_style']) && ($styler['menu_style'] == 'dark') ) ? "selected = 'selected'" : "");?>  value="dark">Dark</option>			               
			                <option <?php echo ((isset($styler['menu_style']) && ($styler['menu_style'] == 'basic') ) ? "selected = 'selected'" : "");?>  value="basic">Basic</option>			               
			                <option <?php echo ((isset($styler['menu_style']) && ($styler['menu_style'] == 'custom') ) ? "selected = 'selected'" : "");?>  value="custom">Custom</option>			               
	                    </select></td>
				</tr>
				<tr id="menu_color_row" style="display: none;"><td>Menu Color:</td>
					<td><input type="text" maxlength="6" size="6" id='menu_color' name="styler_module[menu_color]" value="<?php echo (isset($styler['menu_color']) ? $styler['menu_color'] : "00d0dd");?>"/></td>
				</tr>
				
								
				<tr><td>Menu Font:</td>
					<td><select name="styler_module[nav_font_picker]" id="nav_font_picker">          	
			                <option value="Lato">Default</option>
			                <?php foreach ($g_fonts as $i=>$font) { ?>             
			                <option <?php echo ((isset($styler['nav_font_picker']) && ($styler['nav_font_picker'] == $font) ) ? "selected = 'selected'" : "");?>  value="<?php echo $font; ?>"><?php echo $font;?></option>
			                <?php } ?>
	                    </select>					
					</td>
				</tr>	
				<tr><td>Menu F.Size:</td>
					<td><select name="styler_module[nav_fontsize_picker]" id="nav_fontsize_picker">          	
			                <option value="16px" <?php echo ((isset($styler['nav_fontsize_picker']) && ($styler['nav_fontsize_picker'] == '16px') ) ? "selected = 'selected'" : "");?>>Default</option>
							<option value="14px" <?php echo ((isset($styler['nav_fontsize_picker']) && ($styler['nav_fontsize_picker'] == '14px') ) ? "selected = 'selected'" : "");?>>14px</option>
							<option value="15px" <?php echo ((isset($styler['nav_fontsize_picker']) && ($styler['nav_fontsize_picker'] == '15px') ) ? "selected = 'selected'" : "");?>>15px</option>
							<option value="16px">16px</option>
							<option value="17px" <?php echo ((isset($styler['nav_fontsize_picker']) && ($styler['nav_fontsize_picker'] == '17px') ) ? "selected = 'selected'" : "");?>>17px</option>
							<option value="18px" <?php echo ((isset($styler['nav_fontsize_picker']) && ($styler['nav_fontsize_picker'] == '18px') ) ? "selected = 'selected'" : "");?>>18px</option>
							<option value="19px" <?php echo ((isset($styler['nav_fontsize_picker']) && ($styler['nav_fontsize_picker'] == '19px') ) ? "selected = 'selected'" : "");?>>19px</option>
							<option value="20px" <?php echo ((isset($styler['nav_fontsize_picker']) && ($styler['nav_fontsize_picker'] == '20px') ) ? "selected = 'selected'" : "");?>>20px</option>
	                    </select>
	                    <div class='h5'></div>					
					</td>
				</tr>					
				
				<tr><td class="styler_top_divider">HiLite Color:</td>
					<td class="styler_top_divider"><input type="text" maxlength="6" size="6" id='main_color' name="styler_module[main_color]" value="<?php echo (isset($styler['main_color']) ? $styler['main_color'] : "00d0dd");?>"/></td>
				</tr>

				<tr><td>Title Font:</td>
					<td><select name="styler_module[title_font_picker]" id="title_font_picker">          	
			                <option value="Pontano Sans">Default</option>
			                <?php 
			                	$t_fonts = $g_fonts;
			                	unset($t_fonts[19]);
			                ?>
			                <?php foreach ($t_fonts as $i=>$font) { ?>             
			                <option <?php echo ((isset($styler['title_font_picker']) && ($styler['title_font_picker'] == $font) ) ? "selected = 'selected'" : "");?>  value="<?php echo $font; ?>"><?php echo $font;?></option>
			                <?php } ?>
	                    </select>					
					</td>
				</tr>	

				<tr><td>Button Font:</td>
					<td><select name="styler_module[button_font_picker]" id="button_font_picker">          	
			                <option value="Droid Sans">Default</option>
			                <?php 
			                	$b_fonts = $g_fonts;
			                	unset($b_fonts[7]);
			                ?>
			                <?php foreach ($b_fonts as $i=>$font) { ?>             
			                <option <?php echo ((isset($styler['button_font_picker']) && ($styler['button_font_picker'] == $font) ) ? "selected = 'selected'" : "");?>  value="<?php echo $font; ?>"><?php echo $font;?></option>
			                <?php } ?>
	                    </select>					
					</td>
				</tr>	

				<tr><td>Body Font:</td>
					<td><select name="styler_module[body_font_picker]" id="body_font_picker">          	
			                <option value="Droid Sans">Default</option>
			                <?php foreach ($sys_fonts as $i=>$font) { ?>             
			                <option <?php echo ((isset($styler['body_font_picker']) && ($styler['body_font_picker'] == $font) ) ? "selected = 'selected'" : "");?>  value="<?php echo $font; ?>"><?php echo $font;?></option>
			                <?php } ?>
	                    </select><div class='h5'></div>			
					</td>
				</tr>	


				<tr><td class="styler_top_divider">Footer Style:</td>
					<td class="styler_top_divider"><select name="styler_module[footer_style]" id="footer_style">                			                		                
			                <option <?php echo ((isset($styler['footer_style']) && ($styler['footer_style'] == 'light') ) ? "selected = 'selected'" : "");?>  value="light">Light</option>
			                <option <?php echo ((isset($styler['footer_style']) && ($styler['footer_style'] == 'dark') ) ? "selected = 'selected'" : "");?>  value="dark">Dark</option>	               
	                    </select></td>
				</tr>
				<tr><td>Main BGR:</td>
					<td><select name="styler_module[bgr_image]" id="bgr_picker">                	
			                <?php foreach ($bgrs as $i=>$img_file) { ?>		                
			                <option <?php echo ((isset($styler['bgr_image']) && ($img_file == $styler['bgr_image']) ) ? "selected = 'selected'" : "");?>  value="<?php echo $img_file; ?>"><?php echo ($i==0 ? "Default" : "Pattern $i")?></option>
			                <?php } ?>
			                <option <?php echo ((isset($styler['bgr_image']) && ('none' == $styler['bgr_image']) ) ? "selected = 'selected'" : "");?>  value="none">No Image</option>
	                    </select>					
					</td>
				</tr>
				<tr id="bgr_color_row" style="display: none;"><td>BGR Color:</td>
					<td><input type="text" maxlength="6" size="6" id='bgr_color' name="styler_module[bgr_color]" value="<?php echo (isset($styler['bgr_color']) ? $styler['main_color'] : "eeeeee");?>"/></td>
				</tr>	
							
			</table>
			
			<div class="styler_footer"><input type="submit" value="Save" class="button" style="font-family: 'Droid Sans';"/></div>
			
			</form>
		</div>	
		
	</div>


<div id="styler_styles"></div>
<div id="menu_styles"></div> 

<div id="nav_font_styles"></div> 
<div id="nav_fontsize_styles"></div> 

<div id="title_font_styles"></div>          
<div id="button_font_styles"></div>          
<div id="body_font_styles"></div>     


</div>

<!-- STYLER :: End -->
<?php }?>

</body></html>