<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">

<title>联系我们</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript" src="./JS/jquery-1.11.0.js"></script>
<style type="text/css">
.background {
	width: 1004px;
	overflow: auto;
	margin: 0 auto;
}


.tBody {
	width: 992px;
	margin-top: 10px;
	min-height: 400px;
	float: left;
	font-size: 14px;
	font-family: 微软雅黑;
	border: 6px solid #EAEAEA;
}

.lf_bottom {
	width: 992px;
	height: 120px;
	float: left;
	margin-top: 10px;
	border: 6px solid #EAEAEA;
}
  #container
        {
            width:540px;
            height: 400px;
           
        
        }
        a img
	{ 
				border:none;
	}
</style>
<script type="text/javascript">
	function getbiaoji() {
            var lng = document.getElementByIdx_x("lng").value;
            var lat = document.getElementByIdx_x("lat").value;

            var map = new BMap.Map("container");
            var point = new BMap.Point(lng, lat);
            var marker = new BMap.Marker(point);
            var opts = {
                width: 200,     // 信息窗口宽度  
                height: 80,     // 信息窗口高度  
                
            };
            var infoWindow = new BMap.InfoWindow("欢迎光临长沙理工大学云塘校区" + lng + lat, opts);  // 创建信息窗口对象


            marker.enableDragging(); //启用拖拽
            map.addControl(new BMap.NavigationControl()); //左上角控件
            map.enableScrollWheelZoom(); //滚动放大
            map.enableKeyboard(); //键盘放大

            map.centerAndZoom(point, 13); //绘制地图
            map.addOverlay(marker); //标记地图

            map.openInfoWindow(infoWindow, map.getCenter());
        }

        function loand() {
            var map = new BMap.Map("container");
            var point = new BMap.Point(113.02, 28.07); //默认中心点
            var marker = new BMap.Marker(point);
            var opts = {
                width: 200,     // 信息窗口宽度  
                height: 80,     // 信息窗口高度  
              
            };
            var infoWindow = new BMap.InfoWindow("欢迎光临长沙理工大学云塘校区（梦之站）", opts);  // 创建信息窗口对象


            marker.enableDragging(); //启用拖拽
            marker.addEventListener("dragend", function (e) {
                point = new BMap.Point(e.point.lng, e.point.lat); //标记坐标（拖拽以后的坐标）
                marker = new BMap.Marker(point);

                document.getElementByIdx_x("lng").value = e.point.lng;
                document.getElementByIdx_x("lat").value = e.point.lat;
                infoWindow = new BMap.InfoWindow("当前位置<br />经度：" + e.point.lng + "<br />纬度：" + e.point.lat, opts);

                map.openInfoWindow(infoWindow, point);
            });

            map.addControl(new BMap.NavigationControl()); //左上角控件
            map.enableScrollWheelZoom(); //滚动放大
            map.enableKeyboard(); //键盘放大

            map.centerAndZoom(point, 13); //绘制地图
            map.addOverlay(marker); //标记地图

            map.openInfoWindow(infoWindow, map.getCenter());      // 打开信息窗口      
        }
         
	</script>
 <script type="text/javascript" src="http://api.map.baidu.com/api?v=1.3"></script>
</head>

