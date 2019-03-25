package com.iiiedu105.RentHouse;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Clob;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialClob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
@Component
public class ChangeClob {

	@Autowired
	ServletContext context;
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
	

	@SuppressWarnings("unused")
	public Blob getImageBlob(MultipartFile mf) {
		Blob blob;
		try {
			byte b[] = mf.getBytes();
			blob = new SerialBlob(b);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("上傳異常：" + e.getMessage());
			throw new RuntimeException(e);
		}
		return blob;
	}

	@SuppressWarnings("unused")
	public byte[] toByteArray(String noImg) {
		String root = context.getRealPath("/");
		root = root.substring(0, root.length()-1);
		String realLoction = root +noImg;
		 byte[] b = null;
	      try {
	            File file = new File(realLoction);
	            long size = file.length();
	            b = new byte[(int)size];
	            InputStream fis = context.getResourceAsStream(noImg);
	            fis.read(b);
	      } catch (FileNotFoundException e) {
	            e.printStackTrace();
	      } catch (IOException e) {
	            e.printStackTrace();
	      }
	      return b;
	}

	
	public static byte[] file2Byte(String inFile){
	    InputStream in = null;
	    byte[] result = null;
	    try {
	        in = new FileInputStream(new File(inFile));
	        int len = in.available();
	        result = new byte[len];
	        in.read(result);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		return result;
	}
	public String timeStampToSimpleDate(Timestamp time) {
		String format = "";
		 DateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		 format = sdFormat.format(time);
		return format;		
	}
}
