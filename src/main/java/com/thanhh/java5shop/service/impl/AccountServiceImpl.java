package com.thanhh.java5shop.service.impl;

import com.thanhh.java5shop.model.Account;
import com.thanhh.java5shop.repository.AccountDao;
import com.thanhh.java5shop.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AccountServiceImpl implements AccountService {
	@Autowired
	AccountDao accountDao;

	
	@Override
	public Account save(Account entity) {
		return accountDao.save(entity);
	}

	@Override
	public List<Account> saveAll(List<Account> entities) {
		return (List<Account>) accountDao.saveAll(entities);
	}

	@Override
	public Optional<Account> findById(String id) {
		return accountDao.findById(id);
	}

	@Override
	public boolean existsById(String id) {
		return accountDao.existsById(id);
	}

	@Override
	public List<Account> findAll() {
		return (List<Account>) accountDao.findAll();
	}

	@Override
	public List<Account> findAllById(List<String> ids) {
		return (List<Account>) accountDao.findAllById(ids);
	}

	@Override
	public long count() {
		return accountDao.count();
	}

	@Override
	public void deleteById(String id) {
		accountDao.deleteById(id);
	}

	@Override
	public void delete(Account entity) {
		accountDao.delete(entity);
	}

	@Override
	public void deleteAllById(List<String> ids) {
		accountDao.deleteAllById(ids);
	}

	@Override
	public void deleteAll(List<Account> entities) {
		accountDao.deleteAll(entities);
	}

	@Override
	public void deleteAll() {
		accountDao.deleteAll();
	}
	
	
}
