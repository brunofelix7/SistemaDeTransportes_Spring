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
	<script>
		function deletar(){
			swal(
			    'Excluído!',
			    'Excluído com sucesso.',
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
                        <a href="#!" class="breadcrumb">Visualizar</a>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <table class="table">
	    <tr>
	    	<td><b>Código:</b></td>
	    	<td>${operacao.id}</td>
	    </tr>
	    <tr>
	    	<td><b>Quantidade de estudantes:</b></td>
	    	<td>${operacao.qPassageirosEstudantes}</td>
	    </tr>
	    <tr>
	    	<td><b>Valor total de estudantes:</b></td>
	    	<td>R$ ${operacao.valorTotalEstudantes}</td>
	    </tr>
	    <tr>
	    	<td><b>Quantidade de vale transporte:</b></td>
	    	<td>${operacao.qPassageirosValeTransporte}</td>
	    </tr>
	    <tr>
	    	<td><b>Valor total de vale transporte:</b></td>
	    	<td>R$ ${operacao.valorTotalValeTransporte}</td>
	    </tr>
	    <tr>
	    	<td><b>Quantidade de pagantes:</b></td>
	    	<td>${operacao.quantidatePagantes}</td>
	    </tr>
	    <tr>
	    	<td><b>Valor total de pagantes:</b></td>
	    	<td>R$ ${operacao.valorTotalPagantes}</td>
	    </tr>
	    <tr>
	    	<td><b>Quilometragem da viagem:</b></td>
	    	<td>${operacao.quilometragemViagem}Km</td>
	    </tr>
	</table>
	<a href="<c:url value='/gestor/operacao'/>" class="btn btn-default btn-small blue darken-1"><span><!-- SETA ESQUERDA --></span> Voltar</a>
    <a href="<c:url value='/gestor/operacao'/>/${operacao.id}" class="btn btn-default btn-small blue darken-1"><span class="glyphicon glyphicon-pencil"></span></a>
	<a href="<c:url value='/gestor/operacao/remove'/>/${operacao.id}" class="btn btn-default btn-small red accent-4"  onclick="return deletar()"><span class="glyphicon glyphicon-remove"></span></a>
</div>
</jsp:body>
</template:admin>
