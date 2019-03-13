
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html >
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.3.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet"></link>
<title>租你幸福--討論區 租屋,房屋買賣,搬家,房屋討論</title>
<style>
.well, .panel {text-align: center;}
</style>
<c:set var="AppName" value="${SYSTEM.systemName}" scope="application"/>
</head>
<body>
</head>
<body>

    
<div class="nav-wrapper">
    <div class="nav">
        <div class="logo" style="line-height: 50px">
            <a href="${pageContext.request.contextPath}">
                <img src="${pageContext.request.contextPath}/images/index.jpg" width="133" height="32">
            </a>
        </div>
        <div class="area" id="areaSelect">
            <a href="javascript:;" >
                <span class="areaTxt">台北市</span> <i class="fa fa-caret-down"></i>
            </a>
        </div>

        <!-- 導航菜單 -->
        <div class="nav-list">
            <ul class="clearfix">
                <li class="">                
                <li class="">
                    <a href="https://rent.591.com.tw/" class="gtm-flag" google-data-stat="頭部導航_租屋_租屋">租屋</a>

                    <!-- 租屋子菜單 -->
                    <div class="sub-nav">
                        <section class="nav-category subnav-rent">
                            <div class="sub-nav-list nav-wide">
                                <dl>
                                    <dt>待租房源</dt>
                                    <dd>
                                        <a href="">所有房源</a>
                                        <a href="">房東出租</a>
                                        <a href="">整層住家</a>
                                        <a href="">社區找房</a>
                                        <a href="">獨立套房</a>
                                        <a href="">地圖找房</a>
                                        <a href="">分租套房</a>
                                        <a href="">捷運找房</a>
                                        <a href="">雅房</a>
                                        <a href="">學校找房</a>
                                    </dd>
                                </dl>
                            </div>
                            <div class="sub-nav-list nav-narrow">
                                <dl>
                                    <dt>租屋工具</dt>
                                    <dd>
                                        <a href="https://help.591.com.tw/category/50/房客手冊.html" google-data-stat="頭部導航_租屋_租屋手冊">租屋手冊</a>
                                        <a href="https://help.591.com.tw/content/51/100/tw/%E7%A7%9F%E5%B1%8B%E5%A5%91%E7%B4%84.html" google-data-stat="頭部導航_租屋_契約下載">契約下載</a>
                                        <a href="https://rent.591.com.tw//rentBroker.html" google-data-stat="頭部導航_租屋_找經紀人">找經紀人</a>
                                    </dd>
                                </dl>
                            </div>
                            <div class="sub-nav-list nav-last">
                                <dl>
                                    <dt>房東/代理人</dt>
                                    <dd>
                                        <p>使用過591房東們的共同見證，最快3天就成交！不要錯過你儘早收租好機會喔！</p>

                                        <a href="https://www.591.com.tw/index.php?module=house&action=postFirst&type=rent" class="nav-btn" google-data-stat="頭部導航_租屋_立即刊登出租廣告">立即刊登出租廣告</a> <a href="https://www.591.com.tw/home/help/chargeIntro/1" class="nav-btn ml15" google-data-stat="頭部導航_租屋_查看收費說明">查看收費說明</a>
                                    </dd>
                                </dl>
                            </div>
                        </section>
                    </div>
                </li>

                <li class="">
                    <a href="?type=1&kind=5" class="gtm-flag" google-data-stat="頭部導航_店面">店面</a>

                    <!-- 店面子菜單 -->
                    <div class="sub-nav">
                        <section class="nav-category subnav-business">
                            <div class="sub-nav-list nav-wide">
                                <dl>
                                    <dt>出租</dt>
                                    <dd>
                                        <a href="?type=1&kind=5" google-data-stat="頭部導航_店面出租">店面出租</a>
                                        <a href="?type=6&kind=5" google-data-stat="頭部導航_店面頂讓">店面頂讓</a>
                                    </dd>
                                </dl>
                            </div>
                            <div class="sub-nav-list nav-wide">
                                <dl>
                                    <dt>出售</dt>
                                    <dd>
                                        <a href="?type=2&kind=5" google-data-stat="頭部導航_店面出售">店面出售</a>
                                    </dd>
                                </dl>
                            </div>

                        </section>
                    </div>
                </li>

                <li class="">
                    <a href="?type=1&kind=6" class="gtm-flag" google-data-stat="頭部導航_辦公">辦公</a>

                    <!-- 辦公子菜單 -->
                    <div class="sub-nav">
                        <section class="nav-category subnav-business">
                            <div class="sub-nav-list nav-wide">
                                <dl>
                                    <dt>出租</dt>
                                    <dd>
                                        <a href="?type=1&kind=6" google-data-stat="頭部導航_辦公出租">辦公</a>
                                        <a href="?type=1&kind=12" google-data-stat="頭部導航_住辦出租">住辦</a>
                                    </dd>
                                </dl>
                            </div>
                            <div class="sub-nav-list nav-wide">
                                <dl>
                                    <dt>出售</dt>
                                    <dd>
                                        <a href="?type=2&kind=6" google-data-stat="頭部導航_辦公出售">辦公</a>
                                        <a href="?type=2&kind=12" google-data-stat="頭部導航_住辦出售">住辦</a>
                                    </dd>
                                </dl>
                            </div>

                        </section>
                    </div>
                </li>

                <li class="">
                    <a href="?type=1&kind=7" class="gtm-flag" google-data-stat="頭部導航_廠房土地">廠房土地</a>

                    <!-- 廠房土地子菜單 -->
                    <div class="sub-nav">
                        <section class="nav-category subnav-business">
                            <div class="sub-nav-list nav-wide">
                                <dl>
                                    <dt>出租</dt>
                                    <dd>
                                        <a href="?type=1&kind=7" google-data-stat="頭部導航_廠房出租">廠房</a>
                                        <a href="?type=1&kind=11" google-data-stat="頭部導航_土地出租">土地</a>
                                    </dd>
                                </dl>
                            </div>
                            <div class="sub-nav-list nav-wide">
                                <dl>
                                    <dt>出售</dt>
                                    <dd>
                                        <a href="?type=2&kind=7" google-data-stat="頭部導航_廠房出售">廠房</a>
                                        <a href="?type=2&kind=11" google-data-stat="頭部導航_土地出售">土地</a>
                                    </dd>
                                </dl>
                            </div>

                        </section>
                    </div>
                </li>

                <li  class="">
                    <a href="https://www.591.com.tw/newCommunity-list.html" class="gtm-flag" google-data-stat="頭部導航_社區_社區">社區</a>
                </li>
                <li class="hasicon ">
                    <a href="" style="" google-data-stat="頭部導航_新建案_新聞資訊">新聞</a>
                </li>

                <li>
                    <a href="javascript:;" class="gtm-flag" >更多</a>

                    <!-- 更多子菜單 -->
                    <div class="sub-nav">
                        <section class="nav-category subnav-more">
                            <div class="sub-nav-list nav-narrow">
                                <dl>
                                    <dt>房屋周邊服務</dt>
                                    <dd>
                                        <a href="https://home.591.com.tw/" google-data-stat="頭部導航_更多_二手家具">二手家具</a>
                                        <a href="//bbs.591.com.tw" google-data-stat="頭部導航_更多_討論區">討論區</a>
                                        <a href="https://www.100.com.tw/works.html?bid=16&utm_source=591.com.tw&utm_medium=referral&utm_campaign=591nav_bar" class="gtm-flag" target="_blank" google-data-stat="頭部導航_裝潢_裝潢">室內設計</a>
                                    </dd>
                                </dl>
                            </div>
                        </section>
                    </div>
                </li>
            </ul>
        </div>

        <!-- 登錄狀態區域 -->
        <div class="login-status">
            <ul>
                <!-- 註冊、登錄 -->
                                    <li class="nav-link">
                        <a href="https://www.591.com.tw/user-login.html" target="_blank" class="gtm-flag" google-data-stat="頭部導航_登入_登入">登入</a>
                        <em class="divide-line"></em>
                        <a href="https://www.591.com.tw/index.php?module=user" target="_blank" class="gtm-flag" google-data-stat="頭部導航_註冊_註冊">註冊</a>

                        <div class="dropbox nav-publish login-notice">
                            <div class="dropbox-arrow"></div>
                            <a href="javascript:;" class="login-close" google-data-stat="頭部導航_登錄提示_關閉提示"></a>
                            <p>親愛的會員，登入功能搬到這裡啦！</p>
                            <a href="https://www.591.com.tw/user-login.html" class="login-btn active mr15" target="_blank" google-data-stat="頭部導航_登錄提示_會員登入">會員登入</a> <a href="https://www.591.com.tw/index.php?module=user" class="login-btn" target="_blank" google-data-stat="頭部導航_登錄提示_免費註冊">免費註冊</a>
                        </div>
                    </li>
                
                <!-- 我要刊登和下拉菜單 -->
                <li class="dropMenu">
                                        <div class="dropbox undis nav-publish">
                        <div class="dropbox-arrow"></div>
                        <ul>
                            <li><a href="https://www.591.com.tw/index.php?module=userCenter" google-data-stat="頭部導航_登錄后下拉_會員中心">會員中心</a></li>
                            <li><a href="https://www.591.com.tw/index.php?module=user&action=logout" google-data-stat="頭部導航_登錄后下拉_退出">退出</a></li>
                        </ul>
                    </div>
                </li>

                <!-- 我要刊登和下拉菜單 -->
                <li class="dropMenu nav-small-post">
                    <a href="https://www.591.com.tw/index.php?module=house&action=postFirst" google-data-stat="頭部導航_我要刊登_我要刊登">我要刊登 <i class="fa fa-caret-down"></i></a>
                    <div class="dropbox undis nav-publish">
                        <div class="dropbox-arrow"></div>
                        <ul>
                            <li>
                                <a target="_blank" href="https://www.591.com.tw/index.php?module=house&action=postFirst&type=rent" google-data-stat="頭部導航_我要刊登_我要刊登">刊登出租</a></li>
                            <li><a target="_blank" href="https://www.591.com.tw/index.php?module=house&action=postFirst&type=sale" google-data-stat="頭部導航_我要刊登_我要刊登">刊登出售</a></li>
                            <li><a target="_blank" href="https://www.591.com.tw/index.php?module=housing&action=housing" google-data-stat="頭部導航_我要刊登_我要刊登">刊登建案</a></li>
                            <li><a target="_blank" href="https://www.591.com.tw/advertisement" google-data-stat="頭部導航_我要刊登_圖片廣告">圖片廣告</a></li>
                            <li><a target="_blank" href="https://www.591.com.tw/home/help/chargeIntro/1" google-data-stat="頭部導航_我要刊登_我要刊登">收費標準</a></li>
                        </ul>
                    </div>
                </li>

                <!-- 幫助及下拉菜單 -->
                <li class="dropMenu nav-small-help">
                    <a href="https://help.591.com.tw/" target="_blank" class="gtm-flag" google-data-stat="頭部導航_幫助_幫助">幫助 <i class="fa fa-caret-down"></i></a>
                    <div class="dropbox undis nav-help">
                        <div class="dropbox-arrow"></div>
                        <dl>
                            <dt>咨詢入口</dt>
                            <dd>
                                                                <a href="javascript:;" onclick="openKF()" google-data-stat="頭部導航_幫助_非會員留言">非會員留言</a>
                                <a href="javascript:;" onclick="openKF()" class="online" google-data-stat="頭部導航_幫助_會員申訴">會員申訴</a>
                                                                <a href="https://www.591.com.tw/index.php?module=userCenter&action=appealList" target="_blank" google-data-stat="頭部導航_幫助_申訴回覆">申訴回覆</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt>新手指南</dt>
                            <dd>
                                <a href="https://www.591.com.tw/index.php?module=user" target="_blank" google-data-stat="頭部導航_幫助_註冊會員">註冊會員</a>
                                <a href="https://help.591.com.tw/content/56/139/tw/忘記密碼找回方法.html" target="_blank" google-data-stat="頭部導航_幫助_忘記帳密">忘記帳密</a>
                                <a href="https://help.591.com.tw/category/57/修改個人資料.html" target="_blank" google-data-stat="頭部導航_幫助_修改個人資料">修改個人資料</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt>房東幫助</dt>
                            <dd>
                                <a href="https://help.591.com.tw/content/20/30/tw/%E5%A6%82%E4%BD%95%E5%88%8A%E7%99%BB%E6%88%BF%E5%B1%8B%E5%BB%A3%E5%91%8A%EF%BC%9F.html" target="_blank" google-data-stat="頭部導航_幫助_如何刊登">如何刊登</a>
                                <a href="https://www.591.com.tw/home/help/chargeIntro/1" target="_blank" google-data-stat="頭部導航_幫助_收費標準">收費標準</a>
                                <a href="https://help.591.com.tw/content/13/5/tw/儲值教學.html" target="_blank" google-data-stat="頭部導航_幫助_付款教學">付款教學</a>
                                <a href="https://help.591.com.tw/category/23/上傳房屋圖檔.html" target="_blank" google-data-stat="頭部導航_幫助_上傳房屋圖片">上傳房屋圖片</a>
                                <a href="https://help.591.com.tw/category/63/房屋廣告管理.html" target="_blank" google-data-stat="頭部導航_幫助_房屋廣告管理">房屋廣告管理</a></dd>
                        </dl>
                        <dl>
                            <dt>經紀人幫助</dt>
                            <dd>
                                <a href="https://www.591.com.tw                                                                            /index.php?module=userCenter&action=rentSaleNewBuy&showType=2 @else/home/help/chargeIntro/2
                                    "
                                    target="_blank" google-data-stat="頭部導航_幫助_售屋套餐介紹">售屋套餐介紹</a>
                                <a href="https://help.591.com.tw/category/30/經紀人認證.html" target="_blank" google-data-stat="頭部導航_幫助_仲介職業認證">仲介職業認證</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt>建築/代銷公司幫助</dt>
                            <dd>
                                <a href="https://help.591.com.tw/content/34/76/tw/%E5%A6%82%E4%BD%95%E5%88%8A%E7%99%BB%E5%BB%BA%E6%A1%88%E5%BB%A3%E5%91%8A%EF%BC%9F.html" target="_blank" google-data-stat="頭部導航_幫助_如何刊登建案廣告">如何刊登建案廣告</a>
                                <a class="highlight" href="https://www.591.com.tw/advertisement" target="_blank" google-data-stat="頭部導航_幫助_我要推廣">我要推廣</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt>客戶服務</dt>
                            <dd>
                                客服電話：02-55722000 <br/>
                                客服傳真：02-55793400 <br/>
                                客服信箱：service@591.com.tw <br/>
                                服務時間：週一至週日 9:00-18:00 <br/>

                                <a href="https://help.591.com.tw/" class="drop-btn" target="_blank" google-data-stat="頭部導航_幫助_查看更多幫助內容">查看更多幫助內容</a>
                            </dd>
                        </dl>
                    </div>
                </li>

                <!-- addcn及下拉菜單 -->
                <li class="dropMenu nav-small-addcn">
                    <a href="http://www.addcn.com/" target="_blank" class="addcn" google-data-stat="頭部導航_addcn_addcn">數字App</a>
                    <div class="dropbox nav-addcn">
                        <div class="dropbox-arrow"></div>
                  

                    </div>
                </li>
            </ul>

        </div>
    </div>
