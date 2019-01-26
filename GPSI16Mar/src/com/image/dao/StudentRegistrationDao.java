package com.image.dao;

import java.util.List;

import com.image.pojo.GPSIRegistrationStudentPojo;
import com.image.pojo.ImageIndexPojo;
import com.image.pojo.PublicUploadFile;
import com.image.pojo.StudentRequestedFiles;
import com.image.pojo.StudentUploadFile;
import com.image.pojo.TeacherRequestedFiles;
import com.image.pojo.TeacherUploadFile;



public interface StudentRegistrationDao 
{
	
	//SaveTempPassword
	public boolean savePassword(ImageIndexPojo imageIndexPojo);
	
	public boolean updatePassword(ImageIndexPojo imageIndexPojo);
	
	//imageListByID
	public List getImageListById(long studentId);
	//login through username
	public long loginStudent(String username);
	//got the whole object to set all the attributes
	public GPSIRegistrationStudentPojo getRegistrationStudentPojoById(long studentId);
	
	public boolean checkImageByFilename(String imagename,long index_id);
	
	
	 public boolean isUserExist(String userName);
	 
	 
	 public List<TeacherUploadFile> getAllUploadFile(String deptName);
	
	
	 public boolean saveRequestedFiles(StudentRequestedFiles studentRequestedFiles);
	 
	 public List<StudentRequestedFiles> getRequestedFilesListById(long requester_id);
	 
	 //ResetPassword
	 public List<ImageIndexPojo> resetPassword(String username,String emailId);
	 
	 public GPSIRegistrationStudentPojo getStudentEmailUsername(String username);
	 
	 
	 //Update Student Registration Form
	 public List<GPSIRegistrationStudentPojo> registrationUpdateList(long studentId);
	 
	 public boolean updateRegistration(String semester,long studentId);
	 
	 
	//view public upload data
	 
	 public List<PublicUploadFile> getPublicData(String username);
}
