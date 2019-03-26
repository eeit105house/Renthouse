package com.iiiedu105.RentHouse.backend.main.service;

import java.sql.Blob;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iiiedu105.RentHouse.backend.main.dao.LoginDao;
import com.iiiedu105.RentHouse.model.Employee;
import com.iiiedu105.RentHouse.model.HouseDeal;

@Service
@Transactional
public class LoginServiceImpl implements LoginService {

	@Autowired
	LoginDao dao;

	@Override
	public List<Employee> getOneEmployee(String mid, String pwd) {
		return dao.getOneEmployee(mid, pwd);
	}

	@Override
	public void updateEmployee(String eid, String ename, Blob pic, String pwd) {
		dao.updateEmployee(eid, ename, pic, pwd);
	}

	@Override
	public Employee getEmployeeById(String mid) {
		return dao.getEmployeeById(mid);
	}

	@Override
	public List<int[]> getAllHouseDeal() {
		List<int[]> listint = new LinkedList<>();
		List<HouseDeal> list = dao.getAllHouseDeal();

		int[] allmonth18 = new int[12];
		int[] ave18 = new int[12];
		int total18 = 0;
		
		int[] allmonth19 = new int[12];
		int[] ave19 = new int[12];
		int total19 = 0;
		
		java.sql.Date date = new java.sql.Date(new Date().getTime());
		int myyear = Integer.parseInt(date.toString().substring(0, 4));
		
		for (HouseDeal deal : list) {
			int year = Integer.parseInt(deal.getDealDate().toString().substring(0, 4));
			int month = Integer.parseInt(deal.getDealDate().toString().substring(6, 7));
			
			if (year == (myyear-1)) {
				for (int i = 0; i < allmonth18.length; i++) {
					if ((month - 1) == i) {
						allmonth18[i] = allmonth18[i] + 1;
						total18 = total18 + 1;
					}
				}
			}else if (year == myyear) {
				for (int i = 0; i < allmonth19.length; i++) {
					if ((month - 1) == i) {
						allmonth19[i] = allmonth19[i] + 1;
						total19 = total19 + 1;
					}
				}
				
			}
		}
		
		for (int i = 0; i < ave18.length; i++) {
			ave18[i] = (allmonth18[i] * 100) / total18;
		}
		for (int i = 0; i < ave19.length; i++) {
			ave19[i] = (allmonth19[i] * 100) / total19;
		}
		listint.add(ave18);
		listint.add(ave19);
		return listint;
	}
	
	@Override
	public Map<String, Integer> getHouseDealInfo() {
		Map<String, Integer> map = new HashMap<String, Integer>();
		List<HouseDeal> list = dao.getAllHouseDeal();
		int amount18 = 0;
		int item18 = 0;
		int amount19 = 0;
		int item19 = 0;
		java.sql.Date date = new java.sql.Date(new Date().getTime());
		int myyear = Integer.parseInt(date.toString().substring(0, 4));
		
		for (HouseDeal deal : list) {
			
			int year = Integer.parseInt(deal.getDealDate().toString().substring(0, 4));
			if (year == (myyear-1)) {
				amount18 = amount18 + 1;
				item18 = item18 + deal.getDealPrice();
			}
			if (year == myyear) {
				amount19 = amount19 + 1;
				item19 = item19 + deal.getDealPrice();
			}
		}
		map.put("amountlast", amount18);
		map.put("itemlast", item18);
		map.put("amount", amount19);
		map.put("item", item19);
		map.put("year", myyear);
		map.put("lastyear", (myyear-1));
		return map;
	}

}
