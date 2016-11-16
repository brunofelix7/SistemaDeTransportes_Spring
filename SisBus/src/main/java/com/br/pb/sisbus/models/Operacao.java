package com.br.pb.sisbus.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "tb_operacao")
public class Operacao {

	@Id
	@Column(name = "id_operacao")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(nullable = false, name = "quantidade_estudantes")
	private Integer qPassageirosEstudantes;
	
	@Column(nullable = false, name = "valor_total_estudantes")
	private double valorTotalEstudantes;
	
	@Column(nullable = false, name = "quantidade_vale_transporte")
	private Integer qPassageirosValeTransporte;
	
	@Column(nullable = false, name = "valor_total_vale_transporte")
	private double valorTotalValeTransporte;
	
	@Column(nullable = false, name = "quantidade_pagantes")
	private Integer quantidatePagantes;
	
	@Column(nullable = false, name = "valor_total_pagantes")
	private double valorTotalPagantes;
	
	@Column(nullable = true, name = "quilometragem_viagem")
	private double quilometragemViagem;
	
	@Column(nullable = false, name = "data_operacao")
	@Temporal(TemporalType.DATE)
	private Date dataOperacao;
	
	@Column(nullable = false, name = "hora_operacao")
	@Temporal(TemporalType.TIME)
	private Date horaOperacao;
	
	@ManyToOne
	private Funcionario funcionario;
	
	@ManyToOne
	private Veiculo veiculo;

	
	/*
	 * GETTERS AND SETTERS
	 */
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getqPassageirosEstudantes() {
		return qPassageirosEstudantes;
	}

	public void setqPassageirosEstudantes(Integer qPassageirosEstudantes) {
		this.qPassageirosEstudantes = qPassageirosEstudantes;
	}

	public double getValorTotalEstudantes() {
		return valorTotalEstudantes;
	}

	public void setValorTotalEstudantes(double valorTotalEstudantes) {
		this.valorTotalEstudantes = valorTotalEstudantes;
	}

	public Integer getqPassageirosValeTransporte() {
		return qPassageirosValeTransporte;
	}

	public void setqPassageirosValeTransporte(Integer qPassageirosValeTransporte) {
		this.qPassageirosValeTransporte = qPassageirosValeTransporte;
	}

	public double getValorTotalValeTransporte() {
		return valorTotalValeTransporte;
	}

	public void setValorTotalValeTransporte(double valorTotalValeTransporte) {
		this.valorTotalValeTransporte = valorTotalValeTransporte;
	}

	public Integer getQuantidatePagantes() {
		return quantidatePagantes;
	}

	public void setQuantidatePagantes(Integer quantidatePagantes) {
		this.quantidatePagantes = quantidatePagantes;
	}

	public double getValorTotalPagantes() {
		return valorTotalPagantes;
	}

	public void setValorTotalPagantes(double valorTotalPagantes) {
		this.valorTotalPagantes = valorTotalPagantes;
	}

	public double getQuilometragemViagem() {
		return quilometragemViagem;
	}

	public void setQuilometragemViagem(double quilometragemViagem) {
		this.quilometragemViagem = quilometragemViagem;
	}

	public Date getDataOperacao() {
		return dataOperacao;
	}

	public void setDataOperacao(Date dataOperacao) {
		this.dataOperacao = dataOperacao;
	}
	
	public Date getHoraOperacao() {
		return horaOperacao;
	}

	public void setHoraOperacao(Date horaOperacao) {
		this.horaOperacao = horaOperacao;
	}

	public Funcionario getFuncionario() {
		return funcionario;
	}

	public void setFuncionario(Funcionario funcionario) {
		this.funcionario = funcionario;
	}

	public Veiculo getVeiculo() {
		return veiculo;
	}

	public void setVeiculo(Veiculo veiculo) {
		this.veiculo = veiculo;
	}
	
}
