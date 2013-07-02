<?php echo $header; ?>
	
	<link rel="stylesheet" href="view/javascript/colorpicker/css/colorpicker.css" type="text/css" />
	<script type="text/javascript" src="view/javascript/colorpicker/js/colorpicker.js"></script>
    <script type="text/javascript" src="view/javascript/colorpicker/js/eye.js"></script>
    <script type="text/javascript" src="view/javascript/colorpicker/js/utils.js"></script>
    <script type="text/javascript" src="view/javascript/colorpicker/js/layout.js?ver=1.0.2"></script>
	
<script type="text/javascript">

$(document).ready(function(){

	$('#main_color').css('background-color', '#<?php echo (isset($modules['main_color']) ? $modules['main_color'] : '00d0dd');?>');
	$('#menu_color').css('background-color', '#<?php echo (isset($modules['menu_color']) ? $modules['menu_color'] : '00d0dd');?>');
	$('#bgr_color').css('background-color', '#<?php echo (isset($modules['bgr_color']) ? $modules['bgr_color'] : 'f5f5f5');?>');
	
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
			mainColorUpdate(hex);
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
		    
    
<div id="content">
<div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
  <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
</div>
<?php 
if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="box">
  <div class="heading">
    <h1><img src="view/image/module.png" alt="" />Template Styles</h1>
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><span>Save</span></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span>Cancel</span></a></div>
  </div>
  <div class="content">
   <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
	<input type="hidden" name="styler_module[status]" value="1">
    <table class="form">
            <tbody>
			<tr>
                <td colspan="2"><h3>Color & Style Options:</h3></td>
            </tr>

			<tr>
                <td>Show Template Styles in Store Front</td>
                <td>
                    <select name="styler_module[display_theme_settings]">
                            <option value="0" <?php echo ((!isset($modules['display_theme_settings']) || (!$modules['display_theme_settings'])) ? ' selected="selected"':'');?>>Disabled</option>
                            <option value="1" <?php echo (isset($modules['display_theme_settings']) && $modules['display_theme_settings']?' selected="selected"':'');?>>Enabled</option>
                    </select>
                &nbsp; <em>Display the Template Styles (Color & Style Options) in the Front of your store, You also need to be logged in the Store Admin</em></td>
            </tr>
			<tr>
				<td>Menu Style:</td>
				<td> <select name="styler_module[menu_style]" id="menu_style" style="width: 80px;">                				                		                
		                <option value="light" <?php echo ((!isset($modules['menu_style']) || ($modules['menu_style']=='light')) ? ' selected="selected"':'');?>>Light</option>
		                <option value="dark"  <?php echo (isset($modules['menu_style']) && ($modules['menu_style']=="dark") ? ' selected="selected"':'');?>>Dark</option>			               
		                <option value="basic"  <?php echo (isset($modules['menu_style']) && ($modules['menu_style']=="basic") ? ' selected="selected"':'');?>>Basic</option>			               
		                <option value="custom"  <?php echo (isset($modules['menu_style']) && ($modules['menu_style']=="custom") ? ' selected="selected"':'');?>>Custom</option>			               
                    </select></td>
			</tr>

            <tr>
                <td>Menu Color</td>
                <td><input type="text" maxlength="6" size="6" id='menu_color' name="styler_module[menu_color]" style="border: 1px solid #ccc; text-transform: uppercase; color: #fff;" value="<?php echo (isset($modules['menu_color']) ? $modules['menu_color'] : '00d0dd');?>" />
                &nbsp; <em>Default is "00d0dd". Works only on BASIC and CUSTOM Menu Styles.</em></td>
            </tr>            

			<tr><td>Menu Font:</td>
				<td><select name="styler_module[nav_font_picker]" id="nav_font_picker">          	
		                <option value="Lato">Default</option>
		                <?php foreach ($g_fonts as $i=>$font) { ?>             
		                <option <?php echo ((isset($modules['nav_font_picker']) && ($modules['nav_font_picker'] == $font) ) ? "selected = 'selected'" : "");?>  value="<?php echo $font; ?>"><?php echo $font;?></option>
		                <?php } ?>
                    </select>			
                    &nbsp; <em></em>		
				</td>
			</tr>

			<tr><td>Menu Font Size:</td>
				<td><select name="styler_module[nav_fontsize_picker]" id="nav_fontsize_picker">          	
		                <option value="16px">Default</option>
						<option value="14px" <?php echo ((isset($modules['nav_fontsize_picker']) && ($modules['nav_fontsize_picker'] == '14px') ) ? "selected = 'selected'" : "");?>>14px</option>
						<option value="15px" <?php echo ((isset($modules['nav_fontsize_picker']) && ($modules['nav_fontsize_picker'] == '15px') ) ? "selected = 'selected'" : "");?>>15px</option>
						<option value="16px" <?php echo ((isset($modules['nav_fontsize_picker']) && ($modules['nav_fontsize_picker'] == '16px') ) ? "selected = 'selected'" : "");?>>16px</option>
						<option value="17px" <?php echo ((isset($modules['nav_fontsize_picker']) && ($modules['nav_fontsize_picker'] == '17px') ) ? "selected = 'selected'" : "");?>>17px</option>
						<option value="18px" <?php echo ((isset($modules['nav_fontsize_picker']) && ($modules['nav_fontsize_picker'] == '18px') ) ? "selected = 'selected'" : "");?>>18px</option>
						<option value="19px" <?php echo ((isset($modules['nav_fontsize_picker']) && ($modules['nav_fontsize_picker'] == '19px') ) ? "selected = 'selected'" : "");?>>19px</option>
						<option value="20px" <?php echo ((isset($modules['nav_fontsize_picker']) && ($modules['nav_fontsize_picker'] == '20px') ) ? "selected = 'selected'" : "");?>>20px</option>
                    </select>	
                     &nbsp; <em>Default is 16px.</em>				
				</td>
			</tr>


            <tr>
                <td>HighLight Color</td>
                <td><input type="text" maxlength="6" size="6" id='main_color' name="styler_module[main_color]" style="border: 1px solid #ccc; text-transform: uppercase; color: #fff;" value="<?php echo (isset($modules['main_color']) ? $modules['main_color'] : '00d0dd');?>" />
                &nbsp; <em>Default is "00d0dd". This is the color of hovered Buttons, and hovered Links.</em></td>
            </tr>            

			<tr><td>Title Font:</td>
				<td><select name="styler_module[title_font_picker]" id="title_font_picker">          	
		                <option value="Pontano Sans">Default</option>
		                <?php foreach ($g_fonts as $i=>$font) { ?>             
		                <option <?php echo ((isset($modules['title_font_picker']) && ($modules['title_font_picker'] == $font) ) ? "selected = 'selected'" : "");?>  value="<?php echo $font; ?>"><?php echo $font;?></option>
		                <?php } ?>
                    </select>			
                    &nbsp; <em>Titles & Headings</em>		
				</td>
			</tr>

			<tr><td>Button Font:</td>
				<td><select name="styler_module[button_font_picker]" id="button_font_picker">          	
		                <option value="Droid Sans">Default</option>
		                <?php foreach ($g_fonts as $i=>$font) { ?>             
		                <option <?php echo ((isset($modules['button_font_picker']) && ($modules['button_font_picker'] == $font) ) ? "selected = 'selected'" : "");?>  value="<?php echo $font; ?>"><?php echo $font;?></option>
		                <?php } ?>
                    </select>			
                    &nbsp; <em>Button Fonts</em>		
				</td>
			</tr>

			<tr><td>Body Font:</td>
				<td><select name="styler_module[body_font_picker]" id="body_font_picker">          	
		                <option value="Droid Sans">Default</option>
		                <?php foreach ($sys_fonts as $i=>$font) { ?>             
		                <option <?php echo ((isset($modules['body_font_picker']) && ($modules['body_font_picker'] == $font) ) ? "selected = 'selected'" : "");?>  value="<?php echo $font; ?>"><?php echo $font;?></option>
		                <?php } ?>
                    </select>			
                    &nbsp; <em>Regular Text</em>		
				</td>
			</tr>

			<tr>
				<td>Footer Style:</td>
				<td> <select name="styler_module[footer_style]" id="footer_style" style="width: 80px;">
		                <option value="light" <?php echo ((!isset($modules['footer_style']) || ($modules['footer_style']=='light')) ? ' selected="selected"':'');?>>Light</option>
		                <option value="dark"  <?php echo (isset($modules['footer_style']) && ($modules['footer_style']=="dark")?' selected="selected"':'');?>>Dark</option>			               
                    </select></td>
			</tr>

            <tr>
                <td>Background Image</td>
                <td>
                	<select name="styler_module[bgr_image]">                	
		                <?php foreach ($img_files as $i=>$img_file) { ?>
		                <?php if ($img_file == $modules['bgr_image']) { ?>
		                <option value="<?php echo $img_file;?>" selected="selected"><?php echo ($i==0 ? "Default" : "Pattern ".$i++)?></option>
		                <?php } else { ?>
		                <option value="<?php echo $img_file; ?>"><?php echo ($i==0 ? "Default" : "Pattern ".$i++)?></option>
		                <?php } ?>
		                <?php } ?>
		                <option <?php echo (isset($modules['bgr_image']) && 'none' == $modules['bgr_image']) ? "selected = 'selected'" : "";?>  value="none">No Image</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Background Color</td>
                <td><input type="text" maxlength="6" size="6" id='bgr_color' name="styler_module[bgr_color]" style="border: 1px solid #ccc; text-transform: uppercase;" value="<?php echo (isset($modules['bgr_color']) ? $modules['bgr_color'] : 'F5F5F5');?>" />
                    &nbsp; <em>Only works when background Image is set to "No Image". Default is "F5F5F5"</em>
                </td>
            </tr>

        </tbody></table>
    </form>
  </div>
</div>

<?php echo $footer; ?>