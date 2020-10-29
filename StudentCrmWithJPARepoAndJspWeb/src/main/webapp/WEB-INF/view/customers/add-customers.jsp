<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body class="Site"><!-- class="d-flex flex-column h-100" -->
<jsp:include page="header.jsp"/>

<main role="main" class="SiteContent"><!-- class="flex-shrink-0" -->
<section class="customerList my-2">
<div class="container-fluid">
<div class="text-center py-5">
<c:if test="${customer.firstName != null}">
<h1 class="section-heading py-5 font-weight-normal">Update Customers</h1>
</c:if>
<c:if test="${customer.firstName == null}">
<h1 class="section-heading py-5 font-weight-normal">Add Customers</h1>
</c:if>
<div class="mx-auto heading-line"></div>
</div>
<div class="row mt-0">
<div class="col-md-8 offset-md-2 mt-0">
<form:form cssClass="form-signin" action="saveORUpdateCustomer" modelAttribute="customer" method="POST">
<div class="form-label-group">
<form:hidden path="id"/>
<form:input path="firstName" cssClass="form-control" placeholder="First Name"/>
<form:label path="firstName">First Name</form:label>
<div class ="error">
<form:errors path="firstName" cssClass="errors"/>
</div>
</div>
<div class="form-label-group">
<form:input path="lastName" cssClass="form-control" placeholder="Last Name" />
<form:label path="lastName">Last Name</form:label>
<div class ="error">
<form:errors path="lastName" cssClass="errors"/>
</div>
</div>
<div class="form-label-group">
<form:input path="email" cssClass="form-control" placeholder="Email Id" />
<form:label path="email">EmailId</form:label>
<div class ="error">
<form:errors path="email" cssClass="errors"/>
</div>
</div>
<input type="submit" value="Submit" class="btn btn-primary btn-lg btn-block"/>
</form:form>
</div>
</div>
</div>
</section>
  </main>
<jsp:include page="footer.jsp"/>

</body>
</html>