</div>

    <!-- 側邊欄工具箱 -->
    <div id="fixedSide" style="width:70px; display:none;">
        <ul>
            <li class="sideApp"><a href="./iphone-android.html" target="_blank"><em></em><br/>下載591</a></li>
            <li class="sideLine" style="display:none;"><a href="javascript:;"><em></em><br/>在線客服</a></li>
            <li class="sideAdd"><a href="javascript:;" google-data-stat="側邊工具欄_收藏頁面_收藏頁面"><em></em><br/>收藏頁面</a></li>
            <li class="sideProposal"><a href="javascript:;"><em></em><br/>意見反饋</a></li>
            <li class="sideTop"><a href="javascript:;"   ><em></em></a></li>
        </ul>
        <div class="sideCode" style="left:-105px;top:0;"><img src="//images.591.com.tw/index/public/newHead/fixedCode.png" alt="591手機APP" width="105" height="126" /></div>
    </div>

<input type="hidden" id="hid_region" value="台北市">

<script language="javascript" src="./include/javascript/newHeader/jsCookie.js"></script>
<script language="javascript" src="./include/javascript/newHeader/areaBoxNew.js?v=20190312"></script>
<div align="center" style="width:954px; margin:0 auto" id="scrollBar">
    <!-- 广告位 -->
	<div id="PAGE_AD_121"></div>
