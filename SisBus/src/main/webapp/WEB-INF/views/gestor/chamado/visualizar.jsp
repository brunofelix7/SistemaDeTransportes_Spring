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
                        <a href="#!" class="breadcrumb">Chamados</a> 
                        <a href="#!" class="breadcrumb">Visualizar</a>
                    </div>
                </div>
            </nav>
        </div>
    </div>
          <table class="table">
          		  <thead>
	                  <tr>
	                  	<td><b>Código: </b></td>
	                  	<td>${chamado.id}</td>
	                  </tr>
	                  <tr>
	                  <tr>
	                  	<td><b>Data do chamado: </b></td>
	                  	<td><fmt:formatDate value="${chamado.dataChamado}" pattern="dd/MM/yyyy"/></td>
	                  </tr>
	                  <tr>
	                     <tr>
	                  	<td><b>Hora do chamado: </b></td>
	                  	<td><fmt:formatDate value="${chamado.horaChamado}" pattern="HH:mm:ss"/></td>
	                  </tr>
	                  <tr>
	                  	<td><b>Avaria: </b></td>
	                  	<td>${chamado.avaria}</td>
	                  </tr>
	                  <tr>
	                  	<td><b>Responsável: </b></td>
	                  	<td>${chamado.responsavel}</td>
	                  </tr>
	                  <tr>
	                  	<td><b>Código do Veículo: </b></td>
	                  	<td>${chamado.codigoVeiculo}</td>
	                  </tr>
	                  <tr>
	                  	<td><b>Localização: </b></td>
	                  	<td>${chamado.localizacao}</td>
	                  </tr>
	                  <tr>
	                  	<td><b>Referência: </b></td>
	                  	<td>${chamado.referencia}</td>
	                  </tr>
	                  <tr>
	                  	<td><b>Observação: </b></td>
	                  	<td>${chamado.observacao}</td>
	                  </tr>
	                  <tr>
	                  	<td><b>Prioridade: </b></td>
	                  	<td>
		                  	<c:if test="${chamado.prioridade == 'URGENTE'}"><b style="color: red; font-style: bold;">${chamado.prioridade}</b></c:if>
		                  	<c:if test="${chamado.prioridade == 'NORMAL'}">${chamado.prioridade}</c:if>
	                  	</td>
	                  </tr>
	                  <tr>
	                  	<td><b>Status: </b></td>
	                  	<td>
		                  	<c:if test="${chamado.status == 'ABERTO'}"><span class="label label-success">${chamado.status}</span></c:if>
		                  	<c:if test="${chamado.status == 'FECHADO'}"><span class="label label-danger">${chamado.status}</span></c:if>
	                  	</td>
	                  </tr>
	                  <tr>
	                  	<td><b>Data do fechamento: </b></td>
	                  	<td><fmt:formatDate value="${chamado.dataFechamento}" pattern="dd/MM/yyyy"/></td>
	                  </tr>
	                  <tr>
	                  	<td><b>Hora do fechamento: </b></td>
	                  	<td><fmt:formatDate value="${chamado.horaFechamento}" pattern="HH:mm:ss"/></td>
	                  </tr>
	                  <tr>
	                  	<td><b>Tempo de espera: </b></td>
	                  	<td><fmt:formatDate value="${chamado.tempoEspera}" pattern="HH:mm:ss"/></td>
	                  </tr>
	                  <tr>
	                  	<td><b>Responsável pelo: </b></td>
	                  	<td>${chamado.responsavel_fechamento}</td>
	                  </tr>
	                  <tr>
	                  	<td><b>Motivo do fechamento: </b></td>
	                  	<td>${chamado.motivo_fechamento}</td>
	                  </tr>
                 </thead>
                  <tbody>
                  	<!-- Não utilizado -->                 
                  </tbody>
          </table>
			<a href="<c:url value='/gestor/chamado'/>" class="btn btn-default btn-small blue darken-1"><span></span> Voltar</a>
			<c:if test="${chamado.status == 'ABERTO'}">
	        <a href="<c:url value='/gestor/chamado'/>/${chamado.id}" class="btn btn-default btn-small blue darken-1"><span class="glyphicon glyphicon-pencil"></span></a>
        	</c:if>
			<a href="<c:url value='/gestor/chamado/remove'/>/${chamado.id}" class="btn btn-default btn-small red accent-4"  onclick="return deletar()"><span class="glyphicon glyphicon-remove"></span></a>
        </div>
</jsp:body>
</template:admin>
