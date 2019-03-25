<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Open modal for @mdo</button>
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo"
data-from="form" data-dealPrice="price" data-to="to"  data-id="id" >
修改成交資訊</button>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">New message</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <form method='POST' enctype="multipart/form-data">
          <div class="form-group">
            <label for="from" class="col-form-label">成交日期</label>
            <input type="text" class="form-control" id="from" name="from"/>
          </div>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">每月租金</label>
            <input type="text" class="form-control" id="dealPrice" name="dealPrice"/>
          </div>
           <div class="form-group">
            <label for="to" class="col-form-label">租約到期日</label>
            <input type="text" class="form-control" id="to" name="to"/>
          </div>
          <input type = "file" value = "如要修改才需上傳" multiple="multiple" name="file" />
          </form>
      </div>          
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Send message</button>
      </div>
    </div>
  </div>
</div>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<script>
$('#exampleModal').on('show.bs.modal', function (event) {
	
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('whatever')  
		  var id = button.data('id')
		  var from = button.data('from')
		  var dealPrice = button.data('dealPrice')
		  var to = button.data('to')  
		  alert(id)
// 		  modal.find('.modal-title').text('請修改成交編號:'+id+'的資訊')
		  
	  var modal = $(this)
	  modal.find('.modal-title').text('New message to ' + recipient)
	 modal.find('.modal-body #from').val(from)
		  modal.find('.modal-body #dealPrice').val(dealPrice)
		  modal.find('.modal-body #to').val(to)
	})
</script>
</body>
</html>