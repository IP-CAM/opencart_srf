// Push the top links away from Cart
function positionHeaderLinks(){
	var cart_header_w = $('#cart-total').width();
	if(cart_header_w>=124){
		$('#header_links').css('right',(cart_header_w+78)+'px');
	}
}

// Prod add
function addProductCount(){
	
	var q = parseInt($('#quantity').val());
    if(q > 0){
    	$('#quantity').val(q+1);
    }         
    return false;
}



function subProductCount(){

	var q = parseInt($('#quantity').val());
    if(q > 1){
    	$('#quantity').val(q-1);
    }         
    return false;
}


// Bind the possible Add to Cart btns with event to position top links
$(document).ready(function(){
	
	// Menu Animation
    $('#menu ul li').hover(
        function() {
            $(this).addClass("active");
            $(this).find('div').stop(false, true).slideDown({
            	duration:300,
            	easing:"easeOutExpo"});
        },
        function() {
            $(this).removeClass("active");        
            $(this).find('div').stop(false, true).slideUp({
            	duration:100,
            	easing:"easeOutExpo"});
        }
    );

    positionHeaderLinks();	
	
	$('.cart a').bind('click',function(){
		positionHeaderLinks();
	});
	$('.cart .sm_button').bind('click',function(){
		positionHeaderLinks();
	});
	$('.cart .button').bind('click',function(){
		positionHeaderLinks();
	});
	
	
	
	
	/* Override the Ajax Cart */

	$('#cart > .heading a').die('click');
	$('#cart').die('mouseleave');
	

	
	$('#cart > .heading a').live('click', function() {
	
		$('#header #cart .content').slideDown(400);
		$('#cart').addClass('active');
				
		$('#cart').load('index.php?route=module/cart #cart > *');
		$('#cart').live('mouseleave', function() {
			$('#header #cart .content').slideUp(200, function(){
				$(this).removeClass('active');
			});
		});
	});


	// Fading products	
	$('#content .product_holder').hover(
		    function() {
		    	if(typeof(fading_effects) != "undefined" && fading_effects){
		    		$(this).siblings().find('img').stop().fadeTo(150, 0.6);
		    		$(this).siblings().find('.special_promo').stop().fadeTo(150, 0.6);
		    	}
		    },
		    function() {
		    	if(typeof(fading_effects) != "undefined" && fading_effects){
		    		$(this).siblings().find('img').stop().fadeTo(150, 1);
		    		$(this).siblings().find('.special_promo').stop().fadeTo(150, 1);
		    	}
		    }	
	);

	$('#content .jcarousel-item').hover(
			function() {
		    	if(typeof(fading_effects) != "undefined" && fading_effects){
		    		$(this).siblings().find('img').stop().fadeTo(300, 0.5);
		    	}
			},
			function() {
		    	if(typeof(fading_effects) != "undefined" && fading_effects){
		    		$(this).siblings().find('img').stop().fadeTo(300, 1);
		    	}
			}
	);
	
	// Sidebar Nav effects
	
	$('.side_bar_nav a').not(".active").hover(
			function() {
				$(this).children('.hover_span').stop().animate({width:'100%'},500,'easeOutExpo');
			},
			function() {
				$(this).children('.hover_span').stop().animate({width:'0'},200,'easeOutExpo');
			}
	);	
	
	
});




