package com.image.dao;

import java.util.List;

import com.image.pojo.GPSIRegistrationStudentPojo;
import com.image.pojo.GPSIRegistrationTeacherPojo;
import com.image.pojo.HODUploadFile;
import com.image.pojo.ImageIndexPojo;
import com.image.pojo.PublicUploadFile;
import com.image.pojo.StudentRequestedFiles;
import com.image.pojo.StudentUploadFile;
import com.image.pojo.TeacherRequestedFiles;


public interface TeacherRegistrationDao 
{
		//SaveTempPassword
		public boolean savePassword(ImageIndexPojo imageIndexPojo);
		
		public boolean updatePassword(ImageIndexPojo imageIndexPojo);
		
		//imageListByID
		public List<ImageIndexPojo> getImageListById(long teacherId);
		
		
		//login through username
		public long loginTeacher(String username);
		
		
		//got the whole object to set all the attributes
		public GPSIRegistrationTeacherPojo getRegistrationTeacherPojoById(long teacherId);
		
		public boolean checkImageByFilename(String imagename,long index_id);
		
		public boolean isUserExists(String userName);
		
		public List<StudentUploadFile> getAllUploadFile(String deptName);
		
		public List<HODUploadFile> getAllHODUploadFile(String deptName);
		
		
		public boolean saveRequestedFiles(TeacherRequestedFiles teacherRequestedFiles);
		
		
		//ViewapprovedFilesList
		public List<TeacherRequestedFiles> getRequestedFilesListById(long requester_id);
		
		
		public List<StudentRequestedFiles> getAllStudentRequestedFiles(long ownerId);
		
		public boolean updateFileStatus(long fileId,long requesterId,String status);
		
		
		//ResetPassword
		 public List<ImageIndexPojo> resetPassword(String username,String emailId);
		 
		 public GPSIRegistrationTeacherPojo getTeacherEmailUsername(String username);
		 
		 
		//view public upload data
		 
		 public List<PublicUploadFile> getPublicData(String username);
		
}
