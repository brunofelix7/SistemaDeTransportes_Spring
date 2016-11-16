package com.br.pb.sisbus.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.transaction.Transactional;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.br.pb.sisbus.daos.OperacaoDao;
import com.br.pb.sisbus.models.Operacao;

@Controller
@RequestMapping("/gestor/operacao")
@Transactional
public class OperacaoController {

	@Autowired
	private OperacaoDao operacaoDao;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat dateFormatHora = new SimpleDateFormat("HH:mm:ss");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormatHora, false));
	}
	
	@RequestMapping("/form")
	public ModelAndView form(Operacao operacao) {
		ModelAndView modelAndView = new ModelAndView("gestor/operacao/form-add");
		return modelAndView;
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView save(@Valid Operacao operacao, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			return form(operacao);
		}else{
			operacaoDao.save(operacao);
			return new ModelAndView("gestor/operacao/success");
		}
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/{id}")
	public ModelAndView load(@PathVariable("id") Long id) {
		ModelAndView modelAndView = new ModelAndView("gestor/operacao/form-update");
		modelAndView.addObject("operacao", operacaoDao.findById(id));
		return modelAndView;
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/visualizar/{id}")
	public ModelAndView visualizar(@PathVariable("id") Long id) {
		ModelAndView modelAndView = new ModelAndView("gestor/operacao/visualizar");
		modelAndView.addObject("operacao", operacaoDao.findById(id));
		return modelAndView;
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView list(@RequestParam(defaultValue = "0", required = false) int page) {
		ModelAndView modelAndView = new ModelAndView("gestor/operacao/list");
		modelAndView.addObject("paginatedList", operacaoDao.paginated(page, 10));
		return modelAndView;
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/remove/{id}")
	public String remove(@PathVariable("id") Long id) {
		Operacao operacao = operacaoDao.findById(id);
		operacaoDao.remove(operacao);
		try {
		    Thread.sleep(1000);
		} catch(InterruptedException ex) {
		    Thread.currentThread().interrupt();
		}
		return "redirect:/gestor/operacao";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/{id}")
	public ModelAndView update(@PathVariable("id") Long id, @Valid Operacao operacao, BindingResult bindingResult){
		operacao.setId(id);
		if (bindingResult.hasErrors()) {
			System.out.println(bindingResult);	//	Debug
			return new ModelAndView("gestor/operacao/form-update");
		}else{
			operacaoDao.update(operacao);
			return new ModelAndView("gestor/operacao/success");
		}
		
	}
		
}
