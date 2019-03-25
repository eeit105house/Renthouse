package com.iiiedu105.RentHouse.listHouse.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.iiiedu105.RentHouse.listHouse.dao.SearchHouseByConditionDao;
import com.iiiedu105.RentHouse.listHouse.service.SearchHouseByConditionService;
import com.iiiedu105.RentHouse.model.HousePic;

@Service
public class SearchHouseByConditionServiceImpl implements SearchHouseByConditionService {
	
	@Autowired
	SearchHouseByConditionDao dao;
	
	public SearchHouseByConditionServiceImpl() {

	}
	@Transactional
	@Override
	public List<Object[]> getAllhouse() {
		
		return dao.getAllhouse();
	}

	@Transactional
	@Override
	public List<HousePic> getAllHousePic() {	
		return dao.getAllHousePic();
	}

	@Transactional
	@Override
	public List<Object[]> getHouseByMsg(String msg) {	
		msg = " and h.addr = '"+msg+"' ";
		return dao.getHouseByMsg(msg);
	}
	
	@Transactional
	@Override
	public List<Object[]> getHouseByCriteria(String Searchcriteria) {
		String type="",floor="",price="",sqft="",build="",more="",city="",keyWord="";
		String build1="1<>1",build2="1<>1",build3="1<>1",build4="1<>1";
		String more1="1=1",more2="1=1",more3="1=1",more4="1=1",more5="1=1",more6="1=1",more7="1=1",more8="1=1";
		String[] criteria = Searchcriteria.split(",");
		for(int i = 0 ;i < criteria.length ; i++) {
			Integer count =0;
			if(criteria[i].equals("縣市")) {	city = "";count++;}
			else if(criteria[i].substring(criteria[i].length()-1).equals("縣")) {count++;
				city = "and (h.city = '"+criteria[i]+"' or h.boroughs like '%"+criteria[i].substring(criteria[i].length()-3, criteria[i].length()-1)+"%'  )";
			}else if(criteria[i].substring(criteria[i].length()-1).equals("市")) {count++;
				city = "and (h.city = '"+criteria[i]+"' or h.boroughs like '%"+criteria[i].substring(criteria[i].length()-3, criteria[i].length()-1)+"%'  )";
			}else if(criteria[i].substring(criteria[i].length()-1).equals("區")) {count++;
				city = "and (h.city = '"+criteria[i]+"' or h.boroughs like '%"+criteria[i].substring(criteria[i].length()-3, criteria[i].length()-1)+"%'  )";
			}else if(criteria[i].substring(criteria[i].length()-1).equals("鎮")) {count++;
				city = "and (h.city = '"+criteria[i]+"' or h.boroughs like '%"+criteria[i].substring(criteria[i].length()-3, criteria[i].length()-1)+"%'  )";
			}else if(criteria[i].substring(criteria[i].length()-1).equals("鄉")) {count++;
				city = "and (h.city = '"+criteria[i]+"' or h.boroughs like '%"+criteria[i].substring(criteria[i].length()-3, criteria[i].length()-1)+"%'  )";
			}else if(criteria[i].substring(criteria[i].length()-1).equals("島")) {count++;
				city = "and (h.city = '"+criteria[i]+"' or h.boroughs like '%"+criteria[i].substring(criteria[i].length()-3, criteria[i].length()-1)+"%'  )";
			}			
			if(criteria[i].equals("1樓")) {count++;	floor = "and (h.floor = 1)";}
			if(criteria[i].equals("2-3樓")) {count++;	floor = "and (h.floor = 2 or h.floor = 3)";}
			if(criteria[i].equals("4樓以上")) {count++;	floor = "and (h.floor > 3)";}
			
			if(criteria[i].equals("類型不限")) {count++;	type = "";}
			if(criteria[i].equals("類型不限")) {count++;	type = "";}
			if(criteria[i].equals("整層住家")) {count++;	type = "and (h.type = '整層住家')";}
			if(criteria[i].equals("獨立套房")) {count++;	type = "and (h.type = '獨立套房')";}
			if(criteria[i].equals("分租套房")) {count++;	type = "and (h.type = '分租套房')";}
			if(criteria[i].equals("雅房")) {count++;type = "and (h.type = '雅房')";}
			if(criteria[i].equals("其他類型")){count++;	
				type = "and (h.type <> '獨立套房' and h.type <> '整層住家' and h.type <> '分租套房' and h.type <> '雅房')";}
			if(criteria[i].equals("租金不限")) {count++;	price = "";}
			if(criteria[i].equals("5000元以下")) {count++;  price = "and (0<=hd.price and hd.price<=5000)";
			}else if(criteria[i].equals("40000元以上")) {count++;	price = "and (40000<=hd.price)";
			}else if(criteria[i].substring(criteria[i].length()-1).equals("元")) {count++;
				String[] range = criteria[i].split("元")[0].split("-");
				price = "and ("+range[0]+"<=hd.price and hd.price<="+range[1]+")";
			}	
			if(criteria[i].equals("坪數不限")) {count++;	sqft = "";}
			if(criteria[i].equals("10坪以下")) {count++;	sqft = "and (0<=h.sqft and h.sqft<=10)";
			}else if(criteria[i].equals("50坪以上")) {count++;  sqft = "and (50<=h.sqft)";
			}else if(criteria[i].substring(criteria[i].length()-1).equals("坪")) {count++;
				String[] range = criteria[i].split("坪")[0].split("-");
				sqft = "and ("+range[0]+"<=h.sqft and h.sqft<="+range[1]+")";
			}			
			if(criteria[i].equals("公寓")) {count++; build1 = "h.build = '公寓'";}
			if(criteria[i].equals("電梯大樓")) {count++; build2 = "h.build = '電梯大樓'";}
			if(criteria[i].equals("透天厝")) {count++; build3 = "h.build = '透天厝'";}
			if(criteria[i].equals("別墅")) {count++; build4 = "h.build = '別墅'";}			
			if(criteria[i].equals("電視")) {count++; more1 = "hd.appliance like '%電視%'";}
			if(criteria[i].equals("冰箱")) {count++; more2 = "hd.appliance like '%冰箱%'";}
			if(criteria[i].equals("洗衣機")) {count++; more3 = "hd.appliance like '%洗衣機%'";}
			if(criteria[i].equals("冷氣")) {count++; more4 = "hd.appliance like '%冷氣%'";}
			if(criteria[i].equals("網路")) {count++; more5 = "hd.appliance like '%網路%'";}
			if(criteria[i].equals("熱水器")) {count++; more6 = "hd.appliance like '%熱水器%'";}
			if(criteria[i].equals("第四台")) {count++; more7 = "hd.appliance like '%第四台%'";}
			if(criteria[i].equals("瓦斯")) {count++; more8 = "hd.appliance like '%瓦斯%'";}
			if(count == 0) {
				keyWord="and (h.city like '%"+criteria[i]+"%' or h.addr like '%"+criteria[i]+"%' or hd.title like '%"+criteria[i]+"%')";
			}
		}
		more =  "and ("+more1+" and "+more2+" and "+more3+" and "+more4+" and "+more5+" and "+more6+" and "+more7+" and "+more8+")";
		build = "and ("+build1+" or "+build2+" or "+build3+" or "+build4+")";
		
		if(build.equals("and (1<>1 or 1<>1 or 1<>1 or 1<>1)")) {build="";};
		if(more.equals("and (1=1 or 1=1 or 1=1 or 1=1 or 1=1 or 1=1 or 1=1 or 1=1)")) {more="";};
		Searchcriteria = type+price+sqft+floor+build+more+city+keyWord;
		return dao.getHouseByCriteria(Searchcriteria);
	}
	
	@Transactional
	@Override
	public HousePic getHousePicById(Integer id) {
		return dao.getHousePicById(id);
	}
	@Transactional
	@Override
	public List<Object[]> gethouse() {
		return dao.gethouse();
	}
	@Transactional
	@Override
	public List<Object[]> getAllVipHouse() {
		return dao.getAllVipHouse();
	}

}
