$(document).ready(function() {
	$("#zipcode3").twzipcode({
    	"countySel": "臺北市", 
    	"districtSel": "大安區", 
    	"zipcodeIntoDistrict": true,
    	"css": ["city form-control", "town form-control"],
    	"countyName": "city", 
    	"districtName": "town" 
    	});
});