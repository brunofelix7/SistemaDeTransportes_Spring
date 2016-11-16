package com.br.pb.sisbus.daos;

import java.util.List;
import javax.persistence.EntityManager;
import com.br.pb.sisbus.models.Operacao;
import com.br.pb.sisbus.models.PaginatedList;

public interface OperacaoDao {
	
public void setManager(EntityManager manager);
	
	public List<Operacao> all();
	
	public void save(Operacao operacao);
	
	public Operacao findById(Long id);
	
	public Operacao findByIdChamado(Long id);
	
	public void remove(Operacao operacao);
	
	public void update(Operacao operacao);
	
	public PaginatedList paginated(int page, int max);

}
