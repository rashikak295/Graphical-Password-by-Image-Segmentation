package com.image.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;















import com.image.pojo.GPSIRegistrationStudentPojo;
import com.image.pojo.ImageIndexPojo;
import com.image.pojo.PublicUploadFile;
import com.image.pojo.StudentRequestedFiles;
import com.image.pojo.StudentUploadFile;
import com.image.pojo.TeacherRequestedFiles;
import com.image.pojo.TeacherUploadFile;
import com.image.utility.DBUtility;


public class StudentRegistrationDaoImpl implements StudentRegistrationDao
{

	Connection conn=null;

	@Override
	public boolean savePassword(ImageIndexPojo imageIndexPojo) 
	{
		
		try 
		{
			conn=DBUtility.getConnection();
			PreparedStatement ps=conn.prepareStatement("insert image_login_temp_student_password(index_id,image,username) values(?,?,?)");
						
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
			PreparedStatement ps=conn.prepareStatement("update image_password_student_registration_index set index_id=? where image=?");
						
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
	public List<ImageIndexPojo> getImageListById(long studentId) {
		try 
		{	
			conn=DBUtility.getConnection();
			
				PreparedStatement ps=conn.prepareStatement("select * from image_password_student_registration_index where image_id=?");
				
				ps.setLong(1, studentId);
				
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
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}


	@Override
	public long loginStudent(String username) 
	{
		try 
		{
			conn=DBUtility.getConnection();
			
			long userId=0;
			PreparedStatement ps=conn.prepareStatement("select * from student_registration where username=?");
			
			ps.setString(1, username);

			ResultSet rs=ps.executeQuery();
			
			if(rs.next())
			{
				userId=rs.getLong("student_id");
				return userId;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public GPSIRegistrationStudentPojo getRegistrationStudentPojoById(long studentId) 
	{
		try 
		{
			conn=DBUtility.getConnection();
			
			PreparedStatement ps=conn.prepareStatement("select * from student_registration where student_id=?");
			
			ps.setLong(1, studentId);
			
			ResultSet rs=ps.executeQuery();
			
			GPSIRegistrationStudentPojo gpsiRegistrationStudentPojo=new GPSIRegistrationStudentPojo();
			
			if(rs.next())
			{
				gpsiRegistrationStudentPojo.setId(rs.getLong("student_id"));
				gpsiRegistrationStudentPojo.setImage(rs.getString("image"));
				gpsiRegistrationStudentPojo.setUsername(rs.getString("username"));
				gpsiRegistrationStudentPojo.setRows(rs.getInt("rows"));
				gpsiRegistrationStudentPojo.setCols(rs.getInt("cols"));
				gpsiRegistrationStudentPojo.setShuffleImage(rs.getString("shuffle_image"));
				gpsiRegistrationStudentPojo.setDeptName(rs.getString("deptName"));
				gpsiRegistrationStudentPojo.setSemesterWise(rs.getString("semesterWise"));
			}
			return gpsiRegistrationStudentPojo;
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}


	@Override
	public boolean checkImageByFilename(String imagename, long index_id) {
		try 
		{
			conn=DBUtility.getConnection();
			PreparedStatement ps=conn.prepareStatement("select * from  image_password_student_registration_index where index_id=? and image=?");
						
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
	public boolean isUserExist(String userName) 
	{
		try
		{
			conn=DBUtility.getConnection();
			PreparedStatement ps = conn.prepareStatement("select * from student_registration where username=?");
			ps.setString(1, userName);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}


	@Override
	public List<TeacherUploadFile> getAllUploadFile(String deptName) 
	{
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
				teacherUploadFile.setTeacherId(rs.getLong("teacher_id"));
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
	public boolean saveRequestedFiles(StudentRequestedFiles studentRequestedFiles) 
	{
		conn=DBUtility.getConnection();
		try 
		{
			 	
		    PreparedStatement pstm=conn.prepareStatement("insert into student_requested_files(requester_id,upload_id,file_name,owner_id,status,student_username) values(?,?,?,?,?,?)");
		    pstm.setLong(1, studentRequestedFiles.getRequester_id());
			pstm.setLong(2, studentRequestedFiles.getUpload_id());
			pstm.setString(3, studentRequestedFiles.getFile_name());
			pstm.setLong(4, studentRequestedFiles.getOwner_id());
			pstm.setString(5,"Requested");
			pstm.setString(6, studentRequestedFiles.getStudent_username());

			
			int x=pstm.executeUpdate();
			
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


	//Files Approved By Teacher List
	@Override
	public List<StudentRequestedFiles> getRequestedFilesListById(long requester_id) 
	{
		conn=DBUtility.getConnection();
		
		try
		{
			PreparedStatement pstm1 = conn.prepareStatement("select * from student_requested_files as  rf inner join teacher_upload_file as tf on rf.upload_id=tf.t_upload_id where requester_id=? and status=?");
			//select * from student_requested_files where requester_id=? and status=?");
			pstm1.setLong(1, requester_id);
			pstm1.setString(2, "Approve");
		    ResultSet rs = pstm1.executeQuery();
		  
		    List<StudentRequestedFiles> teacherapprovedFilesList = new ArrayList<StudentRequestedFiles>();
			
			while(rs.next()) 
			{
				StudentRequestedFiles studentRequestedFiles=new StudentRequestedFiles();
				
				studentRequestedFiles.setFile_name(rs.getString("file_name"));
				
				studentRequestedFiles.setS_req_id(rs.getLong("s_req_id"));
				studentRequestedFiles.setRequester_id(rs.getLong("requester_id"));
				studentRequestedFiles.setUpload_id(rs.getLong("upload_id"));
				studentRequestedFiles.setUpload_url(rs.getString("upload_file_path"));
				teacherapprovedFilesList.add(studentRequestedFiles);
			}

			return teacherapprovedFilesList;
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		return null;
	}


	@Override
	public List<ImageIndexPojo> resetPassword(String username,String emailId) 
	{
		try 
		{
			conn = DBUtility.getConnection();
			PreparedStatement ps=conn.prepareStatement("select image, index_id from image_password_student_registration_index where image_id=(select student_id from student_registration where username=? and emailId=?)");
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
	public GPSIRegistrationStudentPojo getStudentEmailUsername(String username) 
	{
		try 
		{
			conn=DBUtility.getConnection();
			
			PreparedStatement ps=conn.prepareStatement("select username, emailId from student_registration where username=?");
			
			ps.setString(1, username);
			
			ResultSet rs=ps.executeQuery();
			
			GPSIRegistrationStudentPojo gpsiRegistrationStudentPojo=new GPSIRegistrationStudentPojo();
			
			if(rs.next())
			{
				//gpsiRegistrationStudentPojo.setId(rs.getLong("student_id"));
				gpsiRegistrationStudentPojo.setUsername(rs.getString("username"));
				gpsiRegistrationStudentPojo.setEmailId(rs.getString("emailId"));
			}
			return gpsiRegistrationStudentPojo;
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}


	@Override
	public List<GPSIRegistrationStudentPojo> registrationUpdateList(long studentId) 
	{
		try 
		{
			conn=DBUtility.getConnection();
			PreparedStatement ps=conn.prepareStatement("select * from student_registration where student_id=?");
			
			ps.setLong(1, studentId);
			
			ResultSet rs=ps.executeQuery();
			
			List<GPSIRegistrationStudentPojo> registerList=new ArrayList<GPSIRegistrationStudentPojo>();
			
			while(rs.next())
			{
				GPSIRegistrationStudentPojo gpsiRegistrationStudentPojo=new GPSIRegistrationStudentPojo();
				
				gpsiRegistrationStudentPojo.setId(rs.getLong("student_id"));
				gpsiRegistrationStudentPojo.setUsername(rs.getString("username"));
				gpsiRegistrationStudentPojo.setAddress(rs.getString("address"));
				gpsiRegistrationStudentPojo.setPhoneNo(rs.getString("phoneNo"));
				gpsiRegistrationStudentPojo.setDeptName(rs.getString("deptName"));
				gpsiRegistrationStudentPojo.setEmailId(rs.getString("emailId"));
				gpsiRegistrationStudentPojo.setRollNo(rs.getLong("rollNo"));
				gpsiRegistrationStudentPojo.setSemesterWise(rs.getString("semesterWise"));
				gpsiRegistrationStudentPojo.setYearOfJoining(rs.getString("yearOfJoining"));
				gpsiRegistrationStudentPojo.setYearOfCompletion(rs.getString("yearOfCompletion"));
				gpsiRegistrationStudentPojo.setRows(rs.getInt("rows"));
				gpsiRegistrationStudentPojo.setCols(rs.getInt("cols"));
				gpsiRegistrationStudentPojo.setShuffleImage(rs.getString("shuffle_image"));
				gpsiRegistrationStudentPojo.setImage(rs.getString("image"));
				
				registerList.add(gpsiRegistrationStudentPojo);
			}
			return registerList;
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}


	@Override
	public boolean updateRegistration(String semester,long studentId) 
	{
		try 
		{
			conn=DBUtility.getConnection();
			
			PreparedStatement ps=conn.prepareStatement("update student_registration set semesterWise=? where student_id=?");
			
			ps.setString(1, semester);
			ps.setLong(2, studentId);
			
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
	public List<PublicUploadFile> getPublicData(String username) 
	{
		try 
		{
			conn=DBUtility.getConnection();
			
			PreparedStatement ps=conn.prepareStatement("select upload_file, username, uploaded_by from upload_public_data where deptName = (select deptName from student_registration where username=?) and semesterWise = (select semesterWise from student_registration where username=?) and view_user_type='Student'");
			
			ps.setString(1, username);
			ps.setString(2, username);
			
			ResultSet rs=ps.executeQuery();
			System.out.println("ResultSet::::"+rs);
			
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


	/*@Override
	public boolean loginStudent(long studentId) {
		
		try 
		{
			conn=DBUtility.getConnection();
			PreparedStatement ps=conn.prepareStatement("select * from student_registration where student_id=?");
			
			ps.setLong(1,studentId);
			
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				
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
*/

	