</div>
<div id="Head">
	<div id="headerTop">
		<div class="logo">
			<a href="${pageContext.request.contextPath}/" target="_top"><img src="//images.591.com.tw/index/public/public/forum.png" width="85" height="27" title="討論區" class="forum-logo" /></a></div>
        <div class="topMenu">
        	 <div class="search">
             <form action="?" method="get" >
                <select class="search-select" name="searchType">
                    <option value="title" >按標題</option>
                    <option value="author" >按作者</option>
                </select>
                <input type="text" id="keyword" data-inside="請輸入要搜尋的關鍵字" autocomplete="off" name="keyword" value="" />
                <input type="submit" class="search-btn" value="搜&nbsp尋" />
                <input type="hidden" id="is_keyword" name="is_keyword" value="1" />
            </form>
            </div>
        	<div class="articleText">文章數: <em>16964</em> 篇</div>
            <div class="onlineText">在線人數：<em>2753</em> 人</div>
        </div>
	</div>
</div>
<div id="nav">
    <div class="nav-head">
        <span><a href="${pageContext.request.contextPath}/" target="_top">討論區首頁</a></span>
    </div>
    <div class="nav-list">
        <ul>
            <li class="first"><a class="black-link " href="./f?forum_type=1">房市討論</a><span>(今日:<em>0</em>)</span><br /><span class="info">市場分析&nbsp;趨勢</span></li>
            <li><a class="black-link " href="./f?forum_type=2">買賣交流</a><span>(今日:<em>0</em>)</span><br /><span class="info">中古屋&nbsp;經驗分享</span></li>
            <li><a class="black-link " href="./f?forum_type=3">租屋交流</a><span>(今日:<em>0</em>)</span><br /><span class="info">新手房東&nbsp;房客</span></li>
            <!--<li><a class="black-link " href="./f?forum_type=5">居家裝潢</a><span>(今日:<em>0</em>)</span><br /><span class="info"><a href="https://design.591.com.tw/index.php?moudle=design&action=newDesignIndex " style="color: red;text-decoration:underline;">裝潢日記</a>&nbsp;設計作品</span></li>-->
            <li><a class="black-link " href="./f?forum_type=6">知識問答</a><span>(今日:<em>0</em>)</span><br /><span class="info">房產知識&nbsp;答疑</span></li>
            <li><a class="black-link " href="./f?forum_type=7">公告&amp;建議</a><span>(今日:<em>1</em>)</span><br /><span class="info">功能建議&nbsp;討論</span></li>
        </ul>
    </div>
    <div class="other-bg"></div>
