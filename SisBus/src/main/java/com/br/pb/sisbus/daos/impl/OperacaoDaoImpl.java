package com.br.pb.sisbus.daos.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.br.pb.sisbus.daos.OperacaoDao;
import com.br.pb.sisbus.models.Operacao;
import com.br.pb.sisbus.models.PaginatedList;

@Repository
public class OperacaoDaoImpl implements OperacaoDao{
	
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
	Date date;
	Date dateTime;
	
	@PersistenceContext
	private EntityManager manager;
	
	@Override
	public void setManager(EntityManager manager) {
		this.manager = manager;
	}
	
	@Override
	public List<Operacao> all() {
		return manager.createQuery("select o from Operacao o", Operacao.class).getResultList();
	}
	
	@Override
	@Transactional
	public void save(Operacao operacao) {
		date = new Date();
		dateTime = new Date();
		dateFormat.format(date);
		timeFormat.format(dateTime);
		
		operacao.setDataOperacao(date);
		operacao.setHoraOperacao(dateTime);
		manager.persist(operacao);		
	}
	
	@Override
	public Operacao findById(Long id) {
		return manager.find(Operacao.class, id);
	}

	@Override
	public void remove(Operacao operacao) {
		manager.remove(operacao);
	}
	
	@Override
	public void update(Operacao operacao) {
		manager.merge(operacao);
	}
	
	@Override
	public PaginatedList paginated(int page, int max) {
		return new PaginatorQueryHelper().list(manager, Operacao.class, page, max);
	}

	@Override
	public Operacao findByIdChamado(Long id) {
		Operacao operacao = manager.createQuery("SELECT o FROM Operacao o WHERE o.usuario_id = :idUsuario", Operacao.class).setParameter("usuario_id", id).getSingleResult();
		return operacao;
	}

}
