$(document).ready(function() {
	

$("#zipcode3").twzipcode({
        	"countySel": "臺北市", // 城市預設值, 字串一定要用繁體的 "臺", 否則抓不到資料
        	"districtSel": "大安區", // 地區預設值
        	"zipcodeIntoDistrict": true,
        	"css": ["city form-control", "town form-control"],
        	"countyName": "city", // 指定城市 select name
        	"districtName": "town" // 指定地區 select name
        	});




});