</div><div class="clear"></div>
<div id="main">
    	<div id="atc-user">
    	<div class="act-info">
        	<div class="img-scroll">
                <div id="j_slide_housing" class="x-slide loading">
                <ol class="x-slide-content">
                                    	<li id="slide1">
                        <a href="https://newhouse.591.com.tw/home/housingArticle/detail?id=63" title="鴻灃ART" target="_blank">
                            <img src="//hp1.591.com.tw/house/active/2017/09/25/150630701910472002_237x140.crop.jpg" width="237" height="140" />            
                  </a>   
                        <div class="opacity-value">開箱文：鴻灃ART</div>  
                        <div class="opacity"></div>               
                  </li>
                                    	<li id="slide2">
                        <a href="https://newhouse.591.com.tw/home/housingArticle/detail?id=62" title="陽光微笑" target="_blank">
                            <img src="//hp1.591.com.tw/house/active/2017/09/22/150608014325320606_237x140.crop.jpg" width="237" height="140" />            
                  </a>   
                        <div class="opacity-value">開箱文：陽光微笑</div>  
                        <div class="opacity"></div>               
                  </li>
                                    	<li id="slide3">
                        <a href="https://newhouse.591.com.tw/home/housingArticle/detail?id=61" title="裕森林" target="_blank">
                            <img src="//hp1.591.com.tw/house/active/2017/09/21/150598711200450205_237x140.crop.jpg" width="237" height="140" />            
                  </a>   
                        <div class="opacity-value">開箱文：裕森林</div>  
                        <div class="opacity"></div>               
                  </li>
                                    	<li id="slide4">
                        <a href="https://newhouse.591.com.tw/home/housingArticle/detail?id=58" title="HD協勝發" target="_blank">
                            <img src="//hp1.591.com.tw/house/active/2017/09/21/150598130553711806_237x140.crop.jpg" width="237" height="140" />            
                  </a>   
                        <div class="opacity-value">開箱文：HD協勝發</div>  
                        <div class="opacity"></div>               
                  </li>
                                    </ol>
               </div>  
               
            </div>
            <div class="act-main">
            	<span class="main">
                	<a class="red-link" href="${pageContext.request.contextPath}/f?action=replay&tid=37122&sub_fid=101">解讀<租賃住宅市場發展及管理條例></a>
                    <span><a class="blue-link" href="${pageContext.request.contextPath}/f?action=replay&tid=37122&sub_fid=101">106年11月28日 立法院三讀通過關於規範租屋市場的條例（詳全文）</a></span>                </span>
                <span class="top">
                	<ul>
                                            	<li><a class="blue-link" href="https://news.591.com.tw/news/10">眷村好好玩～網美最愛「將軍村」Ｘ豫湘美食</a><b class='new'></b></li>
                                            	<li><a class="blue-link" href="http://bbs.591.com.tw/f?action=replay&amp;tid=24527&amp;sub_fid=18">第一次租房，想問一下台北租屋電費</a><b class='new'></b></li>
                                            	<li><a class="blue-link" href="http://bbs.591.com.tw/f?action=replay&amp;tid=28724&amp;sub_fid=18">請問房東們~</a><b class='new'></b></li>
                                            	<li><a class="blue-link" href="https://news.591.com.tw/news/133">「迷路小章魚」 重劃區內的好滋味</a><b class='new'></b></li>
                                            </ul>
                </span>   
                <span class="top2">
                	<ul>
                                            	<li><a class="blue-link" href="http://bbs.591.com.tw/f?action=replay&amp;tid=28706&amp;sub_fid=25">地產投資好去處</a><b class='new'></b><b class='hot'></b></li>
                                            	<li><a class="blue-link" href="https://news.591.com.tw/news/50">可以吹冷氣的菜市場？！-「第六市場」</a><b class='new'></b></li>
                                            	<li><a class="blue-link" href="http://bbs.591.com.tw/f?action=replay&amp;tid=28685&amp;sub_fid=18">房子價值一千多萬.該租多少合理</a><b class='new'></b></li>
                                            	<li><a class="blue-link" href="http://bbs.591.com.tw/f?action=replay&amp;tid=28690&amp;sub_fid=98">租屋未到期 押金問題</a><b class='new'></b></li>
                                            </ul>
                </span>        
            </div>
      </div>
            	<div class="user-login">
        	<span class="login-title">會員登入</span>
            <span class="login-info">
            	<p>
                    帳號:
                    <input type="text" name="user_username" id="user_username" />
                </p>
                <p>
                	密碼:
                	<input type="password" name="user_pwd" id="user_pwd" />
                </p>
                <p style="display:none" id="codeBox">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input tabindex="2" id="user_verifyCode" class="login_box_input" type="verifyCode" maxlength="4" size="10" name="user_verifyCode"  value="驗證碼" style="color:#8B9096; width:55px;margin-right: 5px;vertical-align: middle;"/><img id="verifyCodeImg" src="./include/tools/verifycodeLogin.tool.php?w=55&h=22" onclick="this.src='./include/tools/verifycodeLogin.tool.php?w=55&h=22&s='+Math.ceil(Math.random()*100000);" style="cursor:pointer;vertical-align: middle;" title="點擊刷新"/></p>
                <span class="login-sub">
               		<input type="hidden" id="isShowCode" name="isShowCode" value=""/>
                	<input class="sub" data-stat="form-userlogin" type="button" value="登入" />
                    <a class="forget" href="https://www.591.com.tw/index.php?module=user&action=telmail&found=pwd">忘記密碼?</a>
                </span>
                <span class="login-register">
                	<a class="reg" href="https://www.591.com.tw/index.php?module=user" data-stat="form-freereg" >免費註冊</a>
                </span>
            </span>
        </div>
            </div>
         
    <div id="act-list">
    	<div class="head">
            <div class="pub-btn"><a class="pub" href="./f?action=publish&sub_fid=0">發表文章</a></div>
             
            
            <div class="page-limit">
                <div class="pageBar">
                        <a class="pagePrev first"><span>上一頁</span></a><span class="pageCurrent"> 1 </span><a class="pageNum-form" href='f?firstRow=40&totalRows=14788&module=index&action=index'> 2 </a><a class="pageNum-form" href='f?firstRow=80&totalRows=14788&module=index&action=index'> 3 </a><span class="pageBreak">...</span><a class="pageNum-form" href='f?firstRow=14760&totalRows=14788&module=index&action=index'> 370 </a><a href='f?firstRow=40&totalRows=14788&module=index&action=index' class="pageNext"><span>下一頁</span></a><span class="pageSkip">到第 <input type='text' size='3' id='gotoPage' onkeyup="this.value=this.value.replace(/\D/g,'');" value="1" /> 頁</span><input type="button" value="確定" class="pageBtn" onclick="toPage(this);" /><script type="text/javascript">function toPage(obj){var gotoPage= document.getElementById("gotoPage").value;var goPage =(gotoPage-1)*40 ;if(gotoPage >370) return alert('提示：輸入錯誤'); self.location.href = "f?firstRow="+goPage+"&totalRows=14788&module=index&action=index";}</script>                   </div> 
          </div>
        </div>
        <div class="nav">
        	<ul>
                            	<li class="selected"><a href="./f?">所有文章</a></li>
                <li class=""><a href="./f?type=1">精華文章</a></li>
                <li class=""><a href="./f?type=2">熱門文章</a></li>
                <li class=""><a href="./f?type=3">最新文章</a></li>

                            </ul>
        </div>
        <div class="list-info">
        	<div class="list-title">
                <span class="title">標題</span>
                <span class="pub"><a title="按最後發表時間排序" id="order" href="./f?&order=posttime"></a></span>
                <span class="reply">回覆/查看</span>
                <span class="lastReply"><a title="按最後回覆時間排序" ></a></span>            
            </div>
            <div class="list-content">
                 <ul>
                <li>
    <span class="title-list"><b ></b>
        <span class="title red"><em>[置頂]</em><a style="color:" href="./f?action=replay&tid=36949&sub_fid=101" >警惕：租金低、照片漂亮、要求用信箱聯絡恐為詐騙！</a>
            
            
            
            
            
        </span>
     <!--   -->
    </span>
    <span class="pub-list">管理員<br /><p>2017-09-01 20:11</p></span>
    <span class="reply-list">2/<em>14593</em></span>
    <span class="lastReply-list">蘭C<p class="">2017-12-05 16:11</p></span>                    </li>
