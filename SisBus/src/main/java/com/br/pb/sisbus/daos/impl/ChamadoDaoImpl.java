package com.br.pb.sisbus.daos.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import org.springframework.stereotype.Repository;
import com.br.pb.sisbus.daos.ChamadoDao;
import com.br.pb.sisbus.enuns.StatusChamado;
import com.br.pb.sisbus.models.Chamado;
import com.br.pb.sisbus.models.PaginatedList;

@Repository
public class ChamadoDaoImpl implements ChamadoDao {
	
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat horaFormat = new SimpleDateFormat("HH:mm:ss");
	Date date;
	Date dateHora;
	
	@PersistenceContext
	private EntityManager manager;
	
	public void setManager(EntityManager manager) {
		this.manager = manager;
	}
	
	public List<Chamado> all() {
		return manager.createQuery("select c from Chamado c", Chamado.class).getResultList();
	}
	
	@Override
	@Transactional
	public void save(Chamado chamado) {
		date = new Date();
		dateHora = new Date();
		dateFormat.format(date);
		horaFormat.format(dateHora);
		
		chamado.setDataChamado(date);
		chamado.setHoraChamado(dateHora);
		chamado.setStatus(StatusChamado.ABERTO);
		manager.persist(chamado);		
	}
	
	public Chamado findById(Long id) {
		return manager.find(Chamado.class, id);
	}

	public void remove(Chamado chamado) {
		manager.remove(chamado);
	}

	public void update(Chamado chamado) {
		date = new Date();
		dateHora = new Date();
		dateFormat.format(date);
		horaFormat.format(dateHora);
		
		chamado.setDataFechamento(date);
		chamado.setHoraFechamento(dateHora);
		
		String horaChamado = chamado.getHoraChamado().getHours() + ":" + chamado.getHoraChamado().getMinutes() + ":" + chamado.getHoraChamado().getSeconds();
		String horaFechamento = chamado.getHoraFechamento().getHours() + ":" + chamado.getHoraFechamento().getMinutes() + ":" + chamado.getHoraFechamento().getSeconds();
		try{
			Date hora1 = horaFormat.parse(horaChamado);
			Date hora2 = horaFormat.parse(horaFechamento);
			long difference = hora2.getTime() - hora1.getTime(); 
			long hour = difference / (60 * 60 * 1000);
			long minutes = difference / (60 * 1000) % 60;
			long seconds = difference / 1000 % 60;
			String totalEspera = hour + ":" + minutes + ":" + seconds;
			
			chamado.setTempoEspera(horaFormat.parse(totalEspera));
		}catch(ParseException e){
			e.printStackTrace();
		}finally{
			manager.merge(chamado);
		}
	}
	
	public PaginatedList paginated(int page, int max) {
		return new PaginatorQueryHelper().list(manager, Chamado.class, page, max);
	}

	@Override
	public Chamado findByIdChamado(Long idChamado) {
		Chamado chamado = manager.createQuery("SELECT c FROM Chamado c WHERE c.usuario_id = :idUsuario", Chamado.class).setParameter("usuario_id", idChamado).getSingleResult();
		return chamado;
	}
	
	
	

}
