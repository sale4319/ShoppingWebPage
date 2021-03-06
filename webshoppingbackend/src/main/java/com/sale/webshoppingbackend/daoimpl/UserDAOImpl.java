package com.sale.webshoppingbackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sale.webshoppingbackend.dao.UserDAO;
import com.sale.webshoppingbackend.dto.Address;
import com.sale.webshoppingbackend.dto.User;

@Repository("userDAO")
@Transactional
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public User getByEmail(String email) {
		String selectQuery = "FROM User WHERE email = :email";

		try {

			return sessionFactory.getCurrentSession()
					.createQuery(selectQuery, User.class)
						.setParameter("email", email)
							.getSingleResult();

		} catch (Exception ex) {
			return null;
		}

	}

	@Override
	public boolean addUser(User user) {
		try {
			sessionFactory.getCurrentSession().persist(user);
			return true;

		} catch (Exception ex) {			
			return false;
		}
	}

	@Override
	public boolean addAddress(Address address) {
		try {
			sessionFactory.getCurrentSession().persist(address);
			return true;

		} catch (Exception ex) {
			return false;
		}
	}

	

	@Override
	public Address getBillingAddress(int userId) {
		String selectQuery = "FROM Address WHERE user_id = :user_id AND billing = :billing";
		try {

			return sessionFactory.getCurrentSession()
					.createQuery(selectQuery, Address.class)
						.setParameter("user_id", userId)
							.setParameter("billing", true)
								.getSingleResult();

		} catch (Exception ex) {
			return null;
		}

	}

	@Override
	public List<Address> listShippingAddresses(int userId) {
		String selectQuery = "FROM Address WHERE user_id = :user_id AND shipping = :shipping";
		
			return sessionFactory.getCurrentSession()
					.createQuery(selectQuery, Address.class)
						.setParameter("user_id", userId)
							.setParameter("shipping", true)
								.getResultList();
		
	}

}
