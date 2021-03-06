<?php if(!isset($GLOBALS["sliding_products"]) || ($GLOBALS["sliding_products"]==0)){ ?>
 
  <h1 class="general_heading"><span><?php echo $heading_title; ?></span></h1>
       
  <div class="products_container">
    <?php foreach ($products as $product) { ?><div class='product_holder'>
		<div class='product_holder_inside'>	

	    <?php if ($product['special']) { ?>
	    <?php echo '<div class="special_promo"></div>'; ?>
	    <?php } ?> 
	            
	        <?php if ($product['thumb']) { ?>
	        <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
	        <?php } ?>
	        <div class="pr_info">
		        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
		        <?php if ($product['price']) { ?>
		        <div class="price">
		          <?php if (!$product['special']) { ?>
		          <?php echo $product['price']; ?>
		          <?php } else { ?>
		          <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
		          <?php } ?>
		        </div>
		        <?php } ?>
		        <div class="cart"><a class='button' onclick="addToCart('<?php echo $product['product_id']; ?>');"><span><?php echo $button_cart; ?></span></a></div>
			</div>
	   </div>
	</div><?php } ?>    
  </div>

<?php }else{ ?>

<script type="text/javascript" src="catalog/view/javascript/jquery/jquery.jcarousel.min.js"></script>


  <h1 class="general_heading"><span><?php echo $heading_title; ?></span>
    <?php if(count($products)>4){ ?>
  	<div class="jcarousel_arrows">
  		<b id="mycarousel_latest-prev" class="custom-prev"></b>
        <b id="mycarousel_latest-next" class="custom-next"></b>
    </div>
    <?php } ?>    
  </h1>
  <div class="products_container">
  <div id="latest_slider" class="jcarousel-custom">
  <ul class="jcarousel-skin-opencart">
    <?php foreach ($products as $product) { ?><li><div class='product_holder'>
		<div class='product_holder_inside'>	

	    <?php if ($product['special']) { ?>
	    <?php echo '<div class="special_promo"></div>'; ?>
	    <?php } ?> 
	            
	        <?php if ($product['thumb']) { ?>
	        <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
	        <?php } ?>
	        <div class="pr_info">
		        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
		        <?php if ($product['price']) { ?>
		        <div class="price">
		          <?php if (!$product['special']) { ?>
		          <?php echo $product['price']; ?>
		          <?php } else { ?>
		          <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
		          <?php } ?>
		        </div>
		        <?php } ?>
		        <div class="cart"><a class='button' onclick="addToCart('<?php echo $product['product_id']; ?>');"><span><?php echo $button_cart; ?></span></a></div>
			</div>
	   </div>
	</div></li><?php } ?>
  </ul>
</div>
</div>

<script type="text/javascript"><!--

function mycarousel_latest_initCallback(carousel) {
	
    $('#mycarousel_latest-next').bind('click', function() {
        if(!$(this).hasClass('custom-next_disabled')){
        	carousel.next();
        }
        return false;
    });

    $('#mycarousel_latest-prev').bind('click', function() {
    	if(!$(this).hasClass('custom-prev_disabled')){
        	carousel.prev();
    	}
        return false;
    });
};

function lastItemReached_latest(carousel, li_object, index, state_action){
	if(index == <?php echo count($products);?>){
		$('#mycarousel_latest-next').addClass('custom-next_disabled');
	}else {
		$('#mycarousel_latest-next').removeClass('custom-next_disabled');
	}
}

function firstItemReached_latest(carousel, li_object, index, state_action){
	if(index == 1){
		$('#mycarousel_latest-prev').addClass('custom-prev_disabled');
	}else {
		$('#mycarousel_latest-prev').removeClass('custom-prev_disabled');
	}
}

$('#latest_slider ul').jcarousel({
	scroll: 4,
	easing: 'easeInOutExpo',
	animation: 800,
<?php if($this->language->get('direction')=='rtl'){?>
	rtl: true, 
<?php }?>	
	initCallback: mycarousel_latest_initCallback,
	buttonNextHTML: null,
    buttonPrevHTML: null,
    itemLastInCallback: {
    	  onBeforeAnimation: lastItemReached_latest
    },
	itemFirstInCallback: {
		onBeforeAnimation: firstItemReached_latest
	}
});
//--></script>

<?php } ?>