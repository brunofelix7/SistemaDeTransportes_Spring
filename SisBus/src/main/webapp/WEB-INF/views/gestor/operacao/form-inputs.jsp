<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="<c:url value='/assets/css/sweetalert2.css'/>" />
<script src="<c:url value='/assets/js/sweetalert2.js'/>"></script>
<script src="<c:url value='/assets/js/sweetalert2.min.js'/>"></script>


<div class="row" style="margin-top: -20px">
	<div class="col s12 m12 l8">
	<div class="card grey lighten-5">
        <div class="card-content ">
            <span class="card-title">Cadastro de operação</span>
            <div class="align-rows form-usual">
            
            	<div class="row">
            		<div class="form-group col m6">
						<label for="qPassageirosEstudantes">Quantidade de estudantes<span style="color: red;">*</span></label>
						<form:input path='qPassageirosEstudantes' type='number' min="1" step="1" class="form-control" required="required" />
						<form:errors path='qPassageirosEstudantes' cssStyle="color: red;"/>
					</div>
					
					<div class="form-group col m6">
						<label for="valorTotalEstudantes">Valor total de estudantes<span style="color: red;">*</span></label>
						<form:input path='valorTotalEstudantes' type='number' min="0.1" step="0.1" class="form-control" required="required" />
						<form:errors path='valorTotalEstudantes' cssStyle="color: red;"/>
					</div>
            	</div>

				<div class="row">
					<div class="form-group col m6">
						<label for="qPassageirosValeTransporte">Quantidade de vale transporte<span style="color: red;">*</span></label>
						<form:input path='qPassageirosValeTransporte' type='number' min="1" step="1" class="form-control" required="required" />
						<form:errors path='qPassageirosValeTransporte' cssStyle="color: red;"/>
					</div>
					
					<div class="form-group col m6">
						<label for="valorTotalValeTransporte">Valor total de vale transporte<span style="color: red;">*</span></label>
						<form:input path='valorTotalValeTransporte' type='number' min="0.1" step="0.1" class="form-control" required="required" />
						<form:errors path='valorTotalValeTransporte' cssStyle="color: red;"/>
					</div>
				</div>

				<div class="row">
					<div class="form-group col m6">
						<label for="quantidatePagantes">Quantidade de pagantes<span style="color: red;">*</span></label>
						<form:input path='quantidatePagantes' type='number' min="1" step="1" class="form-control" required="required" />
						<form:errors path='quantidatePagantes' cssStyle="color: red;"/>
					</div>
					
					<div class="form-group col m6">
						<label for="valorTotalPagantes">Valor total de pagantes<span style="color: red;">*</span></label>
						<form:input path='valorTotalPagantes' type='number' min="0.1" step="0.1" class="form-control" required="required" />
						<form:errors path='valorTotalPagantes' cssStyle="color: red;"/>
					</div>
				</div>

				<div class="row">
					<div class="form-group col m12">
						<label for="quilometragemViagem">Quilometragem da viagem</label>
						<form:input path='quilometragemViagem' type='number' min="0.1" step="0.1" class="form-control" required="required" />
						<form:errors path='quilometragemViagem' cssStyle="color: red;"/>
					</div>
				</div>
				
	            <div class="card-action" id="control">
	                <button type="submit" class="btn btn-success  green darken-1 btn-large">Cadastrar</button>
	            </div>
				
            </div>
         </div>
    </div>
	</div>
</div>


