<?php
// If different than category Layout
if ($current_layout==1){ ?>

<div class="camera_white_skin camera_wrap" id="camera_wrap<?php echo $module;?>">
    <?php foreach ($banners as $banner) { ?>
	    <?php if ($banner['link']) { ?>
	    <div data-src="<?php echo $banner['image']; ?>" data-thumb="<?php echo $banner['image']; ?>"  data-link="<?php echo $banner['link']; ?>"></div>
	    <?php } else { ?>
	    <div data-src="<?php echo $banner['image']; ?>" data-thumb="<?php echo $banner['image']; ?>"></div>
	    <?php } ?>
    <?php } ?>
</div>

<div class="h15"></div>

<script type="text/javascript"><!--
$('#camera_wrap<?php echo $module;?>').camera({
	height: '40%',
	fx: "random",
	thumbnails: true,
	loader: true,
	hover: true,
	time: 6000,
	transPeriod: 1000
	
});
--></script>

<?php } else { 

	$GLOBALS['category_banner'] = '<div class="camera_white_skin camera_wrap" style="width: 740px;" id="camera_wrap'.$module.'">'; ?>
    <?php foreach ($banners as $banner) { ?>
	    <?php if ($banner['link']) { ?>
<?php $GLOBALS['category_banner'] .= '<div data-src="'.$banner['image'].'" data-thumb="'. $banner['image'].'"  data-link="'. $banner['link'].'"></div>';?>
	    <?php } else { ?>
<?php $GLOBALS['category_banner'] .= '<div data-src="'.$banner['image'].'" data-thumb="'. $banner['image'].'"></div>';?>
	    <?php } ?>
    <?php } ?>
<?php $GLOBALS['category_banner'] .= '</div><div class="h15"></div>

<script type="text/javascript"><!--
$("#camera_wrap'.$module.'").camera({
	height: "20%",
	fx: "random",
	thumbnails: false,
	pagination: false,
	loader: true,
	hover: true,
	time: 6000,
	transPeriod: 1000
});
--></script>'; ?>

<?php } ?>