<li>
    <span class="title-list"><b class="hot"></b>
        <span class="title red"><em>[置頂]</em><a style="color:" href="./f?action=replay&tid=37325&sub_fid=101" >通知：新租屋法案正式實施！</a>
            
            
            <span class="essence"></span>
            
            
        </span>
 
     <!--   -->
    </span>
    <span class="pub-list">笑一個C<br /><p>2019-02-14 23:51</p></span>
    <span class="reply-list">2/<em>6363</em></span>
    <span class="lastReply-list">喜咪12<p class="">2019-02-25 19:00</p></span>                    </li>
                 </ul>
            </div>
        </div>
        <div class="bottom">
            <div class="pub-btn"><a class="pub" href="./f?action=publish">發表文章</a></div>
            <div class="page-limit-bottom">
                    <div class="pageBar">
                        <a class="pagePrev first"><span>上一頁</span></a><span class="pageCurrent"> 1 </span><a class="pageNum-form" href='f?firstRow=40&totalRows=14788&module=index&action=index'> 2 </a><a class="pageNum-form" href='f?firstRow=80&totalRows=14788&module=index&action=index'> 3 </a><span class="pageBreak">...</span><a class="pageNum-form" href='f?firstRow=14760&totalRows=14788&module=index&action=index'> 370 </a><a href='f?firstRow=40&totalRows=14788&module=index&action=index' class="pageNext"><span>下一頁</span></a><span class="pageSkip">到第 <input style="border: 1px solid #999999;font-family: Arial;margin: 0 4px;padding: 2px 3px;text-align: center;width: 24px;" type='text' size='3' id='gotoPage2' value="1" /> 頁</span><input type="button" value="確定" class="pageBtn" onclick="toPage2(this);" /><script type="text/javascript">function toPage2(obj){var gotoPage= document.getElementById("gotoPage2").value;var goPage =(gotoPage-1)*40 ;if(gotoPage >370) return alert('提示：輸入錯誤');self.location.href = "f?firstRow="+goPage+"&totalRows=14788&module=index&action=index";}</script>                   </div>
          </div>
        </div>
    </div>
