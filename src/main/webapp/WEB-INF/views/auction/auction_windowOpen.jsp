<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최저가 입찰</title>
<style>
     #wrap{
            width: 425px;
            height: 300px;
            background-color: #F1F1F1;
        }
        #leftSpace{
        	width: 100%;
            height: 8%;
        }
        #logo{
            width: 100%;
            height: 25%;
        }
        #logo-div{
            width: 200px;
            height: 100%;
            margin: 0 auto;
        }
        #logo-img{
        	width: 90%;
        	height: 60%;
        	
        }
        #money{
            width: 100%;
            height: 15%;
        }
        #money_box{
            width: 90%;
            height: 90%;
            border-radius: 5px;
            background-color: #FFFFFF;
            margin: 3px 0 0 15px;
        }
        .subject{
            width: 30%;
            height: 100%;
            float: left;
        }
        .span{
            font-family: 'NanumSquare';
            font-size: 13px;
            display: block;
            position: relative;
            margin-left: 45px; 
            top: 13px;
            text-align: right;
        }
        #subject_span{
            font-family: 'NanumSquare';
            font-size: 13px;
            display: block;
            position: relative;
            margin-left: 45px; 
            top: 45px;
            text-align: right;
        }
        .input-box{
            width: 68%;
            height: 100%;
            float: left;
        }
        .input_style{
            width: 90%;
            height: 100%;
            margin-left: 10px;
            border: none;
            text-align: center;
        }
         #count{
            width: 100%;
            height: 15%;
        }
        #count_box{
            width: 90%;
            height: 90%;
            border-radius: 5px;
            background-color: #FFFFFF;
            margin: 15px 0 0 15px;
        }
        #btn{
            width: 100%;
            height: 15%;
        }
        #aucBtn{
            width: 60%;
            height: 90%;
            background-color: #3BBD5A;
            border-radius: 10px;
            border: none;
            color: #FFFFFF;
            font-family: 'NanumSquare';
            margin-left: 75px;
            margin-top: 20px;
        }
    </style>

</head>
<body>


  <div id="wrap">
  		<div id="leftSpace"></div>
        <div id="logo">
            <div id="logo-div">
                <img src="/resources/main/img/shop123_logo.png" alt="123상회" id="logo-img">
            </div>
        </div>
        
      <form action="" method="post">
      	<input type="hidden" name="aucProduct" value="${aucProduct }"/>
        <div id="money">
            <div id="money_box">
                <div class="subject">
                    <span class="span">수량 입력 :</span>
                </div>
                <div class="input-box">
                    <input type="number" name="auctionCount" class="input_style" >
                </div>
            </div>
        </div>
        <div id="count">
            <div id="count_box">
                <div class="subject">
                    <span class="span">최저가 입력 : ${aucPrice }</span>
                </div>
                <div class="input-box">
                    <input type="number" name="lowestPrice" class="input_style">
                </div>
            </div>
        </div>
        <div id="btn">
            <input type="submit" style="font-size:17px" id="aucBtn" value="입찰하기">
        </div>
       </form>
    </div>
    
    <script>
    //최저가랑 수량 둘다 입력했을 경우에만 입찰 가능
    	$('#aucBtn').click(function(){
    		
    		var auctionCount = $('input[name=auctionCount]').val();
    		var lowestPrice = $('input[name=lowestPrice]').val();
    		
    		//공백일 경우
    		if(auctionCount==''){
    			alert('수량을 입력해주세요.');
    			return false;
    		}
    		if(lowestPrice==''){
    			alert('최저가를 입력해주세요.');
    			return false;
    		}
    		
    		
    	});
    
		$(function(){
    		console.log("aa");
    	});
    
    </script>

</body>
</html>