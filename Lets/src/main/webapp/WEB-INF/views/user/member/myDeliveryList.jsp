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

               <!-- 할인 클래스(학천)ajax -->
                <div class="myPage-menu2"></div>
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
		  
          <div class="myPage-content">
          <div class="my-cont-title2">주문 및 배송</div>
          <div class="my-cont-subTitle">총 ${myDlistCount}개</div>
          <br><br>
          <div class="my-cont">
			<c:choose>
				<c:when test="${empty myDlist}">
					<div class="my-cont-1">
						<br><br><br><br><br><br><br>
	                  	아직 구매하신 클래스가 없어요.
	              	</div>
				</c:when>
				<c:otherwise>
	              <div class="my-cont-3">
	                  <form action="" method="post" id="myDelivery">
	                  	  <c:forEach var="d" items="${myDlist}" varStatus="status">
		                      <div class="delivery-list" onclick="myDeliveryDetail(this);">
		                  	  <input type="hidden" id="memPayNo" name="memPayNo" value="${myDlist[status.index].memPayNo}">
		                          <div class="d-lecture-thumbnail">
		                              <img src="${d.lessonCoverImg}" width="100%" height="100%" >
		                          </div>
		                          <div class="d-lecture-info">
		                              <div class="d-payment-date">${d.paymentDate}</div>
		                              <div class="d-lecture-title">${d.lessonTitle}</div>
		                              <div class="d-lecture-end-date">${d.cancelDate} 수강만료</div>
		                          </div>
		                          <div class="d-delivery-status">
		                          	  <c:if test="${d.status eq '결제취소'}">
			                              <div class="d-lecture-status">결제 취소완료</div>
		                          	  </c:if>
		                          	  <c:if test="${d.status ne '결제취소'}">
			                              <div class="d-lecture-status">${d.delStatus}</div>
		                          	  </c:if>
		                              <div class="d-lecture-btn">
		                                  <c:choose>
		                                      <c:when test="${(d.delStatus eq '배송전')&&(d.status ne '결제취소')}">
		                                          <button type="button" class="cancelPayment genric-btn primary small radius" onclick="event.stopPropagation();" style="font-size: 4px;">결제취소</button>
		                                      </c:when>
		                                      <c:when test="${(d.delStatus eq '배송완료')&&(d.status ne '결제취소')}">
		                                          <button type="button" class="confirmDelivery genric-btn primary small radius" onclick="event.stopPropagation();" style="font-size: 4px;">배송확정</button>
		                                      </c:when>
		                                      <c:when test="${d.delStatus eq '배송확정'}"> </c:when>
		                                  </c:choose>
		                              </div>
		                          </div>
		                      </div>
	                  	  </c:forEach>
	                  </form>
	               </div>
				</c:otherwise>
			</c:choose>
          </div>
	
      </div>

      <script>
      	  function myDeliveryDetail(e){
      		  $("#memPayNo").val(e.children[0].value);
      		  $("#myDelivery").attr("action","myDetailDel.me").submit();
      	  }

      	  $('.cancelPayment').click(function(){
	       	  if(confirm('클래스 결제를 취소하시겠습니까?')){
	       		  console.log(this.parentNode.parentNode.parentNode.children[0].value);
	       		$("#memPayNo").val(this.parentNode.parentNode.parentNode.children[0].value);
	       		$("#myDelivery").attr("action","myCancelDel.me").submit();
	          }else{
	              return false;
	          }
      	  });
      	  $('.confirmDelivery').click(function(){
	    	  if(confirm('클래스 배송 확정하시겠습니까?')){
	    		  console.log(this.parentNode.parentNode.parentNode.children[0].value);
	    		  $("#memPayNo").val(this.parentNode.parentNode.parentNode.children[0].value);
	    		  $("#myDelivery").attr("action","myUpdateDel.me").submit();
	          }else{
	              return false;
	          }
      	  })

      </script>

      <div style="clear:both"></div>
      <br><br><br><br><br>
  </div>
      
  </main>
  <jsp:include page="../common/footer.jsp" />   
</body>
</html>