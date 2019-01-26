package com.image.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.image.pojo.GPSIRegistrationStudentPojo;
import com.image.pojo.GPSIRegistrationTeacherPojo;
import com.image.pojo.HODUploadFile;
import com.image.pojo.ImageIndexPojo;
import com.image.pojo.PublicUploadFile;
import com.image.pojo.StudentRequestedFiles;
import com.image.pojo.StudentUploadFile;
import com.image.pojo.TeacherRequestedFiles;
import com.image.utility.DBUtility;

public class TeacherRegistrationDaoImpl implements TeacherRegistrationDao
{
	Connection conn=null;

	@Override
	public boolean savePassword(ImageIndexPojo imageIndexPojo) {
		try 
		{
			conn=DBUtility.getConnection();
			PreparedStatement ps=conn.prepareStatement("insert image_login_temp_teacher_password(index_id,image,username) values(?,?,?)");
			
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
			PreparedStatement ps=conn.prepareStatement("update image_password_teacher_registration_index set index_id=? where image=?");
			
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
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<ImageIndexPojo> getImageListById(long teacherId) {
		try 
		{
			conn=DBUtility.getConnection();
			PreparedStatement ps=conn.prepareStatement("select * from image_password_teacher_registration_index where image_id=?");
			ps.setLong(1, teacherId);
			
			ResultSet rs=ps.executeQuery();
			List<ImageIndexPojo> imageList=new ArrayList<ImageIndexPojo>();
			
			while(rs.next())
			{
				ImageIndexPojo imageIndexPojo=new ImageIndexPojo();
				imageIndexPojo.setImage(rs.getString("image"));
				imageIndexPojo.setImage_id(rs.getLong("image_id"));
				imageIndexPojo.setIndex_id(rs.getLong("index_id"));
				
				imageList.add(imageIndexPojo);
			}
			return imageList;
			
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public long loginTeacher(String username) {
		try 
		{
			conn=DBUtility.getConnection();
			long userId=0;
			
			PreparedStatement ps=conn.prepareStatement("select * from teacher_registration where username=?");
			ps.setString(1, username);
			
			ResultSet rs=ps.executeQuery();
			
			if(rs.next())
			{
				userId=rs.getLong("teacher_id");
				return userId;
			}		
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public boolean checkImageByFilename(String imagename, long index_id) 
	{
		try 
		{
			conn=DBUtility.getConnection();
			PreparedStatement ps=conn.prepareStatement("select * from image_password_teacher_registration_index where index_id=? and image=?");
			
			ps.setLong(1, index_id);
			ps.setString(2, imagename);
			
			ResultSet x=ps.executeQuery();
			
			if(x.next())
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
	public GPSIRegistrationTeacherPojo getRegistrationTeacherPojoById(long teacherId) 
	{
		try 
		{
			conn=DBUtility.getConnection();
			PreparedStatement ps=conn.prepareStatement("select * from teacher_registration where teacher_id=?");
			
			ps.setLong(1, teacherId);
			
			ResultSet rs=ps.executeQuery();
			
			GPSIRegistrationTeacherPojo gpsiRegistrationTeacherPojo=new GPSIRegistrationTeacherPojo();
			
			if(rs.next())
			{
				gpsiRegistrationTeacherPojo.setId(rs.getLong("teacher_id"));
				gpsiRegistrationTeacherPojo.setImage(rs.getString("image"));
				gpsiRegistrationTeacherPojo.setUsername(rs.getString("username"));
				gpsiRegistrationTeacherPojo.setRows(rs.getInt("rows"));
				gpsiRegistrationTeacherPojo.setCols(rs.getInt("cols"));
				gpsiRegistrationTeacherPojo.setShuffleImage(rs.getString("shuffle_image"));
				gpsiRegistrationTeacherPojo.setDeptName(rs.getString("deptName"));
			}
			return gpsiRegistrationTeacherPojo;
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean isUserExists(String userName) 
	{
		try 
		{
			conn=DBUtility.getConnection();
			PreparedStatement ps=conn.prepareStatement("select * from teacher_registration where username=?");
			ps.setString(1, userName);
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
	public List<StudentUploadFile> getAllUploadFile(String deptName) 
	{
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
	public List<HODUploadFile> getAllHODUploadFile(String deptName) 
	{
		try 
		{
			conn=DBUtility.getConnection();
			PreparedStatement ps=conn.prepareStatement("select * from hod_upload_file where deptName=?");
			ps.setString(1, deptName);
			System.out.println("DeptName of HOD:::" +deptName);
			
			ResultSet rs=ps.executeQuery();
			List<HODUploadFile> hodFilesList=new ArrayList<HODUploadFile>();
			
			while(rs.next())
			{
				HODUploadFile hodUploadFile=new HODUploadFile();
				
				hodUploadFile.setUploadFile(rs.getString("upload_file"));
				hodUploadFile.setUploadId(rs.getLong("h_upload_id"));
				hodUploadFile.setHodId(rs.getLong("hod_id"));
				hodUploadFile.setHodUsername(rs.getString("hod_username"));
				hodUploadFile.setUploadFilePath(rs.getString("upload_file_path"));
				hodUploadFile.setUserType(rs.getString("userType"));
				
				hodFilesList.add(hodUploadFile);
			}
			return hodFilesList;
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean saveRequestedFiles(TeacherRequestedFiles teacherRequestedFiles) 
	{
		conn=DBUtility.getConnection();
		try 
		{
			 	
		    PreparedStatement pstm=conn.prepareStatement("insert into teacher_requested_files(requester_id,upload_id,file_name,owner_id,status,teacher_username) values(?,?,?,?,?,?)");
		    pstm.setLong(1, teacherRequestedFiles.getRequester_id());
			pstm.setLong(2, teacherRequestedFiles.getUpload_id());
			pstm.setString(3, teacherRequestedFiles.getFile_name());
			pstm.setLong(4, teacherRequestedFiles.getOwner_id());
			pstm.setString(5,"Requested");
			pstm.setString(6, teacherRequestedFiles.getTeacher_username());

			
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
	public List<TeacherRequestedFiles> getRequestedFilesListById(long requester_id) 
	{
		conn=DBUtility.getConnection();
		
		try
		{
			PreparedStatement pstm1 = conn.prepareStatement("select * from teacher_requested_files as  rf inner join hod_upload_file as hf on rf.upload_id=hf.h_upload_id where requester_id=? and status=?");//select * from teacher_requested_files where requester_id=? and status=?");
			pstm1.setLong(1, requester_id);
			pstm1.setString(2, "Approve");
		    ResultSet rs = pstm1.executeQuery();
		  
		    List<TeacherRequestedFiles> approvedFilesList = new ArrayList<TeacherRequestedFiles>();
			
			while(rs.next()) 
			{
				TeacherRequestedFiles teacherRequestedFiles=new TeacherRequestedFiles();
				
				teacherRequestedFiles.setFile_name(rs.getString("file_name"));
				
				teacherRequestedFiles.setT_req_id(rs.getLong("t_req_id"));
				teacherRequestedFiles.setRequester_id(rs.getLong("requester_id"));
				teacherRequestedFiles.setUpload_id(rs.getLong("upload_id"));
				teacherRequestedFiles.setUpload_url(rs.getString("upload_file_path"));
				approvedFilesList.add(teacherRequestedFiles);
			}

			return approvedFilesList;
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		return null;
	}

	@Override
	public List<StudentRequestedFiles> getAllStudentRequestedFiles(long ownerId) 
	{
		try 
		{
			try 
			{
				conn=DBUtility.getConnection();
				PreparedStatement ps=conn.prepareStatement("select * from student_requested_files where owner_id=? and status=?");
				
				ps.setLong(1, ownerId);
				ps.setString(2, "Requested");
				
				ResultSet rs=ps.executeQuery();
				List<StudentRequestedFiles> studentRequestList=new ArrayList<StudentRequestedFiles>();
				while(rs.next())
				{
					StudentRequestedFiles studentRequestedFiles=new StudentRequestedFiles();
					studentRequestedFiles.setFile_name(rs.getString("file_name"));
					studentRequestedFiles.setRequester_id(rs.getLong("requester_id"));
					studentRequestedFiles.setUpload_id(rs.getLong("upload_id"));
					studentRequestedFiles.setS_req_id(rs.getLong("s_req_id"));
					studentRequestedFiles.setStatus(rs.getString("status"));
					
					studentRequestList.add(studentRequestedFiles);				
				}
				return studentRequestList;
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean updateFileStatus(long fileId, long requesterId, String status) 
	{
		conn=DBUtility.getConnection();
		try 
		{
				PreparedStatement pstm=conn.prepareStatement("update student_requested_files set status=? where requester_id=? and upload_id=? ");
				
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
	public List<ImageIndexPojo> resetPassword(String username, String emailId) 
	{
		try 
		{
			conn = DBUtility.getConnection();
			PreparedStatement ps=conn.prepareStatement("select image, index_id from image_password_teacher_registration_index where image_id=(select teacher_id from teacher_registration where username=? and emailId=?)");
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
	public GPSIRegistrationTeacherPojo getTeacherEmailUsername(String username) 
	{
		try 
		{
			conn=DBUtility.getConnection();
			
			PreparedStatement ps=conn.prepareStatement("select username, emailId from teacher_registration where username=?");
			
			ps.setString(1, username);
			
			ResultSet rs=ps.executeQuery();
			
			GPSIRegistrationTeacherPojo gpsiRegistrationTeacherPojo=new GPSIRegistrationTeacherPojo();
			
			if(rs.next())
			{
				gpsiRegistrationTeacherPojo.setUsername(rs.getString("username"));
				gpsiRegistrationTeacherPojo.setEmailId(rs.getString("emailId"));
			}
			return gpsiRegistrationTeacherPojo;
		}
		catch (Exception e) {
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
			
			PreparedStatement ps=conn.prepareStatement("select upload_file, username, uploaded_by from upload_public_data where deptName = (select deptName from teacher_registration where username=?) and view_user_type='Faculty'");
			
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
			}
			return uploadList;
		
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
