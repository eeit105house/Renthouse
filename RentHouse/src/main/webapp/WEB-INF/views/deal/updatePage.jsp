<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$('#exampleModal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modal = $(this)
	  modal.find('.modal-title').text('New message to ' + recipient)
	  modal.find('.modal-body input').val(recipient)
	})
	 $( function() {
    var dateFormat = "mm/dd/yy",
      from = $( "#from" )
        .datepicker({
          defaultDate: "+1w",
          changeMonth: true,
          numberOfMonths: 3
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ) );
        }),
      to = $( "#to" ).datepicker({
        defaultDate: "+1y",
        changeMonth: true,
        numberOfMonths: 3
      })
      .on( "change", function() {
        from.datepicker( "option", "maxDate", getDate( this ) );
      });
 
    function getDate( element ) {
      var date;
      try {
        date = $.datepicker.parseDate( dateFormat, element.value );
      } catch( error ) {
        date = null;
      }
 
      return date;
    }
  } );
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@getbootstrap">修改成交資訊</button>
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#queryPdf" data-whatever="@getbootstrap">查詢契約</button>
--------------------------------------------------------------------------------   
<form method='POST' enctype="multipart/form-data">
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">請修改房屋編號:${houseId}成交資訊</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
--------------------------------------------------------------------------------      
      <div class="modal-body">
          <div class="form-group">
            <label for="from" class="col-form-label">成交日期</label>
            <input type="text" class="form-control" id="from" name="from"  value="${houseDeal.dealDate}"/>
          </div>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">每月租金</label>
            <input type="text" class="form-control" id="recipient-name" name="dealPrice" value="${houseDeal.dealPrice}"/>
          </div>
           <div class="form-group">
            <label for="to" class="col-form-label">租約到期日</label>
            <input type="text" class="form-control" id="to" name="to"  value="${houseDeal.leaseDate}"/>
          </div>
          <input type = "file" value = "上傳租賃契約" multiple="multiple" name="file" />${houseDeal.fileName}
      </div>
--------------------------------------------------------------------------------             
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
        <button type="submit" class="btn btn-primary" >送出資訊</button>
      </div>
    </div>
  </div>
</div>
</form>

<div class="modal fade" id="queryPdf" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document"> <div class="modal-content">${pdf}<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button></div></div>
</div>
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
</body>
</html>