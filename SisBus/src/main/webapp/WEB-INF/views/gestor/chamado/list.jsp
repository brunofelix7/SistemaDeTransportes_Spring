<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/template" prefix="template" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<template:admin>
<jsp:attribute name="extraStyles">
<link rel="stylesheet" href="<c:url value='/assets/css/pagination/jqpagination.css'/>" />
</jsp:attribute>
<jsp:attribute name="extraScripts">
<script src="<c:url value='/assets/js/jquery.jqpagination.js'/>"></script>
</jsp:attribute>
<jsp:body>
<link rel="stylesheet" href="<c:url value='/assets/css/sweetalert2.css'/>" />
<script src="<c:url value='/assets/js/sweetalert2.js'/>"></script>
<script src="<c:url value='/assets/js/sweetalert2.min.js'/>"></script>

<script type="text/javascript">
	<script>
			function deletar(){
				  swal(
				    'Excluído!',
				    'Excluído com sucesso',
				    'success'
				  )
			}
	</script>
  <div>
        <div class="row">
        <div class="col s12">
            <nav class="nav-breadcrumb">
                <div class="nav-wrapper">
                    <div class="col s12">
                    	<a href="<c:url value='/index'/>" class="breadcrumb">Acesso rápido</a> 
                        <a href="#!" class="breadcrumb">Chamados</a> 
                        <a href="#!" class="breadcrumb">Chamados realizados</a>
                    </div>
                </div>
            </nav>
        </div>
    </div>
	<form class="navbar-form navbar-left" servletRelativeAction="/gestor/chamado/search" method="GET">
        <table class="highlight">
        		 <thead>
        		 <tr>
        		  	<td>
   						<input type="text" class="form-control" name="status" id="status" placeholder="Pesquisar..."/>
                 	</td>
                 	<td>
	                 	<input type="submit" class="waves-effect waves-light btn green darken-1" value="Buscar">
                 	</td>
        		  </tr> 
                 <tr>
                 	<td><b>Código</b></td>
                 	<td><b>Avaria</b></td>
                 	<td><b>Data</b></td>
                 	<td><b>Hora</b></td>
                 	<td><b>Prioridade</b></td>
                 	<td><b>Status</b></td>
                 	<td><b>Contador</b></td>
                 	<td><b style="color:#1e88e5;">Fechar</b></td>
                 	<td><b style="color:#1e88e5;">Visualizar</b></td>
                 	<td><b style="color:#dd2c00;">Excluir</b></td>
                 </tr>
                </thead>
                <tbody>
                <c:forEach items='${paginatedList.currentList}' var='object'>         		
                 <tr>
                 	<td>${object.id}</td>
                 	<td>${object.avaria}</td>
                 	<td><fmt:formatDate value="${object.dataChamado}" pattern="dd/MM/yyyy"/></td>
                 	<td><fmt:formatDate value="${object.horaChamado}" pattern="HH:mm"/>h</td>
                 	<td>
	                  	<c:if test="${object.prioridade == 'URGENTE'}"><b style="color: red; font-style: bold;">${object.prioridade}</b></c:if>
	                  	<c:if test="${object.prioridade == 'NORMAL'}">${object.prioridade}</c:if>
                 	</td>
                 	<td>
	                  	<c:if test="${object.status == 'ABERTO'}"><span class="label label-success">${object.status}</span></c:if>
	                  	<c:if test="${object.status == 'FECHADO'}"><span class="label label-danger">${object.status}</span></c:if>
                 	</td>
                 	<td>
	                 	<c:if test="${object.status == 'ABERTO'}">
							<!-- CONTADOR -->
							<jsp:useBean id="now" class="java.util.Date" scope="request"/>
							<fmt:formatDate var="time" value="${now}" pattern="HH:mm:ss"/>
							${time}
		                </c:if>            	
	                 </td>
	                 <td>
		                 <c:if test="${object.status == 'ABERTO'}">
		                 	<a href="<c:url value='/gestor/chamado'/>/${object.id}" class="waves-effect waves-light btn blue darken-1"><span class="glyphicon glyphicon-pencil"></span></a>
		                 </c:if>
		                 <c:if test="${object.status == 'FECHADO'}">
		                 	<a href="<c:url value='/gestor/chamado'/>/${object.id}" class="btn disabled"><span class="glyphicon glyphicon-pencil"></span></a>
		                 </c:if>
	                 </td>
	                 <td>
	                 	<a href="<c:url value='/gestor/chamado/visualizar'/>/${object.id}" class="waves-effect waves-light btn blue darken-1"><span class="glyphicon glyphicon-eye-open"></span></a>
	                 </td>
	                 <td>
	                 	<a href="<c:url value='/gestor/chamado/remove'/>/${object.id}" class="waves-effect waves-light btn red accent-4"  onclick="return deletar()"><span class="glyphicon glyphicon-remove"></span></a>
	                 </td>
			  	</tr>
                </c:forEach>
                </tbody>
        </table>
        </form>
  		<template:paginationComponent paginatedList="${paginatedList}" page="${param.page}" action="/gestor/chamado" />
      	<!-- <a href="<c:url value='/gestor/chamado/form'/>" class="waves-effect waves-light btn green darken-1"><span class="glyphicon glyphicon-plus-sign"></span> Abrir Chamado</a> -->
      </div>
</jsp:body>
</template:admin>
