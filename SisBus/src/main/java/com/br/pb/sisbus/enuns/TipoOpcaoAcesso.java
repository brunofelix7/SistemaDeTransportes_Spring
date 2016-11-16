package com.br.pb.sisbus.enuns;

public enum TipoOpcaoAcesso {

	CONTROLE_DE_USUARIO("Controle de Usuarário", 1),
	
	CONTROLE_DE_FUNCIONARIO("Controle de Funcionário", 2),
	
	ACOMPANHAMENTO_DE_CHAMADO("Acompanhamento de Chamado", 3),
	
	CONTROLE_DEMANUTENCAO("Controle de Manutenção", 4),
	
	LISTA_DE_USUARIO("Lista de Usuário", 5),
	
	BUSCAR_FUNCIONARIO("Buscar Funcionário", 6),
	
	BUSCAR_CHAMADO("Buscar Chamado", 7),
	
	CONFIGURAR_ACESSO("Configurar Acesso", 8),
	
	CONFIGURAR_ESCALA("Configurar Escala", 9),
	
	GERENCIAR_ESCALA("Gerenciar Escala", 10),
	
	ACESSO_TOTAL("Acesso Total", 11),
	
	CONTROLE_DE_VEICULO("Controle de Veículo", 12),
	
	LOCALIZAR_VEICULO("Localizar Veículo", 13),
	
	QUADRO_DE_HORARIO("Quadro de Horário", 14),
	
	ESCALAR_FUNCIONARIO("Escalar Funcionário", 15),
	
	ACESSO_A_RELATORIOS("Acesso a Relatórios", 16);

	private String value;
	private int num;
	
	
	TipoOpcaoAcesso(String value, int num) {
		this.value = value;
		this.num = num;
	}
	public String getValue() {
		return value;
	}
	public int getNum() {
		return num;
	}
	
}
