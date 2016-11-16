<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags/template" prefix="template" %>
<template:admin>
	<div class="row">
        <div class="col s12">
            <nav class="nav-breadcrumb">
                <div class="nav-wrapper">
                    <div class="col s12">
                    	<a href="<c:url value='/index'/>" class="breadcrumb">Acesso rápido</a> 
                        <a href="#!" class="breadcrumb">Operação</a> 
                        <a href="#!" class="breadcrumb">Nova operação</a>
                    </div>
                </div>
            </nav>
        </div>
    </div>
<div>

      <form:form role="form" commandName="operacao" servletRelativeAction="/gestor/operacao" method="POST"  >
      	<%@include file="form-inputs.jsp" %>
      </form:form>	



</template:admin>
