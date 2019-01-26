package com.image.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.image.pojo.FilePojo;
import com.image.utility.DBUtility;

public class FileDaoImpl implements FileDao {
	
	Connection conn=null;

	@Override
	public boolean addFile(FilePojo filePojo) 
	{
		try 
		{
			conn=DBUtility.getConnection();
			PreparedStatement ps=conn.prepareStatement("insert into file_data(file) values(?)");
			
			ps.setString(1, filePojo.getFile());
			
			int x=ps.executeUpdate();
			
			if(x>0)
			{
				return true;
			}
			else
			{
				return false;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
