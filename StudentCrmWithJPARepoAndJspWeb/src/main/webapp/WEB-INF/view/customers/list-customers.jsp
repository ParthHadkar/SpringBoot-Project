<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body class="Site"><!-- class="d-flex flex-column h-100" -->
<%-- <%@include file="/customer-header" %> --%>
<jsp:include page="header.jsp"/>

<main role="main" class="SiteContent"><!-- class="flex-shrink-0" -->
<section class="customerList my-2">
<div class="container-fluid">
<div class="text-center py-5">
<h1 class="section-heading py-5  font-weight-normal">View Customers</h1>
<div class="mx-auto heading-line"></div>
</div>
<div class="row mt-0">
<div class="col-md-8 offset-md-2 mt-0">
<table id="viewCustomers" class="table table-bordered table-striped table-hover dataTable">
<thead class="table-dark">
<tr>
<th>First Name</th><th>Last Name</th><th>Email</th><th>Action</th>
</tr>
</thead>
<tbody class="table-light">
<c:forEach var="tempCustomer" items="${customers}">
<c:url var="updateCustomer" value="showCustomerFormForUpdate">
<c:param name="Id" value="${tempCustomer.id}"/>
</c:url>
<tr id="${tempCustomer.id}">
<td>${tempCustomer.firstName}</td>
<td>${tempCustomer.lastName}</td>
<td>${tempCustomer.email}</td>
<td>
<button class="btn btn-primary" onclick="window.location.href='${updateCustomer}'">Update</button> | 

<button class="btn btn-primary" onclick="deleteCustomer(${tempCustomer.id})">Delete</button>
</td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
</div>
</div>
</section>
  </main>
<jsp:include page="footer.jsp"/>
<%-- <%@include file="/customer-footer" %>--%>
<script type="text/javascript">
$(document).ready(function(){
	$('#viewCustomers').DataTable();
});
</script>
<script type="text/javascript">
<!-- window.location.href='customer/deleteCustomer?Id=${tempCustomer.id}' return false; -->
function deleteCustomer(id){
	//alert("response "+id);
	var myTable = $('#viewCustomers').DataTable();
	 $.ajax({
		type:'get',
		url:'deleteCustomer',
		data:{
			Id:id
			},
	    success:function(reponse){//reponse
		    //alert("response "+reponse);
	    	myTable
	        .row( '#'+id+'')
	        .remove()
	        .draw();
		    },
	   error:function(xhr, status, error){
		  // var err = eval("(" + xhr.responseText + ")");
		   	 // console.log( err);
		      console.log(status);
		      console.log(error);
		   }
		});
 
	/* $.get("deleteCustomer", {
		Id : id,	
	}, function(data) {

		//var json = JSON.parse(data);

	}).done(function() {
		myTable
        .row( '#'+id+'')
        .remove()
        .draw();
	}).fail(function(xhr, textStatus, errorThrown) {
	}); *//* .complete(function() {
		

	}); */

		
}
</script>
</body>
</html>