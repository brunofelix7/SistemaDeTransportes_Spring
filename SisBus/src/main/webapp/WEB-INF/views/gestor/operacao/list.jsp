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
                        <a href="#!" class="breadcrumb">Operação</a> 
                        <a href="#!" class="breadcrumb">Operação realizadas</a>
                    </div>
                </div>
            </nav>
        </div>
    </div>
        <table class="highlight">
        		 <thead>
        		  <tr>
                 	<td><b>Código</b></td>
                 	<td><b>Estudantes</b></td>
                 	<td><b>Vale transporte</b></td>
                 	<td><b>Pagantes</b></td>
                 	<td><b>Quilometragem</b></td>
                 	<td><b style="color:#1e88e5;">Editar</b></td>
                 	<td><b style="color:#1e88e5;">Visualizar</b></td>
                 	<td><b style="color:#dd2c00;">Excluir</b></td>
                 </tr>
                </thead>
                <tbody>
                <c:forEach items='${paginatedList.currentList}' var='object'>         		
                 <tr>
                 	<td>${object.id}</td>
                 	<td>${object.qPassageirosEstudantes}</td>
                 	<td>${object.qPassageirosValeTransporte}</td>
	                <td>${object.quantidatePagantes}</td>
	                <td>${object.quilometragemViagem}Km</td>
	                <td><a href="<c:url value='/gestor/operacao'/>/${object.id}" class="waves-effect waves-light btn blue darken-1"><span class="glyphicon glyphicon-pencil"></span></a></td>
	                <td><a href="<c:url value='/gestor/operacao/visualizar'/>/${object.id}" class="waves-effect waves-light btn blue darken-1"><span class="glyphicon glyphicon-eye-open"></span></a></td>
	                <td><a href="<c:url value='/gestor/operacao/remove'/>/${object.id}" class="waves-effect waves-light btn red accent-4"  onclick="return deletar()"><span class="glyphicon glyphicon-remove"></span></a></td>
			  	</tr>
                </c:forEach>
                </tbody>
        </table>
  		<template:paginationComponent paginatedList="${paginatedList}" page="${param.page}" action="/gestor/operacao" />
      	<a href="<c:url value='/gestor/operacao/form'/>" class="waves-effect waves-light btn green darken-1"><span class="glyphicon glyphicon-plus-sign"></span> Nova Operação</a>
      </div>
</jsp:body>
</template:admin>
