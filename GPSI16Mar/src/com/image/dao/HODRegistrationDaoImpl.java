package com.image.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.image.pojo.GPSIRegistrationHODPojo;
import com.image.pojo.GPSIRegistrationStudentPojo;
import com.image.pojo.GPSIRegistrationTeacherPojo;
import com.image.pojo.HODRequestedFiles;
import com.image.pojo.HODUploadFile;
import com.image.pojo.PublicUploadFile;
import com.image.pojo.TeacherRequestedFiles;
import com.image.pojo.ImageIndexPojo;
import com.image.pojo.StudentUploadFile;
import com.image.pojo.TeacherUploadFile;
import com.image.utility.DBUtility;

public class HODRegistrationDaoImpl implements HODRegistrationDao
{
	Connection conn=null;

	@Override
	public boolean savePassword(ImageIndexPojo imageIndexPojo) 
	{
		try 
		{
			conn=DBUtility.getConnection();
			PreparedStatement ps=conn.prepareStatement("insert image_login_temp_hod_password(index_id,image,username) values(?,?,?)");
						
			ps.setLong(1, imageIndexPojo.getIndex_id());
			ps.setString(2, imageIndexPojo.getImage());
			ps.setString(3, imageIndexPojo.getUsername());
			
			int a=ps.executeUpdate();
			
			if(a>0)
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

	@Override
	public boolean updatePassword(ImageIndexPojo imageIndexPojo) 
	{
		try 
		{
			conn=DBUtility.getConnection();
			PreparedStatement ps=conn.prepareStatement("update image_password_hod_registration_index set index_id=? where image=?");
						
			ps.setLong(1, imageIndexPojo.getIndex_id());
			ps.setString(2, imageIndexPojo.getImage());
			
			int a=ps.executeUpdate();
			
			if(a>0)
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

	@Override
	public List<ImageIndexPojo> getImageListById(long hodId) {
		try 
		{	
			conn=DBUtility.getConnection();
			
				PreparedStatement ps=conn.prepareStatement("select * from image_password_hod_registration_index  where image_id=?");
				
				ps.setLong(1, hodId);
				
				ResultSet rs=ps.executeQuery();
				List<ImageIndexPojo> imageList=new ArrayList<ImageIndexPojo>();
				
				ImageIndexPojo imageIndexPojo=new ImageIndexPojo();
				
				while(rs.next())
				{
					imageIndexPojo=new ImageIndexPojo();
					imageIndexPojo.setImage(rs.getString("image"));
					imageIndexPojo.setImage_id(rs.getLong("image_id"));
					imageIndexPojo.setIndex_id(rs.getLong("index_id"));
					
					imageList.add(imageIndexPojo);
				}
				return imageList;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public long loginHOD(String username) {
		try 
		{
			conn=DBUtility.getConnection();
			
			long userId=0;
			PreparedStatement ps=conn.prepareStatement("select * from hod_registration where username=?");
			
			ps.setString(1, username);

			ResultSet rs=ps.executeQuery();
			
			if(rs.next())
			{
				userId=rs.getLong("hod_id");
				return userId;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public GPSIRegistrationHODPojo getRegistrationHODPojoById(long hodId) 
	{
		try 
		{
			conn=DBUtility.getConnection();
			
			PreparedStatement ps=conn.prepareStatement("select * from hod_registration where hod_id=?");
			
			ps.setLong(1, hodId);
			
			ResultSet rs=ps.executeQuery();
			
			GPSIRegistrationHODPojo gpsiRegistrationHODPojo=new GPSIRegistrationHODPojo();
			
			if(rs.next())
			{
				gpsiRegistrationHODPojo.setId(rs.getLong("hod_id"));
				gpsiRegistrationHODPojo.setImage(rs.getString("image"));
				gpsiRegistrationHODPojo.setUsername(rs.getString("username"));
				gpsiRegistrationHODPojo.setRows(rs.getInt("rows"));
				gpsiRegistrationHODPojo.setCols(rs.getInt("cols"));
				gpsiRegistrationHODPojo.setShuffleImage(rs.getString("shuffle_image"));
				gpsiRegistrationHODPojo.setDeptName(rs.getString("deptName"));
			}
			return gpsiRegistrationHODPojo;
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean checkImageByFilename(String imagename, long index_id) 
	{
		try 
		{
			conn=DBUtility.getConnection();
			PreparedStatement ps=conn.prepareStatement("select * from  image_password_hod_registration_index where index_id=? and image=?");
						
			ps.setLong(1,index_id);
			ps.setString(2, imagename);
			
			ResultSet a=ps.executeQuery();
			
			if(a.next())
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

	@Override
	public boolean isUserExists(String username) 
	{
		try 
		{
			conn=DBUtility.getConnection();
			PreparedStatement ps=conn.prepareStatement("select * from hod_registration where username=?");
			
			ps.setString(1, username);
			
			ResultSet rs=ps.executeQuery();
			if(rs.next())
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

	@Override
	public List<TeacherUploadFile> getAllUploadFile(String deptName) {
		try 
		{
			conn=DBUtility.getConnection();
			PreparedStatement ps=conn.prepareStatement("select * from teacher_upload_file where deptName=?");
			ps.setString(1, deptName);
			System.out.println("DeptName of Teacher:::" +deptName);
			
			ResultSet rs=ps.executeQuery();
			List<TeacherUploadFile> teacherFilesList=new ArrayList<TeacherUploadFile>();
			
			while(rs.next())
			{
				TeacherUploadFile teacherUploadFile=new TeacherUploadFile();
				teacherUploadFile.setUploadFile(rs.getString("upload_file"));
				teacherUploadFile.setUploadId(rs.getLong("t_upload_id"));
				teacherUploadFile.setTeacherUsername(rs.getString("teacher_username"));
				teacherUploadFile.setUploadFilePath(rs.getString("upload_file_path"));
				teacherUploadFile.setUserType(rs.getString("userType"));
				
				teacherFilesList.add(teacherUploadFile);
			}
			return teacherFilesList;
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<StudentUploadFile> getAllUploadStudentFile(String deptName) {
		try 
		{
			conn=DBUtility.getConnection();
			PreparedStatement ps=conn.prepareStatement("select * from student_upload_file where deptName=?");
			ps.setString(1, deptName);
			System.out.println("DeptName of Student:::" +deptName);
			
			ResultSet rs=ps.executeQuery();
			List<StudentUploadFile> studentFilesList=new ArrayList<StudentUploadFile>();
			
			while(rs.next())
			{
				StudentUploadFile studentUploadFile=new StudentUploadFile();
				studentUploadFile.setUploadFile(rs.getString("upload_file"));
				studentUploadFile.setUploadId(rs.getLong("upload_id"));
				studentUploadFile.setStudentUsername(rs.getString("student_username"));
				studentUploadFile.setUploadFilePath(rs.getString("upload_file_path"));
				studentUploadFile.setUserType(rs.getString("userType"));
				
				studentFilesList.add(studentUploadFile);
			}
			return studentFilesList;
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<TeacherRequestedFiles> getAllRequestedFiles(long ownerId) 
	{
		try 
		{
			conn=DBUtility.getConnection();
			PreparedStatement ps=conn.prepareStatement("select * from teacher_requested_files where owner_id=? and status=?");
			
			ps.setLong(1, ownerId);
			ps.setString(2, "Requested");
			
			ResultSet rs=ps.executeQuery();
			List<TeacherRequestedFiles> teacherRequestList=new ArrayList<TeacherRequestedFiles>();
			while(rs.next())
			{
				TeacherRequestedFiles teacherRequestedFiles=new TeacherRequestedFiles();
				teacherRequestedFiles.setFile_name(rs.getString("file_name"));
				teacherRequestedFiles.setRequester_id(rs.getLong("requester_id"));
				teacherRequestedFiles.setUpload_id(rs.getLong("upload_id"));
				teacherRequestedFiles.setT_req_id(rs.getLong("t_req_id"));
				teacherRequestedFiles.setStatus(rs.getString("status"));
				
				teacherRequestList.add(teacherRequestedFiles);				
			}
			return teacherRequestList;
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean updateFileStatus(long fileId,long requesterId, String status)
	{
		conn=DBUtility.getConnection();
		try 
		{
				PreparedStatement pstm=conn.prepareStatement("update teacher_requested_files set status=? where requester_id=? and upload_id=? ");
				
				pstm.setString(1,status);
				pstm.setLong(2, requesterId);
				pstm.setLong(3, fileId);
				int z=pstm.executeUpdate();
				
				if(z>0)
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

	@Override
	public List<HODUploadFile> getAllOtherDeptFiles(String deptName) 
	{
		conn=DBUtility.getConnection();
		
		try 
		{
			PreparedStatement ps=conn.prepareStatement("select * from hod_upload_file where deptName != ?");
			ps.setString(1, deptName);
			
			ResultSet rs=ps.executeQuery();
			
			List<HODUploadFile> hodOtherDeptFileslist=new ArrayList<HODUploadFile>();
			while(rs.next())
			{
				HODUploadFile hodUploadFile=new HODUploadFile();
				hodUploadFile.setDeptName(rs.getString("deptName"));
				hodUploadFile.setHodId(rs.getLong("hod_id"));
				hodUploadFile.setHodUsername(rs.getString("hod_username"));
				hodUploadFile.setUploadFile(rs.getString("upload_file"));
				hodUploadFile.setUploadId(rs.getLong("h_upload_id"));
				
				hodOtherDeptFileslist.add(hodUploadFile);
			}
			return hodOtherDeptFileslist;
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean saveRequestedFiles(HODRequestedFiles hodRequestedFiles) 
	{
		conn=DBUtility.getConnection();
		try 
		{
			 	
		    PreparedStatement pstm=conn.prepareStatement("insert into hod_requested_files(requester_id,upload_id,file_name,owner_id,status,hod_username,deptName) values(?,?,?,?,?,?,?)");
		    pstm.setLong(1, hodRequestedFiles.getRequester_id());
			pstm.setLong(2, hodRequestedFiles.getUpload_id());
			pstm.setString(3, hodRequestedFiles.getFile_name());
			pstm.setLong(4, hodRequestedFiles.getOwner_id());
			pstm.setString(5,"Requested");
			pstm.setString(6, hodRequestedFiles.getHod_username());
			pstm.setString(7, hodRequestedFiles.getDeptName());

			
			int x=pstm.executeUpdate();
			
			System.out.println("x "+x);
			if(x>0)
			{
				return true;
			}
		} 
		catch (Exception e) {
		e.printStackTrace();
		
		}
		return false;
	}

	@Override
	public List<HODRequestedFiles> getAllhodOtherDeptRequestedFiles(long ownerId) 
	{
		try 
		{
			conn=DBUtility.getConnection();
			PreparedStatement ps=conn.prepareStatement("select * from hod_requested_files where owner_id=? and status=?");
			
			ps.setLong(1, ownerId);
			ps.setString(2, "Requested");
			
			ResultSet rs=ps.executeQuery();
			List<HODRequestedFiles> hodRequestList=new ArrayList<HODRequestedFiles>();
			while(rs.next())
			{
				HODRequestedFiles hodRequestedFiles=new HODRequestedFiles();
				
				hodRequestedFiles.setFile_name(rs.getString("file_name"));
				hodRequestedFiles.setRequester_id(rs.getLong("requester_id"));
				hodRequestedFiles.setUpload_id(rs.getLong("upload_id"));
				hodRequestedFiles.setH_req_id(rs.getLong("h_req_id"));
				hodRequestedFiles.setStatus(rs.getString("status"));
				hodRequestedFiles.setDeptName(rs.getString("deptName"));
				
				hodRequestList.add(hodRequestedFiles);				
			}
			return hodRequestList;
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean updateFileStatusHodOtherDept(long fileId, long requesterId,String status) 
	{
		conn=DBUtility.getConnection();
		try 
		{
				PreparedStatement pstm=conn.prepareStatement("update hod_requested_files set status=? where requester_id=? and upload_id=? ");
				
				pstm.setString(1,status);
				pstm.setLong(2, requesterId);
				pstm.setLong(3, fileId);
				int z=pstm.executeUpdate();
				
				if(z>0)
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

	@Override
	public List<HODRequestedFiles> getHODRequestedFilesListById(long requester_id) 
	{
		conn=DBUtility.getConnection();
		
		try
		{
			PreparedStatement pstm1 = conn.prepareStatement("select * from hod_requested_files as  rf inner join hod_upload_file as hf on rf.upload_id=hf.h_upload_id where requester_id=? and status=?");

			pstm1.setLong(1, requester_id);
			pstm1.setString(2, "Approve");
		    ResultSet rs = pstm1.executeQuery();
		  
		    List<HODRequestedFiles> approvedHODFilesList = new ArrayList<HODRequestedFiles>();
			
			while(rs.next()) 
			{
				HODRequestedFiles hodRequestedFiles=new HODRequestedFiles();
				
				hodRequestedFiles.setFile_name(rs.getString("file_name"));
				
				hodRequestedFiles.setH_req_id(rs.getLong("h_req_id"));
				hodRequestedFiles.setRequester_id(rs.getLong("requester_id"));
				hodRequestedFiles.setUpload_id(rs.getLong("upload_id"));
				
				approvedHODFilesList.add(hodRequestedFiles);
			}

			return approvedHODFilesList;
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		return null;
	}

	@Override
	public List<ImageIndexPojo> resetPassword(String username, String emailId) 
	{
		try 
		{
			conn = DBUtility.getConnection();
			PreparedStatement ps=conn.prepareStatement("select image, index_id from image_password_hod_registration_index where image_id=(select hod_id from hod_registration where username=? and emailId=?)");
			ps.setString(1, username);
			ps.setString(2, emailId);
			System.out.println("username123::::"+username);
			System.out.println("EmailId:::"+emailId);
			
			ResultSet rs=ps.executeQuery();

			List<ImageIndexPojo> imageIndexPojoList=new ArrayList<ImageIndexPojo>();
			
			while(rs.next())
			{
				ImageIndexPojo imageIndexPojo=new ImageIndexPojo();
				
				imageIndexPojo.setImage(rs.getString("image"));
				System.out.println("ImageCheck:::"+rs.getString("image"));
				imageIndexPojo.setIndex_id(rs.getLong("index_id"));
				System.out.println("ImageCheck:::"+rs.getLong("index_id"));
				
				imageIndexPojoList.add(imageIndexPojo);
				//System.out.println("imageIndexPojoList++++" +imageIndexPojoList);
			}
			return imageIndexPojoList;
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public GPSIRegistrationHODPojo getHODEmailUsername(String username) 
	{
		try 
		{
			conn=DBUtility.getConnection();
			
			PreparedStatement ps=conn.prepareStatement("select username, emailId from hod_registration where username=?");
			
			ps.setString(1, username);
			
			ResultSet rs=ps.executeQuery();
			
			GPSIRegistrationHODPojo gpsiRegistrationHODPojo=new GPSIRegistrationHODPojo();
			
			if(rs.next())
			{
				gpsiRegistrationHODPojo.setUsername(rs.getString("username"));
				gpsiRegistrationHODPojo.setEmailId(rs.getString("emailId"));
			}
			return gpsiRegistrationHODPojo;
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<PublicUploadFile> getPublicData(String username) 
	{
		try 
		{
			conn=DBUtility.getConnection();
			
			PreparedStatement ps=conn.prepareStatement("select upload_file, username, uploaded_by from upload_public_data where deptName = (select deptName from hod_registration where username=?) and view_user_type='HOD'");
			
			ps.setString(1, username);
			
			ResultSet rs=ps.executeQuery();
			
			List<PublicUploadFile> uploadList=new ArrayList<PublicUploadFile>();
			
			while(rs.next())
			{
				PublicUploadFile publicUpload=new PublicUploadFile();
				System.out.println("HELLLOOOOO");
				publicUpload.setUpload_file(rs.getString("upload_file"));
				publicUpload.setUsername(rs.getString("username"));
				publicUpload.setUploaded_by(rs.getString("uploaded_by"));
								
				uploadList.add(publicUpload);
				
				System.out.println("uploadList:::"+uploadList);
			}
			return uploadList;
		
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