<body onload="loand()">
	<div class="background">
		<div class="lf_top_nav">
			<jsp:include page="./lf_top.jsp"></jsp:include>
			<jsp:include page="./lf_nav.jsp"></jsp:include>
		</div>
		<div class="tBody" style="float: left;">
			<div
				style="float: left;margin-top: 5px;width: 820px;margin-left:100px;word-wrap: break-word; word-break: normal;escape:false;text-align: left;">

				<p style="text-align: center;font-size: 24px;">
					<span
						style=";color:rgb(0,0,0);font-weight:normal;font-style:normal;font-size:24px;font-family:'宋体'">联系我们</span>
				</p>

				<p
					style=";text-autospace:ideograph-other;text-align:left;line-height:22px">
					<span
						style=";color:rgb(0,0,0);font-weight:normal;font-style:normal;font-size:14px;font-family:'宋体'">电话：</span><span
						style=";color:rgb(0,0,0);font-weight:normal;font-style:normal;font-size:14px;font-family:'宋体'">0731-2309047&nbsp;&nbsp;</span><span
						style=";color:rgb(0,0,0);font-weight:normal;font-style:normal;font-size:14px;font-family:'宋体'">&nbsp;</span>
				</p>
				<p
					style=";text-autospace:ideograph-other;text-align:left;line-height:22px">
					<span
						style=";color:rgb(0,0,0);font-weight:normal;font-style:normal;font-size:14px;font-family:'宋体'">Email:</span><span
						style=";color:rgb(0,0,0);font-weight:normal;font-style:normal;font-size:14px;font-family:'宋体'">dreamstationx.@sina.com</span>
				</p>
				<p
					style=";text-autospace:ideograph-other;text-align:left;line-height:22px">
					<span
						style=";color:rgb(0,0,0);font-weight:normal;font-style:normal;font-size:14px;font-family:'宋体'">地址：湖南省长沙市（雨花区）万家丽南路2段960号</span>
				</p>
				<p
					style=";text-autospace:ideograph-other;text-align:left;line-height:22px">
					<span
						style=";color:rgb(0,0,0);font-weight:normal;font-style:normal;font-size:14px;font-family:'宋体'">邮编：410000</span>
				</p>
			<div class="di_tu">
 				<div id="container" style="overflow: hidden; position: relative; z-index: 0; background-color: rgb(243, 241, 236); color: rgb(0, 0, 0); text-align: left;"><div style="overflow: visible; position: absolute; z-index: 0; left: 0px; top: 0px; cursor: grab;"><div class="BMap_mask" style="position: absolute; left: 0px; top: 0px; z-index: 9; overflow: hidden; width: 540px; height: 400px;"></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 200;"><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 800;"><div style="position: absolute; cursor: default; left: 161px; top: 64px;" class="BMap_pop"><div style="overflow: hidden; z-index: 1; position: absolute; left: 0px; top: 0px; width: 25px; height: 25px;"><div style="background:#fff;border-top:1px solid #ababab;border-left:1px solid #ababab;width:30px;height:30px;"></div></div><div class="BMap_top" style="overflow: hidden; z-index: 1; position: absolute; left: 25px; top: 0px; width: 202px; height: 25px;"></div><div style="overflow: hidden; z-index: 1; position: absolute; left: 227px; top: 0px; width: 25px; height: 25px;"><div style="position:absolute;top:0;left:-6px;background:#fff;border-top:1px solid #ababab;border-right:1px solid #ababab;width:30px;height:30px;"></div></div><div class="BMap_center" style="overflow: hidden; z-index: 1; position: absolute; left: 0px; top: 25px; width: 250px; height: 62px;"></div><div style="overflow: hidden; z-index: 1; position: absolute; left: 0px; top: 87px; width: 25px; height: 25px;"><div style="position:absolute;top:-6px;left:0;background:#fff;border-bottom:1px solid #ababab;border-left:1px solid #ababab;width:30px;height:30px;"></div></div><div class="BMap_bottom" style="overflow: hidden; z-index: 1; position: absolute; left: 25px; top: 87px; width: 202px; height: 24px;"></div><div style="overflow: hidden; z-index: 1; position: absolute; left: 227px; top: 87px; width: 25px; height: 25px;"><div style="position:absolute;top:-6px;left:-6px;background:#fff;border-right:1px solid #ababab;border-bottom:1px solid #ababab;width:30px;height:30px;"></div></div><div style="overflow: hidden; z-index: 1; position: absolute; left: 109px; top: 87px; width: 34px; height: 50px;"><img src="http://api.map.baidu.com/images/iw3.png" style="border:none;margin:0px;padding:0px;position:absolute;left:-186px;top:-691px;width:690px;height:786px;"></div><div style="width: 220px; height: 80px; position: absolute; left: 16px; top: 16px; z-index: 10; overflow: auto;"><div style="display: none; overflow: hidden; height: auto; line-height: 24px; white-space: nowrap; width: auto;" class="BMap_bubble_title"></div><div style="width: auto; height: auto;" class="BMap_bubble_content">欢迎光临长沙理工大学云塘校区（梦之站）</div><div style="display:none;position:relative" class="BMap_bubble_max_content"></div></div><img src="http://api.map.baidu.com/images/iw_close1d3.gif" style="position: absolute; top: 12px; width: 10px; height: 10px; -moz-user-select: none; cursor: pointer; z-index: 10000; left: 227px;"><img src="http://api.map.baidu.com/images/iw_plus1d3.gif" style="position: absolute; top: 12px; width: 10px; height: 10px; -moz-user-select: none; cursor: pointer; z-index: 10000; display: none; left: 207px;"></div></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 700;"><span style="position: absolute; padding: 0px; margin: 0px; border: 0px none; -moz-user-select: none; cursor: pointer; background: url(&quot;http://api.map.baidu.com/images/blank.gif&quot;) repeat scroll 0% 0% transparent; width: 19px; height: 25px; left: 260px; top: 175px; z-index: -5614000;" "="" unselectable="on" class="BMap_Marker BMap_noprint" title=""></span><span style="position: absolute; padding: 0px; margin: 0px; border: 0px none; -moz-user-select: none; background: url(&quot;http://api.map.baidu.com/images/blank.gif&quot;) repeat scroll 0% 0% transparent; width: 1px; height: 1px; left: 270px; top: 200px; z-index: -5614000;" "="" unselectable="on" class="BMap_Marker BMap_noprint" title=""></span></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 600;"><div type="infowindow_shadow" style="position: absolute; left: 139px; top: 121px;" class="BMap_shadow"><div style="overflow: hidden; z-index: 1; position: absolute; left: 48px; top: 0px; width: 70px; height: 30px;"><img src="http://api.map.baidu.com/images/iws3.png" style="left: -323px; top: 0px;" onmousedown="return false"></div><div style="overflow: hidden; z-index: 1; position: absolute; left: 118px; top: 0px; width: 163px; height: 30px;"><img src="http://api.map.baidu.com/images/iws3.png" style="left: -393px; top: 0px;" onmousedown="return false"></div><div style="overflow: hidden; z-index: 1; position: absolute; left: 281px; top: 0px; width: 70px; height: 30px;"><img src="http://api.map.baidu.com/images/iws3.png" style="left: -1033px; top: 0px;" onmousedown="return false"></div><div style="overflow: hidden; z-index: 1; position: absolute; left: 29px; top: 30px; width: 89px; height: 19px;"><img src="http://api.map.baidu.com/images/iws3.png" style="top: -30px; left: -304px;" onmousedown="return false"></div><div style="overflow: hidden; z-index: 1; position: absolute; left: 118px; top: 30px; width: 173px; height: 19px;"><img src="http://api.map.baidu.com/images/iws3.png" style="left: -360px; top: -30px;" onmousedown="return false"></div><div style="overflow: hidden; z-index: 1; position: absolute; left: 291px; top: 30px; width: 89px; height: 19px;"><img src="http://api.map.baidu.com/images/iws3.png" style="top: -30px; left: -1044px;" onmousedown="return false"></div><div style="overflow: hidden; z-index: 1; position: absolute; left: 0px; top: 49px; width: 50px; height: 60px;"><img src="http://api.map.baidu.com/images/iws3.png" style="left: -14px; top: -310px;" onmousedown="return false"></div><div style="overflow: hidden; z-index: 1; position: absolute; left: 50px; top: 49px; width: 11px; height: 60px;"><img src="http://api.map.baidu.com/images/iws3.png" style="left: -255px; top: -310px;" onmousedown="return false"></div><div style="overflow: hidden; z-index: 1; position: absolute; left: 61px; top: 49px; width: 140px; height: 60px;"><img src="http://api.map.baidu.com/images/iws3.png" style="left: -440px; top: -310px;" onmousedown="return false"></div><div style="overflow: hidden; z-index: 1; position: absolute; left: 201px; top: 49px; width: 61px; height: 60px;"><img src="http://api.map.baidu.com/images/iws3.png" style="left: -255px; top: -310px;" onmousedown="return false"></div><div style="overflow: hidden; z-index: 1; position: absolute; left: 262px; top: 49px; width: 70px; height: 60px;"><img src="http://api.map.baidu.com/images/iws3.png" style="left: -754px; top: -310px;" onmousedown="return false"></div></div></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 500;"></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 400;"><span style="position: absolute; padding: 0px; margin: 0px; border: 0px none; width: 0px; height: 0px; -moz-user-select: none; left: 260px; top: 175px; z-index: -5614000;" unselectable="on" class="BMap_Marker"><div style="position: absolute; margin: 0px; padding: 0px; width: 19px; height: 25px; overflow: hidden;"><img style="border:none;left:0px; top:0px; position:absolute;" src="http://api.map.baidu.com/images/marker_red_sprite.png"></div></span><span style="position: absolute; padding: 0px; margin: 0px; border: 0px none; width: 0px; height: 0px; -moz-user-select: none; left: 270px; top: 200px; z-index: -5614000;" unselectable="on" class="BMap_Marker"><div style="position: absolute; margin: 0px; padding: 0px; width: 1px; height: 1px; overflow: hidden;"><img style="border:none;left:0px; top:0px; position:absolute;" src="http://api.map.baidu.com/images/blank.gif"></div></span></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 300;"><span style="position: absolute; padding: 0px; margin: 0px; border: 0px none; width: 20px; height: 11px; -moz-user-select: none; left: 264px; top: 189px;" unselectable="on"><div style="position: absolute; margin: 0px; padding: 0px; width: 20px; height: 11px; overflow: hidden;"><img style="border:none;left:-19px; top:-13px; position:absolute;" src="http://api.map.baidu.com/images/marker_red_sprite.png"></div></span></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 200;"></div></div><div style="position: absolute; top: 0px; left: 0px; z-index: 1;"><div style="position: absolute; z-index: -100; left: 270px; top: 200px;"><img style="-moz-user-select: none; position: absolute; border: medium none; width: 256px; height: 256px; left: -211px; top: -204px; opacity: 1;" src="http://online0.map.bdimg.com/tile/?qt=tile&amp;x=1535&amp;y=395&amp;z=13&amp;styles=pl&amp;udt=20140928"><img style="-moz-user-select: none; position: absolute; border: medium none; width: 256px; height: 256px; left: 45px; top: 52px; opacity: 1;" src="http://online0.map.bdimg.com/tile/?qt=tile&amp;x=1536&amp;y=394&amp;z=13&amp;styles=pl&amp;udt=20140928"><img style="-moz-user-select: none; position: absolute; border: medium none; width: 256px; height: 256px; left: -467px; top: -204px; opacity: 1;" src="http://online4.map.bdimg.com/tile/?qt=tile&amp;x=1534&amp;y=395&amp;z=13&amp;styles=pl&amp;udt=20140928"><img style="-moz-user-select: none; position: absolute; border: medium none; width: 256px; height: 256px; left: -211px; top: 52px; opacity: 1;" src="http://online4.map.bdimg.com/tile/?qt=tile&amp;x=1535&amp;y=394&amp;z=13&amp;styles=pl&amp;udt=20140928"><img style="-moz-user-select: none; position: absolute; border: medium none; width: 256px; height: 256px; left: 45px; top: -204px; opacity: 1;" src="http://online1.map.bdimg.com/tile/?qt=tile&amp;x=1536&amp;y=395&amp;z=13&amp;styles=pl&amp;udt=20140928"><img style="-moz-user-select: none; position: absolute; border: medium none; width: 256px; height: 256px; left: -467px; top: 52px; opacity: 1;" src="http://online3.map.bdimg.com/tile/?qt=tile&amp;x=1534&amp;y=394&amp;z=13&amp;styles=pl&amp;udt=20140928"></div></div><div style="position: absolute; top: 0px; left: 0px; z-index: 2;"></div></div><div style="height: 32px; position: absolute; z-index: 10; -moz-user-select: none; bottom: 0px; right: auto; top: auto; left: 1px;" class=" anchorBL"><a title="到百度地图查看此区域" target="_blank" href="http://map.baidu.com/?sr=1" style="outline: medium none;"><img src="http://api.map.baidu.com/images/copyright_logo.png" style="border:none;width:77px;height:32px"></a></div><div style="position:absolute;z-index:0;top:0px;left:0px;overflow:hidden;visibility:hidden;cursor:-moz-grab" id="zoomer"><div style="top:0;left:0;" class="BMap_zoomer"></div><div style="top:0;right:0;" class="BMap_zoomer"></div><div style="bottom:0;left:0;" class="BMap_zoomer"></div><div style="bottom:0;right:0;" class="BMap_zoomer"></div></div><div unselectable="on" class=" BMap_stdMpCtrl BMap_stdMpType0 BMap_noprint anchorTL" style="width: 62px; height: 204px; bottom: auto; right: auto; top: 10px; left: 10px; position: absolute; z-index: 1100; -moz-user-select: none;"><div class="BMap_stdMpPan"><div title="向上平移" class="BMap_button BMap_panN"></div><div title="向左平移" class="BMap_button BMap_panW"></div><div title="向右平移" class="BMap_button BMap_panE"></div><div title="向下平移" class="BMap_button BMap_panS"></div><div class="BMap_stdMpPanBg BMap_smcbg"></div></div><div class="BMap_stdMpZoom" style="height: 159px; width: 62px;"><div title="放大一级" class="BMap_button BMap_stdMpZoomIn"><div class="BMap_smcbg"></div></div><div title="缩小一级" class="BMap_button BMap_stdMpZoomOut" style="top: 138px;"><div class="BMap_smcbg"></div></div><div class="BMap_stdMpSlider" style="height: 120px;"><div class="BMap_stdMpSliderBgTop" style="height: 120px;"><div class="BMap_smcbg"></div></div><div class="BMap_stdMpSliderBgBot" style="top: 37px; height: 87px;"></div><div title="放置到此级别" class="BMap_stdMpSliderMask"></div><div title="拖动缩放" class="BMap_stdMpSliderBar" style="cursor: grab; top: 37px;"><div class="BMap_smcbg"></div></div></div><div class="BMap_zlHolder"><div class="BMap_zlSt"><div class="BMap_smcbg"></div></div><div class="BMap_zlCity"><div class="BMap_smcbg"></div></div><div class="BMap_zlProv"><div class="BMap_smcbg"></div></div><div class="BMap_zlCountry"><div class="BMap_smcbg"></div></div></div></div></div><div unselectable="on" class=" BMap_cpyCtrl anchorBL" style="cursor: default; white-space: nowrap; -moz-user-select: none; color: black; background: none repeat scroll 0% 0% transparent; font: 11px/15px arial,simsun,sans-serif; bottom: 2px; right: auto; top: auto; left: 81px; position: absolute; z-index: 10;"><span _cid="1"><span style="font-size:11px">&copy; 2014 Baidu&nbsp;- Data &copy; <a href="http://www.navinfo.com/" target="_blank">NavInfo</a> &amp; <a href="http://www.cennavi.com.cn/" target="_blank">CenNavi</a> &amp; <a href="http://www.365ditu.com/" target="_blank">道道通</a></span></span></div></div>
   			 </div>	
   			 			

			</div>
		</div>
		<div class="lf_bottom">
			<iframe src="lf_bottom.jsp" width="992px" height="100px"
				frameborder="0" scrolling="no"></iframe>
		</div>
	</div>
</body>
</html>
