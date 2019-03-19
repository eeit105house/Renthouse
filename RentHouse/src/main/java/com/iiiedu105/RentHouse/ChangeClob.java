package com.iiiedu105.RentHouse;

import java.io.BufferedReader;
import java.io.Reader;
import java.sql.Clob;
import java.sql.SQLException;

import javax.sql.rowset.serial.SerialClob;

import org.springframework.stereotype.Component;
@Component
public class ChangeClob {

	public String ClobToString(Clob clob) {
		String cString = null;
		StringBuffer sb = null;
		try {
		Reader read = clob.getCharacterStream();
		BufferedReader br = new BufferedReader(read);
		String s = br.readLine();
		sb = new StringBuffer();
		while (br != null) {
			sb.append(s);
			s = br.readLine();
			} 
		}catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		cString = sb.toString();
		return cString;
	}
	
	public Clob stringToClob(String str) {
		Clob clob = null;
		try {
			clob = new SerialClob(str.toCharArray());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return clob;
	}
	
}
