package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.json.simple.JSONObject;

import connection.DBConnect;

public class hospitalModel {


private int success;
	
	public void addHospitals(String name,int beds,int wards,int rooms,String address,String city,String phone) {
		Connection connection;
		PreparedStatement preparedStatement;
		String names=null;
		
		try {
			connection = DBConnect.getDBConnection();
			
			//check hospital name
			preparedStatement = connection.prepareStatement("select * from hospital where name=?");
			preparedStatement.setString(1, name);
			ResultSet rs = preparedStatement.executeQuery();
			 
			while(rs.next())
			{
				names = rs.getString(2);	
			}
			
			if(names==null) {
				
				//insert value
				preparedStatement = connection.prepareStatement("insert into hospital (name,beds,wards,rooms,address,city,phone) values (?,?,?,?,?,?,?)");
				preparedStatement.setString(1, name);
				preparedStatement.setDouble(2, beds);
				preparedStatement.setInt(3,wards);
				preparedStatement.setInt(4,rooms);
				preparedStatement.setString(5, address);
				preparedStatement.setString(6, city);
				preparedStatement.setString(7, phone);
				preparedStatement.execute();
				preparedStatement.close();
				connection.close();
				setSuccess(1);
				
			}else {
				setSuccess(0);
			}
		
		}catch (ClassNotFoundException | SQLException  e) {
			System.out.println(e.getMessage());
		}
	}

	public int getSuccess() {
		return success;
	}

	public void setSuccess(int success) {
		this.success = success;
	}
	
	public String getHospital() {
		
		Connection connection;
		PreparedStatement preparedStatement;
		String table="";
		
		try {
			
			connection = DBConnect.getDBConnection();
			preparedStatement = connection.prepareStatement("select * from hospital");
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			table = "<table class='table'><thead>"
		            +"<tr>"
		            +"<th class='tableTh'>ID</th>"
		                +"<th class='tableTh'>Hospital Name</th>"
		                +"<th class='tableTh'>Beds</th>"
		                +"<th class='tableTh'>Wards</th>"
		                +"<th class='tableTh'>Rooms</th>"
		                +"<th class='tableTh'>Address</th>"
		                +"<th class='tableTh'>City</th>"
		                +"<th class='tableTh'>Phone</th>"
		                +"<th class='tableTh'>Action</th>"
		                +"</tr>"
		            +"</thead><tbody>";
			
			while (resultSet.next()) {
				
				String button = "<button type='button' onclick='edit("+resultSet.getString(1)+")' class='btn btn-success'>Edit</button><button type='button' onclick='deletes("+resultSet.getString(1)+")' class='btn btn-danger'>Delete</button>";
				
				table = table+"<tr><td class='tableTh'>"+resultSet.getString(1)+"</td>"
						+ "<td class='tableTh'>"+resultSet.getString(2)+"</td>"
						+ "<td class='tableTh'>"+resultSet.getString(3)+"</td>"
						+ "<td class='tableTh'>"+resultSet.getString(4)+"</td>"
						+ "<td class='tableTh'>"+resultSet.getString(5)+"</td>"
						+ "<td class='tableTh'>"+resultSet.getString(6)+"</td>"
						+ "<td class='tableTh'>"+resultSet.getString(7)+"</td>"
						+ "<td class='tableTh'>"+resultSet.getString(8)+"</td>"
						+ "<td class='tableTh'>"+button+"</td>"
					  + "</tr>";
				
			}
			
			preparedStatement.close();
			connection.close();
			
		}catch (ClassNotFoundException | SQLException  e) {

			System.out.println(e.getMessage());
		}
		
		return table+"</table>";
	}

	public void editHospitals(String name,int beds,int wards,int rooms,String address,String city,String phone,int oid) {
		Connection connection;
		PreparedStatement preparedStatement;
		int id=0;
		
		try {
			connection = DBConnect.getDBConnection();
			
			//check hospital name
			preparedStatement = connection.prepareStatement("select * from hospital where name=?");
			preparedStatement.setString(1, name);
			ResultSet rs = preparedStatement.executeQuery();
			 
			while(rs.next())
			{
				id= rs.getInt(1);
			}
			
			if(id==0||id==oid) {
				
				//insert value
				preparedStatement = connection.prepareStatement("UPDATE hospital SET name=?,beds=?,wards=?,rooms=?,address=?,city=?,phone=? where id=?");
				preparedStatement.setString(1, name);
				preparedStatement.setDouble(2, beds);
				preparedStatement.setInt(3,wards);
				preparedStatement.setInt(4,rooms);
				preparedStatement.setString(5, address);
				preparedStatement.setString(6, city);
				preparedStatement.setString(7, phone);
				preparedStatement.setInt(8,oid);
				preparedStatement.execute();
				preparedStatement.close();
				connection.close();
				setSuccess(1);
				
			}else {
				setSuccess(0);
			}
		
		}catch (ClassNotFoundException | SQLException  e) {
			System.out.println(e.getMessage());
		}
	}

	public void deleteHospital(int hospital) {
		Connection connection;
		PreparedStatement preparedStatement;
		
		try {
			connection = DBConnect.getDBConnection();
			
			//delete hospital
			preparedStatement = connection.prepareStatement("DELETE FROM hospital WHERE id=?");
			preparedStatement.setInt(1, hospital);
			preparedStatement.execute();
			
			setSuccess(1);
		
		}catch (ClassNotFoundException | SQLException  e) {
			setSuccess(0);
		}
	}
	
	public JSONObject getHospital(int id) {
		Connection connection;
		PreparedStatement preparedStatement;
		JSONObject json = new JSONObject();
		
		try {
			connection = DBConnect.getDBConnection();
			
			preparedStatement = connection.prepareStatement("select * from hospital where id=?");
			preparedStatement.setInt(1, id);
			ResultSet rs = preparedStatement.executeQuery();

			while(rs.next())
			{
				json.put("id", rs.getInt(1));
				json.put("name", rs.getString(2));
				json.put("beds", rs.getInt(3));
				json.put("wards", rs.getInt(4));
				json.put("rooms", rs.getInt(5));
				json.put("address", rs.getString(6));
				json.put("city", rs.getString(7));
				json.put("phone", rs.getString(8));
			}
			
		}catch (ClassNotFoundException | SQLException  e) {
			setSuccess(0);
		}
		return json;
	}
	
}
