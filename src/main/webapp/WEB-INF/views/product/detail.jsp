<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/detail.css">
<link href="http://fonts.googleapis.com/css?family=Architects+Daughter" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<%@include file="../includes/header.jsp"%>
	<div class="container">
		<!-- container left -->
        <div class="product-imgs">
			<img src="/resources/images/shoe_1.jpg" alt="shoe image">
        </div>
        <!-- container right -->
        <div class="product-content">
          <h2 class="product-title">nike shoes</h2>
           <a href="#" class="product-link">visit nike store</a>
          <div class="product-rating">
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star-half-alt"></i>
            <span>4.7(21)</span>
          </div>

          <div class="product-price">
            <p class="price">Price: <span>$249.00 (5%)</span></p>
          </div>

          <div class="product-detail">
            <h2>about this item: </h2>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Illo eveniet veniam tempora fuga tenetur placeat sapiente architecto illum soluta consequuntur, aspernatur quidem at sequi ipsa!</p>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Illo eveniet veniam tempora fuga tenetur placeat sapiente architecto illum soluta consequuntur, aspernatur quidem at sequi ipsa!</p>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Illo eveniet veniam tempora fuga tenetur placeat sapiente architecto illum soluta consequuntur, aspernatur quidem at sequi ipsa!</p>
            <ul>
              <li>Color: <span>Black</span></li>
              <li>Available: <span>in stock</span></li>
              <li>Category: <span>Shoes</span></li>
              <li>Shipping Area: <span>All over the world</span></li>
              <li>Shipping Fee: <span>Free</span></li>
            </ul>
          </div>

          <div class="purchase-info">
				<div class="handle-counter" id="handleCounter">
					<button class="counter-minus btn btn-primary">-</button>
					<input type="text" value="1">
					<button class="counter-plus btn btn-primary">+</button>
				</div>
				<button type="button" class="bt" onclick="moveCart();">
              ???????????? <i class="fas fa-shopping-cart"></i>
            </button>
            <button type="button" class="bt" onclick="movePurchase();">????????????</button>
          </div>
        </div>
      </div>
	
	<footer>
		<h3>C C. color custom</h3>
	</footer>
	
	<script src="/resources/js/handleCounter.js"></script>
	<script>
		var quantity = 1; // ?????? ?????????
		var options = {
			minimum: 1, // ?????? ??????
            maximize: 10, // ?????? ??????
            onChange: function(cnt) {
            	quantity = cnt;
            },
            onMinimum: function(cnt) {
                console.log('reached minimum: '+ cnt);
            },
            onMaximize: function(cnt) {
                console.log('reached maximize: '+ cnt);
            }
        };
		
        $('#handleCounter').handleCounter(options);
		
		// db??? ?????? ?????????
		const form = {
				userId : 'aaa',
				itemName : 'good',
				color : '',
				size : '',
				quantity : '',
				price : '2000',
				category : '4', // ????????????
				image : ''
		}
		// ???????????? ??????
		function moveCart() {
			if(confirm('??????????????? ?????????????????????????')) {
				form.quantity = quantity;
				$.ajax({
					url : '/cart',
					type : 'POST',
					data : form,
					success: function(result) {
						if(confirm('??????????????? ?????????????????????????')) {
							location.href = '/cart';
						}
					}	
				});
			}
		}
		// ?????? ??????
		function movePurchase() {
			if(confirm('????????? ?????????????????????????')) {
				location.href = '/purchase';
			}
		}
	</script>
</body>
</html>