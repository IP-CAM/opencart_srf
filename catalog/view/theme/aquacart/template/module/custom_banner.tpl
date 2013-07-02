<div id="custom_banner<?php echo $module; ?>" class="custom_banner">
  <?php foreach ($banners as $i=>$banner) { ?>
  <?php if ($banner['link']) { ?>
  <div<?php echo ((count($banners)==2)&&($i==0) ? ' style="margin-right: 16px;"' : "");?>><a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></a></div>
  <?php } else { ?>
  <div<?php echo ((count($banners)==2)&&($i==0) ? ' style="margin-right: 16px;"' : "");?>><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></div>
  <?php } ?>
  <?php } ?>
</div>