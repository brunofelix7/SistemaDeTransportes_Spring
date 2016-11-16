package com.br.pb.sisbus.models;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import com.br.pb.sisbus.enuns.ExameDeSaude;
import com.br.pb.sisbus.enuns.Funcao;
import com.br.pb.sisbus.enuns.TipoSanguineo;

@Entity
@Table(name = "tb_funcionario")
public class Funcionario {

	@Id
	@Column(name="idFuncionario")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column(nullable = false, unique = true, name = "matricula")
	private Integer matricula;

	@Column(length = 60, nullable = false , name = "nome")
	private String nome;

	@Column(length = 14, nullable = false, unique = true , name = "CPF")
	private String cpf;

	@Column(length = 10, nullable = true, unique = true , name = "RG")
	private String rg;

	@Column(length = 20, nullable = true , name = "tiposanguineo")
	@Enumerated(EnumType.STRING)
	private TipoSanguineo tipoSanguineo;

	@Column(length = 60, nullable = true , name = "nomepai")
	private String nomePai;

	@Column(length = 60, nullable = true , name = "nomemae")
	private String nomeMae;

	@Column(length = 3, nullable = false , name = "examesaude")
	@Enumerated(EnumType.STRING)
	private ExameDeSaude exameDeSaude;

	@Column(nullable = true , name = "validadeExame")
	@Temporal(TemporalType.DATE)
	private Date dataValidadeExame;

	@Column(length = 20, nullable = false , name = "funcao")
	@Enumerated(EnumType.STRING)
	private Funcao funcao;
	
	@Column(nullable = true, unique = true ,name = "CNH")
	private Integer cnh;

	@Column(nullable = true, name = "validadeCNH")
	@Temporal(TemporalType.DATE)
	private Date validadeCNH;

	@Column(length = 20, nullable = true , name = "outrosDocs")
	private String outrosDocumentos;

	@Column(length = 10, nullable = true , name = "tipoDoc")
	private String tipoOutrosDocumentos;
	
	@JoinColumn(name = "endereco_idendereco", updatable = true)
	@ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REMOVE}, optional = true, fetch = FetchType.EAGER)
	private Endereco endereco;

	@JoinColumn(name = "usuario_idusuario")
	@OneToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REMOVE}, optional = true, orphanRemoval = false, fetch = FetchType.EAGER)
	private Usuario usuario;
	
	@ManyToMany(cascade = CascadeType.ALL, mappedBy = "listFuncionario")
	private Set<Escala> listEscala;
	
	@Transient
	private Role role;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Integer getMatricula() {
		return matricula;
	}
	public void setMatricula(Integer matricula) {
		this.matricula = matricula;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public String getRg() {
		return rg;
	}
	public void setRg(String rg) {
		this.rg = rg;
	}
	public TipoSanguineo getTipoSanguineo() {
		return tipoSanguineo;
	}
	public void setTipoSanguineo(TipoSanguineo tipoSanguineo) {
		this.tipoSanguineo = tipoSanguineo;
	}
	public String getNomePai() {
		return nomePai;
	}
	public void setNomePai(String nomePai) {
		this.nomePai = nomePai;
	}
	public String getNomeMae() {
		return nomeMae;
	}
	public void setNomeMae(String nomeMae) {
		this.nomeMae = nomeMae;
	}
	public ExameDeSaude getExameDeSaude() {
		return exameDeSaude;
	}
	public void setExameDeSaude(ExameDeSaude exameDeSaude) {
		this.exameDeSaude = exameDeSaude;
	}
	public Date getDataValidadeExame() {
		return dataValidadeExame;
	}
	public void setDataValidadeExame(Date dataValidadeExame) {
		this.dataValidadeExame = dataValidadeExame;
	}
	public Funcao getFuncao() {
		return funcao;
	}
	public void setFuncao(Funcao funcao) {
		this.funcao = funcao;
	}
	public Endereco getEndereco() {
		return endereco;
	}
	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}
	public Integer getCnh() {
		return cnh;
	}
	public void setCnh(Integer cnh) {
		this.cnh = cnh;
	}
	public Date getValidadeCNH() {
		return validadeCNH;
	}
	public void setValidadeCNH(Date validadeCNH) {
		this.validadeCNH = validadeCNH;
	}
	public String getOutrosDocumentos() {
		return outrosDocumentos;
	}
	public void setOutrosDocumentos(String outrosDocumentos) {
		this.outrosDocumentos = outrosDocumentos;
	}
	public String getTipoOutrosDocumentos() {
		return tipoOutrosDocumentos;
	}
	public void setTipoOutrosDocumentos(String tipoOutrosDocumentos) {
		this.tipoOutrosDocumentos = tipoOutrosDocumentos;
	}
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	public Set<Escala> getListEscala() {
		return listEscala;
	}
	public void setListEscala(Set<Escala> listEscala) {
		this.listEscala = listEscala;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public Role getRole() {
		return role;
	}
	public Funcionario(){}
	
}
