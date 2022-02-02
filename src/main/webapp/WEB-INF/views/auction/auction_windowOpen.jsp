<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #wrap{
            width: 425px;
            height: 450px;
            background-color: #F1F1F1;
        }
        #leftSpace{
        	width: 100%;
            height: 6%;
        }
        #logo{
            width: 100%;
            height: 20%;
        }
        #logo-div{
            width: 200px;
            height: 100%;
            margin: 0 auto;
        }
        #logo-img{
        	width: 100%;
        	height: 65%;
        	
        }
        #info{
            width: 100%;
            height: 25%;
        }
        #product{
            width: 90%;
            height: 90%;
            border-radius: 5px;
            background-color: #FFFFFF;
            margin: 0 15px;
        }
        #money{
            width: 100%;
            height: 10%;
        }
        #money_box{
            width: 90%;
            height: 90%;
            border-radius: 5px;
            background-color: #FFFFFF;
            margin: 7px 0 0 15px;
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
        #count_box{
            width: 90%;
            height: 90%;
            border-radius: 5px;
            background-color: #FFFFFF;
            margin: 15px 0 0 15px;
        }
        #count{
            width: 100%;
            height: 10%;
        }
        #btn{
            width: 100%;
            height: 11%;
        }
        #auc_btn{
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
        <div id="info">
            <div id="product">
                <div class="subject">
                    <span id="subject_span">상품 정보 </span>
                </div>
                <div class="input-box">
                   
                </div>
            </div>
        </div>
        <div id="money">
            <div id="money_box">
                <div class="subject">
                    <span class="span">수량 입력 :</span>
                </div>
                <div class="input-box">
                    <input type="number" name="" class="input_style">
                </div>
            </div>
        </div>
        <div id="count">
            <div id="count_box">
                <div class="subject">
                    <span class="span">최저가 입력 :</span>
                </div>
                <div class="input-box">
                    <input type="number" name="" class="input_style">
                </div>
            </div>
        </div>
        <div id="btn">
            <input type="submit" style="font-size:17px" id="auc_btn" value="입찰하기">
        </div>
    </div>

</body>
</html>