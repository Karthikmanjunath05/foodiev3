package com.FoodieServers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class userdao {
	private Connection con;
	userobj row;
	public userdao(Connection con) {
		this.con = con;
	}
		public userobj getAllusers(String quary){
		ResultSet rs;	 
	try {
		
		PreparedStatement pst = con.prepareStatement(quary);
		rs = pst.executeQuery();
		while(rs.next()) {
			row = new userobj(rs.getInt("customerId"),rs.getString("ucontact"),rs.getString("uemail"),rs.getString("uname"),rs.getString("uaddress"),rs.getString("upass"));		
			
		}
		} catch(Exception e){
		e.printStackTrace();
	}
	return row;
		}
}