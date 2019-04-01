package com.iiiedu105.RentHouse._config;

import java.beans.PropertyVetoException;
import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.mchange.v2.c3p0.ComboPooledDataSource;

@Configuration
@EnableTransactionManagement
public class RootAppConfig {

	public RootAppConfig() {
	}

	@Bean
	public DataSource dataSource() {
		ComboPooledDataSource ds = new ComboPooledDataSource();
//		ds.setUser("sa");
//		ds.setPassword("passw0rd");
		ds.setUser("eeit105house");
		ds.setPassword("!!!eeit!o5");
		try {
			ds.setDriverClass("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (PropertyVetoException e) {
			e.printStackTrace();
		}
//		ds.setJdbcUrl("jdbc:sqlserver://localhost:1433;databaseName=RentHouseDB");
		ds.setJdbcUrl("jdbc:sqlserver://dbservereeit105house.database.windows.net:1433;database=RentHouseDB");

		ds.setInitialPoolSize(4);
		ds.setMaxPoolSize(8);
		return ds;
	}
	
	@Bean
	public LocalSessionFactoryBean sessionFactory() {
		LocalSessionFactoryBean factory = new LocalSessionFactoryBean();
		factory.setDataSource(dataSource());
		factory.setPackagesToScan(new String[] {"com.iiiedu105.RentHouse"});
		factory.setHibernateProperties(additionalProperties());
		return factory;
	}
	@Bean(name="transactionManager")
    @Autowired
    public HibernateTransactionManager transactionManager(SessionFactory sessionFactory) {
         HibernateTransactionManager txManager = new HibernateTransactionManager();
         txManager.setSessionFactory(sessionFactory);
         return txManager;
      }	
	
	private Properties additionalProperties()  {
		Properties properties=new Properties();
		properties.put("hibernate.dialect", org.hibernate.dialect.SQLServer2012Dialect.class);
		properties.put("hibernate.show_sql", Boolean.TRUE);
		properties.put("hibernate.format_sql", Boolean.TRUE);
		properties.put("default_batch_fetch_size", 10);
		properties.put("hibernate.hbm2ddl.auto", "update");
		properties.put("hibernate.event.merge.entity_copy_observer", "allow");
		return properties;
	}
}
