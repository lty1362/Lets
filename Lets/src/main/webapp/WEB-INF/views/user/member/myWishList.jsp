<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lets</title>
<link rel="stylesheet" href="resources/user/assets/css/member.css">
<link rel="stylesheet" href="resources/user/assets/css/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
	<jsp:include page="../common/navBar.jsp" />
	<jsp:include page="memberModal.jsp" />

   <main>
        <br><br>
        <div class="wrapper">
            <div class="myPage-menubar">
                <div class="myPage-menu1">
                    <div class="user-pic">
                    	<c:choose>
                    		<c:when test="${loginUser.memPic eq null}">
                    			<c:if test="${loginUser.gender eq '여'}">
                    				<img src="resources/user/assets/img/member/woman.png" width="130px" height="130px">
                    			</c:if>
                    			<c:if test="${loginUser.gender eq '남'}">
                    				<img src="resources/user/assets/img/member/man.png" width="130px" height="130px">
                    			</c:if>
                    		</c:when>
                    		<c:otherwise>
                    			 <img src="${loginUser.memPic}" width="130px" height="130px">
                    		</c:otherwise>
                    	</c:choose>
                    </div>
                    <div class="user-nickname">${loginUser.nickname}</div>
                    <div class="user-info-update">
                        <a data-toggle="modal" data-target="#info-Update-Modal">정보 수정하기</a>
                    </div>
                    <div class="menu-list">
                        <img class="my-classes" onclick="myPageIndex(1);" src="resources/user/assets/img/member/classes.png">
                        <img class="my-wishlist" onclick="myPageIndex(2);" src="resources/user/assets/img/member/like.png">
                        <img class="my-order" onclick="myPageIndex(3);" src="resources/user/assets/img/member/delivery.png">
                    </div>
                    <div class="menu-list-info">
                        <div style="margin-right: 40px;">수강중</div>
                        <div style="margin-right: 22px;">좋아요 목록</div>
                        <div>주문 및 배송</div>
                    </div>
                </div>
				
				<script>
					$(function(){
	            		showDiscount(); 
						setInterval(showDiscount,10000);
	            	});
					
					function myPageIndex(num){
						if(num==1){
							location.href="myPage.me";
						}else if(num==2){
							location.href="myWishList.me";
						}else if(num==3){
							location.href="myDeliveryList.me";
						}
					}
					
					//(학천) ajax 할인
					function showDiscount(){
						$.ajax({
							url:"showDiscountLesson.le",
						  	success:function(disc){
							   var result = "";
							   
							   result += '<div>'
		                       result += '<img src="'+disc.lessonCoverImg+'" alt="">'
		                       result += '</div>'
		                       result += '<div id="discount-time">할인 종료 까지 '+disc.discountPeriod+'일 남앗습니다.</div>'
		                       result += '<div class="discount-info">'
		                       result += '<div class="discount-category">'+disc.lessonCategory+'</div>'
		                       result += '<div class="discount-category"><i class="ti-heart"></i>&nbsp;'+disc.likeCount+'</div>'
		                       result += '</div><br>' 
		                       result += '<div class="discount-title">'+disc.lessonTitle+'</div>'
		                       
		                       $(".wrapper .myPage-menu2").html(result); 
		                        
						  },
						  error:function(err){
							  console.log(err);
							  console.log("loading disc failed ajax");
						  }
						});
						
					}
				</script>
				
               <!-- 할인 클래스 (학천)ajax-->
                <div class="myPage-menu2"></div>
                
            </div>

           <div class="myPage-content">
                <div class="my-cont-title2">좋아요 목록</div>
                <div class="my-cont-subTitle">총 ${myWishListCount}개</div>
                <br><br>
                <div class="my-cont">
					<c:choose>
						<c:when test="${empty myWishList}">
		                    <div class="my-cont-1">
		                        <br><br><br><br><br><br><br>
		                       	좋아요한 클래스가 없어요.
		                    </div>
						</c:when>
						<c:otherwise>
		                    <div class="my-cont-3">
		                        <div class="my-wishList-content">
		                        	<c:forEach var="myWish" items="${myWishList}">
			                            <div class="my-wishList-field">
			                                <div class="my-wishList-cont1">
			                                    <img class="my-wishList-img" src="${myWish.lessonCoverImg}" width="100%" height="150px">
			                                    <div class="my-wishList-title">${myWish.lessonTitle}</div>
			                                    <div class="my-wishList-likeCount">
			                                        <ul style="float: right;"><li>♥ ${myWish.likeCount}</li></ul>
			                                    </div>
			                                </div>
			                            </div>
		                        	</c:forEach>
		                        </div>
		                        <br><br>
			                    <div style="clear:both;"></div>
		                	</div>
						</c:otherwise>				
					</c:choose>
	           </div>
			</div>
			<div style="clear:both;"></div>
		</div>
		<br><br><br>
	</main>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>