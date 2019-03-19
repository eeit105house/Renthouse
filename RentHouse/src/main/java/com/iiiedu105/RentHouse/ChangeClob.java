package com.iiiedu105.RentHouse;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.Reader;
import java.sql.Clob;
import java.sql.SQLException;

import javax.sql.rowset.serial.SerialClob;

import org.springframework.stereotype.Component;
@Component
public class ChangeClob {

	public String ClobToString(Clob c) {
		StringBuffer s = new StringBuffer();
		if(c != null){
		BufferedReader bufferRead = null;
		try {
			bufferRead = new BufferedReader(c.getCharacterStream());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String str;
		try {
			while ((str = bufferRead.readLine()) != null) {
			s.append(str);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		return s.toString();
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
