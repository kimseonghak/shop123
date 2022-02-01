<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매</title>
  <link rel="preconnect"href="https://fonts.googleapis.com">
  <link rel="preconnect"href="https://fonts.gstatic.com"crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:ital@1&family=Lobster&family=Nanum+Gothic&family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@700&family=Pacifico&display=swap"rel="stylesheet">
  @charset "UTF-8";

<style>
 #wrap {
            width: 100%;
            margin: 0 auto;
        }


       /* 콘텐츠 */
    #content {
        width: 100%;
        height: 1000px;
        background-color: #fafafa;
    }

    .box1 {
        width: 15%;
        height: 100%;
        float: left;
    }

    #main {
        width: 70%;
        height: 100%;
        float: left;
    }

    #box2 {
        width: 100%;
        height: 275px;
    }

    #subject-box {
        width: 100%;
        height: 59px;
    }

    #subject {
        width: 220px;
        height: 37px;
        margin-top: 10px;
        margin-left: 43%;
    }

    #subject>span {
        font-size: 28px;
        font-family: 'NanumSquare';
        color: #3BBD5A;
        font-weight: bold;
    }

    #box3 {
        width: 100%;
        height: 70px;
    }

    #auction-box {
        width: 100%;
        height: 365px;
    }

    .aution {
        width: 30%;
        height: 100%;
        float: left;
        margin-right: 5%;
    }

    #aution1 {
        width: 30%;
        height: 100%;
        float: left;
    }

    #box4 {
        width: 100%;
        height: 184px;
    }

    .high {
        width: 100%;
        height: 20%;
        border-radius: 10px 10px 0 0;
        background-color: #3BBD5A;
    }
   

    .row {
        width: 100%;
        height: 79.9%;
        border-radius: 0 0 10px 10px;
        background-color: #E4FFF8;
    }
    .row-1 {
        width: 100%;
        height: 79.9%;
        border-radius: 0 0 10px 10px;
        background-color: #E4FFF8;
    }

    #high-1 {
        width: 100%;
        height: 40%;
    }

    #high-1>span {
        font-size: 16px;
        color: #FFFFFF;
        font-family: 'NanumSquare';
        height: 100%;
        display: block;
        margin-left: 10px;
        line-height: 30px;
    }
    #high-2 {
        width: 100%;
        height: 59%;
    }

    #high-2>span {
        font-size: 25px;
        color: #FFFFFF;
        font-family: 'NanumSquare';
        font-weight: bold;
        display: block;
        text-align: center;
        margin-top: -5px;
    }

    .table {
        font-size: 16px;
        font-family: 'NanumSquare';
        margin: 0 auto;
        line-height: 36px;

    }

    .info {
        text-align: center;
    }

    .data {
        text-align: center;
    }
    .input {
        text-align: center;
        line-height: 60px;
    }

    .center {
        text-align: center;
    }
   
    #line {
        line-height: 32px;
        color: #E4FFF8;
    }

    #btn {
        display: inline-block;
        position: relative;
        height: 37px;
        width: 140px;
        border-radius: 10px;
        background-color: #3BBD5A;
        border: none;
        font-size: 17px;
        top: 20px;
    }
    .block{
        width: 100%;
        height: 100%;
        background-color: black;
        margin-top: -213px;
        border-radius: 0 0 10px 10px;
        opacity: 0.65;
    }
    .block>span{
        display: block;
        line-height: 270px;
        text-align: center;
        font-size: 25px;
        color: #FFFFFF;
        font-family: 'NanumSquare';
}
</style>
</head>
<body>
  <div id="wrap">
        
        <c:import url="/WEB-INF/views/commons/header.jsp"/>
        
        <div id="box"></div>
        <div id="content">
                <div class="box1"></div>
            <div id="main">
                <div id="box2"></div>
                <div id="subject-box">
                    <div id="subject"><span>이달의 판매 현황</span></div>
                </div>
                <div id="box3"></div>
                <div id="auction-box">
                    <div class="aution">
                        <div class="high">

                            <!-- 경매 폼 로직-->
                            <div id="high-1"><span>구매 가능</span></div>
                            <div id="high-2"><span>햇터 곶감</span></div>
                        </div>
                        <div class="row">

                            <!-- 경매 폼 로직-->
                            <form>
                                <table class="table">
                                    <tr>
                                        <td colspan="2" id="line">ss</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="info">1kg</td>
                                    </tr>
                                    <tr>
                                        <td class="center">현재 상품 수량 :</td>
                                        <td class="data" style="color:#FE0011">200</td>
                                    </tr>
                                    <tr>
                                        <td class="center">낙찰된 가격 :</td>
                                        <td class="data" style="color: #009A41">15200원</td>
                                    </tr>
                                    <tr>
                                        <td class="center">구매 수량 :</td>
                                        <td class="input"><input type="text" name="count" size="10" style="border: 2px solid #3BBD5A; text-align: center;" /></td>
                                       
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="info"><input type="button" style="color: white" id="btn" value="구매하기" /> </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </div>
                    <div class="aution">
                        <div class="high">
                             <div id="high-1"></div>
                            <div id="high-2"><span>전복</span></div>
                        </div>
                        <div class="row-1">
                            <form>
                                <table class="table">
                                     <tr>
                                        <td colspan="2" id="line">ss</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="info">1kg</td>
                                    </tr>
                                    <tr>
                                        <td class="center">현재 상품 수량 :</td>
                                        <td class="data" style="color:#FE0011">품절</td>
                                    </tr>
                                    <tr>
                                        <td class="center">낙찰된 가격 :</td>
                                        <td class="data" style="color: #009A41">15200원</td>
                                    </tr>
                                    <tr>
                                        <td class="center line-height">구매 수량 :</td>
                                        <td class="input"><input type="text" name="count" size="10" style="border: 2px solid #E9E9E9; text-align: center" /></td>
                                       
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="info"><input type="button" style="color: white" id="btn" value="구매하기" /> </td>
                                    </tr>
                                </table>
                            </form>
                            <div class="block"><span>판매 종료</span></div>
                        </div>
                    </div>
                    <div id="aution1">
                        <div class="high">
                             <div id="high-1"></div>
                            <div id="high-2"><span>전복</span></div>
                        </div>
                        <div class="row-1" >
                              <form>
                                <table class="table">
                                     <tr>
                                        <td colspan="2" id="line">ss</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="info">1kg</td>
                                    </tr>
                                    <tr>
                                        <td class="center">현재 상품 수량 :</td>
                                        <td class="data" style="color:#FE0011">품절</td>
                                    </tr>
                                    <tr>
                                        <td class="center">낙찰된 가격 :</td>
                                        <td class="data" style="color: #009A41">15200원</td>
                                    </tr>
                                    <tr>
                                        <td class="center">구매 수량 :</td>
                                        <td class="input"><input type="text" name="count" size="10" style="border: 2px solid #E9E9E9" /></td>
                                       
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="info"><input type="button" style="color: white" id="btn" value="구매하기" /> </td>
                                    </tr>
                                </table>
                            </form>
                            <div class="block"><span>판매 종료</span></div>
                        </div>
                    </div>
                </div>
                <div id="box4"></div>
            </div>
            <div class="box1"></div>
        </div>
		<c:import url="/WEB-INF/views/commons/footer.jsp"/>
    </div>
</body>
</html>