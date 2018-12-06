package com.algaworks.cursojsf2.financeiro.repository.infra;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.algaworks.cursojsf2.financeiro.model.Lancamento;
import com.algaworks.cursojsf2.financeiro.repository.Lancamentos;

public class LancamentosHibernate implements Lancamentos {
	private Session session;

	public LancamentosHibernate(Session session) {
		// TODO Auto-generated constructor stub
		this.session = session;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Lancamento> todos() {
		// TODO Auto-generated method stub
		return session.createCriteria(Lancamento.class).addOrder(Order.desc("dataVencimento")).list();
	}

	@Override
	public Lancamento guardar(Lancamento lancamento) {
		// TODO Auto-generated method stub
		return (Lancamento) session.merge(lancamento);
	}

	@Override
	public void remover(Lancamento lancamento) {
		// TODO Auto-generated method stub
		this.session.delete(lancamento);
	}

	@Override
	public Lancamento comDadosIguais(Lancamento lancamento) {
		// TODO Auto-generated method stub
		return (Lancamento) this.session.createCriteria(Lancamento.class)
				.add(Restrictions.eq("tipo", lancamento.getTipo()))
				.add(Restrictions.eq("pessoa", lancamento.getPessoa()))
				.add(Restrictions.ilike("descricao", lancamento.getDescricao()))
				.add(Restrictions.eq("valor", lancamento.getValor()))
				.add(Restrictions.eq("dataVencimento", lancamento.getDataVencimento())).uniqueResult();
	}

	@Override
	public Lancamento porCodigo(Integer codigo) {
		// TODO Auto-generated method stub
		return (Lancamento) this.session.get(Lancamento.class, codigo);
	}

}