</div>
<link type="text/css" rel="stylesheet" href="//statics.591.com.tw/min/?f=global/footer.css" />
<div class="clear"></div>
<!-- 公用底部-liangjilin@addcn.com-20190304 -->
 <div id="newFooter">
    <div class="footnav">
        <div class="grouplink border ellipsis">
            <a href="http://www.addcn.com.tw/investment-basic.html" class="first" target="_blank">投資者專區</a>
            <a href="http://www.addcn.com/about-info.html">關於我們</a>
            <a href="https://www.591.com.tw/advertisement">廣告刊登</a>
            <a href="https://www.591.com.tw/links.html">交換連結</a>
            <a href="https://www.591.com.tw/message-moremessage.html?titleType=news">新聞剪輯</a>
            <a href="http://www.addcn.com.tw/social-welfare2012.html" target="_blank">社會公益</a>
            <a href="http://591.com.tw/yU0">免責聲明</a>
            <a href="http://591.com.tw/yUY">服務條款</a>
            <a href="http://591.com.tw/yUW">隱私權聲明</a>
            <a href="http://www.8591.com.tw/dealer.php" target="_blank">數字經銷商</a>
        </div>
        <div class="grouplink ellipsis">
            <a href="http://www.591.com.hk/" target="_blank">香港591房屋交易網</a>
            <a href="https://rent.591.com.tw/" target="_blank">591租屋</a>
            <a href="https://sale.591.com.tw/" target="_blank">591中古屋</a>
            <a href="https://h.591.com.tw/" target="_blank">591新建案</a>
            <a href="https://www.100.com.tw" target="_blank">100室內設計</a>
            <a href="http://www.8591.com.tw" target="_blank">台灣8591寶物交易網</a>
            <a href="http://www.8591.com.hk" target="_blank">香港8591寶物交易網</a>
            <a href="http://www.8891.com.tw/" target="_blank">8891中古車網</a>
            <a href="http://c.8891.com.tw/" target="_blank" class="noline">8891新車網</a><br/>
            <a href="http://www.101vip.com.tw/" target="_blank">101名品會</a>
            <a href="http://www.518.com.tw/" target="_blank">518人力銀行</a>
            <a href="http://case.518.com.tw/" target="_blank">518外包網</a>
            <a href="https://www.chickpt.com.tw/" data-gtm-stat="新版底部_小雞上工_1" target="_blank">小雞上工</a>
        </div>
        <!-- <div class="fc-gray">
            客服信箱：<a href="mailto:service@591.com.tw">service@591.com.tw</a>　客服電話：02-55722000　(服務時間：週一至週日 9:00-18:00 )
        </div> -->

        <div class="copyright">Copyright &copy; 2007-2019 by Addcn Technology Co., Ltd. All Rights reserved.</div>

    </div>
