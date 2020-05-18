package com;

import java.util.ArrayList;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

import com.google.gson.*;
import org.json.simple.*;

import model.*;

import org.apache.tomcat.util.json.JSONParser;
import org.jsoup.*;
import org.jsoup.parser.*;
import org.jsoup.nodes.Document;

@Path("/host")
public class hospital {

	hospitalModel hos =new hospitalModel();
	
	@GET
	@Path("/")
	@Produces(MediaType.TEXT_HTML)
	public String view(String pays)
	{
		return hos.getHospital();
	}
	
	@POST
	@Path("/")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.TEXT_PLAIN)
	public String add(String pays)
	{
		
		//Convert the input string to a JSON object
		JsonObject hosObj = new JsonParser().parse(pays).getAsJsonObject();
		
		hos.addHospitals(hosObj.get("name").getAsString(),Integer.parseInt(hosObj.get("beds").getAsString()),Integer.parseInt(hosObj.get("wards").getAsString()),Integer.parseInt(hosObj.get("rooms").getAsString()),hosObj.get("address").getAsString(),hosObj.get("city").getAsString(),hosObj.get("phone").getAsString());
		
		JSONObject json = new JSONObject();
		json.put("success", Integer.toString(hos.getSuccess()));
		
		return json.toString();
			
		
	}
	
	@PUT
	@Path("/")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.TEXT_PLAIN)
	public String edit(String pays)
	{
		
		//Convert the input string to a JSON object
		JsonObject hosObj = new JsonParser().parse(pays).getAsJsonObject();
		
		hos.editHospitals(hosObj.get("name").getAsString(),Integer.parseInt(hosObj.get("beds").getAsString()),Integer.parseInt(hosObj.get("wards").getAsString()),Integer.parseInt(hosObj.get("rooms").getAsString()),hosObj.get("address").getAsString(),hosObj.get("city").getAsString(),hosObj.get("phone").getAsString(),Integer.parseInt(hosObj.get("id").getAsString()));
		
		JSONObject json = new JSONObject();
		json.put("success", Integer.toString(hos.getSuccess()));
		
		return json.toString();
			
		
	}
	
	@DELETE
	@Path("/")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.TEXT_PLAIN)
	public String delete(String pays)
	{
		
		//Convert the input string to a JSON object
		JsonObject hosObj = new JsonParser().parse(pays).getAsJsonObject();
		
		hos.deleteHospital(Integer.parseInt(hosObj.get("id").getAsString()));
		
		JSONObject json = new JSONObject();
		json.put("success", Integer.toString(hos.getSuccess()));
		
		return json.toString();
			
		
	}
	
	@POST
	@Path("/get")
	@Produces(MediaType.TEXT_HTML)
	public String viewOne(String pays)
	{
		JsonObject hosObj = new JsonParser().parse(pays).getAsJsonObject();
		
		return hos.getHospital(Integer.parseInt(hosObj.get("id").getAsString())).toString();
	}
	
}
