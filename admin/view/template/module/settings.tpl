<?php echo $header; ?>


		    
    
<div id="content">
<div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
  <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
</div>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="box">
  <div class="heading">
    <h1><img src="view/image/module.png" alt="" />Store Settings</h1>
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><span>Save</span></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span>Cancel</span></a></div>
  </div>
  <div class="content">
   <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
	<input type="hidden" name="settings_module[status]" value="1">
    
    <table class="form">
            <tbody>
			<tr>
                <td colspan="2"><h3>Effects & Animations:</h3></td>
            </tr>
			<tr>
                <td>Fading Effect</td>
                <td>
                    <select name="settings_module[fading_effects]">
                            <option value="0" <?php echo ((!isset($modules['fading_effects']) || (!$modules['fading_effects'])) ? ' selected="selected"':'');?>>Disabled</option>
                            <option value="1" <?php echo (isset($modules['fading_effects']) && $modules['fading_effects']?' selected="selected"':'');?>>Enabled</option>
                    </select>
                &nbsp; <em>Fade Out neighbouring products when hovering a product</em></td>
            </tr>

			<tr>
                <td>Sliding products</td>
                <td>
                    <select name="settings_module[sliding_products]">
                            <option value="0" <?php echo ((!isset($modules['sliding_products']) || (!$modules['sliding_products'])) ? ' selected="selected"':'');?>>Disabled</option>
                            <option value="1" <?php echo (isset($modules['sliding_products']) && $modules['sliding_products']?' selected="selected"':'');?>>Enabled</option>
                    </select>
                &nbsp; <em>Display arrows (Left & Right) in module headings and enable product sliders.</em></td>
            </tr>


			<tr>
                <td colspan="2"><h3>Header Links / Wishlist & Compare Links:</h3></td>
            </tr>
			<tr>
                <td>Header Links</td>
                <td>
                    <select name="settings_module[header_links]">
                            <option value="0" <?php echo ((!isset($modules['header_links']) || (!$modules['header_links'])) ? ' selected="selected"':'');?>>Disabled</option>
                            <option value="1" <?php echo (isset($modules['header_links']) && $modules['header_links']?' selected="selected"':'');?>>Enabled</option>
                    </select>
                &nbsp; <em>Navigation links in the header</em></td>
            </tr>
			<tr>
                <td>Wishlist Link</td>
                <td>
                    <select name="settings_module[wishlist_link]">
                            <option value="1" <?php echo ((!isset($modules['wishlist_link']) || ($modules['wishlist_link'])) ? ' selected="selected"':'');?>>Enabled</option>
                            <option value="0" <?php echo (isset($modules['wishlist_link']) && !$modules['wishlist_link']?' selected="selected"':'');?>>Disabled</option>
                    </select>
                &nbsp; <em></em></td>
            </tr>
			<tr>
                <td>Compare Link</td>
                <td>
                    <select name="settings_module[compare_link]">
                            <option value="1" <?php echo ((!isset($modules['compare_link']) || ($modules['compare_link'])) ? ' selected="selected"':'');?>>Enabled</option>
                            <option value="0" <?php echo (isset($modules['compare_link']) && !$modules['compare_link']?' selected="selected"':'');?>>Disabled</option>
                    </select>
                &nbsp; <em></em></td>
            </tr>
            
            
			<tr>
                <td colspan="2"><h3>Footer Information:</h3></td>
            </tr>
			<tr>
                <td>Phone Number</td>
                <td><input type="text" id='phone' name="settings_module[phone]" value="<?php echo (isset($modules['phone']) ? $modules['phone'] : '');?>" />
                    
                &nbsp; <em>Example: (555) 123 4567. Leave blank if you don't want section to display</em></td>
            </tr>
			<tr>
                <td>Email</td>
                <td><input type="text" id='email' name="settings_module[email]" value="<?php echo (isset($modules['email']) ? $modules['email'] : '');?>" />
                    
                &nbsp; <em>Leave blank if you don't want section to display</em></td>
            </tr>
			<tr>
                <td>Location</td>
                <td><input type="text" id='location' name="settings_module[location]" value="<?php echo (isset($modules['location']) ? $modules['location'] : '');?>" />
                    
                &nbsp; <em>Leave blank if you don't want section to display</em></td>
            </tr>
            
			<tr>
                <td colspan="2"><h3>Social Icons:</h3></td>
            </tr>
			<tr>
                <td>Facebook</td>
                <td><input type="text" name="settings_module[facebook_icon]" value="<?php echo (isset($modules['facebook_icon']) ? $modules['facebook_icon'] : '');?>" />             
                &nbsp; <em>Enter the link to your Facebook page. Leave blank if you don't want icon to display</em></td>
            </tr>            
			<tr>
                <td>Google+</td>
                <td><input type="text" name="settings_module[google_icon]" value="<?php echo (isset($modules['google_icon']) ? $modules['google_icon'] : '');?>" />             
                &nbsp; <em>Enter the link to your Google+ page. Leave blank if you don't want icon to display</em></td>
            </tr>            
			<tr>
                <td>Skype</td>
                <td><input type="text" name="settings_module[skype_icon]" value="<?php echo (isset($modules['skype_icon']) ? $modules['skype_icon'] : '');?>" />             
                &nbsp; <em>Enter your Skype name. Leave blank if you don't want icon to display</em></td>
            </tr>            
			<tr>
                <td>Twitter</td>
                <td><input type="text" name="settings_module[tweeter_icon]" value="<?php echo (isset($modules['tweeter_icon']) ? $modules['tweeter_icon'] : '');?>" />             
                &nbsp; <em>Enter the link to your Twitter profile. Leave blank if you don't want icon to display</em></td>
            </tr>            
			<tr>
                <td>Pinterest</td>
                <td><input type="text" name="settings_module[pinterest_icon]" value="<?php echo (isset($modules['pinterest_icon']) ? $modules['pinterest_icon'] : '');?>" />             
                &nbsp; <em>Enter the link to your Pinterest page. Leave blank if you don't want icon to display</em></td>
            </tr>         

			<tr>
                <td colspan="2"><h3>Payment Icons:</h3></td>
            </tr>
			<tr>
                <td>Visa</td>
                <td><select name="settings_module[visa_icon]">
                            <option value="0" <?php echo ((!isset($modules['visa_icon']) || (!$modules['visa_icon'])) ? ' selected="selected"':'');?>>Disabled</option>
                            <option value="1" <?php echo (isset($modules['visa_icon']) && $modules['visa_icon']?' selected="selected"':'');?>>Enabled</option>
                    </select> &nbsp; <em>Enable to show this icon in the footer</em></td>
            </tr>                
			<tr>
                <td>Mastercard</td>
                <td><select name="settings_module[mastercard_icon]">
                            <option value="0" <?php echo ((!isset($modules['mastercard_icon']) || (!$modules['mastercard_icon'])) ? ' selected="selected"':'');?>>Disabled</option>
                            <option value="1" <?php echo (isset($modules['mastercard_icon']) && $modules['mastercard_icon']?' selected="selected"':'');?>>Enabled</option>
                    </select> &nbsp; <em>Enable to show this icon in the footer</em></td>
            </tr>                
			<tr>
                <td>Amex</td>
                <td><select name="settings_module[amex_icon]">
                            <option value="0" <?php echo ((!isset($modules['amex_icon']) || (!$modules['amex_icon'])) ? ' selected="selected"':'');?>>Disabled</option>
                            <option value="1" <?php echo (isset($modules['amex_icon']) && $modules['amex_icon']?' selected="selected"':'');?>>Enabled</option>
                    </select> &nbsp; <em>Enable to show this icon in the footer</em></td>
            </tr>                
			<tr>
                <td>Discover</td>
                <td><select name="settings_module[discover_icon]">
                            <option value="0" <?php echo ((!isset($modules['discover_icon']) || (!$modules['discover_icon'])) ? ' selected="selected"':'');?>>Disabled</option>
                            <option value="1" <?php echo (isset($modules['discover_icon']) && $modules['discover_icon']?' selected="selected"':'');?>>Enabled</option>
                    </select> &nbsp; <em>Enable to show this icon in the footer</em></td>
            </tr>                
			<tr>
                <td>PayPal</td>
                <td><select name="settings_module[paypal_icon]">
                            <option value="0" <?php echo ((!isset($modules['paypal_icon']) || (!$modules['paypal_icon'])) ? ' selected="selected"':'');?>>Disabled</option>
                            <option value="1" <?php echo (isset($modules['paypal_icon']) && $modules['paypal_icon']?' selected="selected"':'');?>>Enabled</option>
                    </select> &nbsp; <em>Enable to show this icon in the footer</em></td>
            </tr>      
        </tbody></table>
    </form>
  </div>
</div>

<?php echo $footer; ?>