</div>
    <!-- analytics.js 最新的Google網站統計代碼 -->
    <script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

        //全站跟蹤碼
        ga('create', 'UA-2021527-18', 'auto');
        ga('require', 'displayfeatures');
        ga('send', 'pageview');

        //全站測試跟蹤碼 - GA測試使用
        ga('create', 'UA-58691382-1', 'auto', {'name': 'testUA'});
        ga('require', 'displayfeatures');
        ga('testUA.send', 'pageview');
        

                (function() {
            //591 stat
            var stat591 = document.createElement('script'); stat591.type = 'text/javascript'; stat591.async = true;
            stat591.src = 'https:' == document.location.protocol ? 'https://www.591.com.tw/action/stat/' : 'https://www.591.com.tw/action/stat/';
            (document.getElementsByTagName('head')[0]).appendChild(stat591);
        })();
    </script>
  
    <!-- Alexa统计 -->
    <script type="text/javascript">
    _atrk_opts = { atrk_acct:"H0Bki1aUCm00oR", domain:"591.com.tw",dynamic: true};
    (function() { var as = document.createElement('script'); as.type = 'text/javascript'; as.async = true; as.src = "https://d31qbv1cthcecs.cloudfront.net/atrk.js"; var s = document.getElementsByTagName('script')[0];s.parentNode.insertBefore(as, s); })();
    </script>
    <noscript><img src="https://d5nxst8fruw4z.cloudfront.net/atrk.gif?account=H0Bki1aUCm00oR" style="display:none" height="1" width="1" alt="" /></noscript>

    <!-- 防止其他頁面iframe嵌入 -->
    <script type="text/javascript">
        try{
            top.location.hostname;
            if (top.location.hostname != window.location.hostname) {
                top.location.href =window.location.href;
            }
        }
        catch(e){
            top.location.href = window.location.href;
        }
    </script>

<script type="text/javascript">
(function(){
    function addEventFn(obj, oEvn, fn) {
        if(obj.addEventListener) {
            obj.addEventListener(oEvn,fn,false);
        } else {
            obj.attachEvent('on'+oEvn,fn);
        }
    }
    // 如果文檔内容高度小於瀏覽器可視區底部置底
    function footBeBootom() { // 使用addEventListener避免多個window.onload
        var footer = document.getElementById('newFooter');
        if(document.body.clientHeight < document.documentElement.clientHeight) {
            footer.className = 'fixFooter'
        }
        footer.style.opacity = '1';
    };
    addEventFn(window, 'load', footBeBootom);
})();
</script><script type="text/javascript" src="//statics.591.com.tw/javascript/jquery-1.3.2.min.js"></script>
<script type="text/javascript" language="javascript" src="//statics.591.com.tw/min/?f=common.js,jquery.inside.js,jquery.slide.js,jquery.upScroll.js,jquery.cookie.js,stat.js,forum.js"></script>
<script type="text/javascript">
  $jq.slide({
  	id:"j_slide_housing",
  	auto:true,
  	effect:"fade",
  	event:"mouse"
  });
  $jq.upScroll({
  	_wrap:$jq(".top ul")
  });
  $jq.upScroll({
  	_wrap:$jq(".top2 ul")
  });
  if ($jq.browser.msie) {
  	$jq("#act-list .list-content li:even").addClass("odd");
  }
  $jq("#act-list .list-content li").hover(function() {
     $jq(this).addClass("hover");
  }, function() {
     $jq(this).removeClass("hover");
  }); 
</script>

</body>
</html>

</div>
</body>
</html>