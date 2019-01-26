package com.image.dao;

import java.util.List;

import com.image.pojo.GPSIRegistrationHODPojo;
import com.image.pojo.GPSIRegistrationTeacherPojo;
import com.image.pojo.HODRequestedFiles;
import com.image.pojo.HODUploadFile;
import com.image.pojo.PublicUploadFile;
import com.image.pojo.StudentRequestedFiles;
import com.image.pojo.TeacherRequestedFiles;
import com.image.pojo.ImageIndexPojo;
import com.image.pojo.StudentUploadFile;
import com.image.pojo.TeacherUploadFile;



public interface HODRegistrationDao {
	
			//SaveTempPassword
			public boolean savePassword(ImageIndexPojo imageIndexPojo);
			
			public boolean updatePassword(ImageIndexPojo imageIndexPojo);
			
			//imageListByID
			public List<ImageIndexPojo> getImageListById(long hodId);
			
			
			//login through username
			public long loginHOD(String username);
			
			
			//got the whole object to set all the attributes
			public GPSIRegistrationHODPojo getRegistrationHODPojoById(long hodId);
			
			public boolean checkImageByFilename(String imagename,long index_id);
			
			public boolean isUserExists(String username);
			
			public List<TeacherUploadFile> getAllUploadFile(String deptName);
			
			public List<StudentUploadFile> getAllUploadStudentFile(String deptName);
			
			public List<TeacherRequestedFiles> getAllRequestedFiles(long ownerId);
			
			public boolean updateFileStatus(long fileId,long requesterId,String status);
			
			//HOD Other Department
			public List<HODUploadFile> getAllOtherDeptFiles(String deptName);
			
			public boolean saveRequestedFiles(HODRequestedFiles hodRequestedFiles);
			
			public List<HODRequestedFiles> getAllhodOtherDeptRequestedFiles(long ownerId);
			
			public boolean updateFileStatusHodOtherDept(long fileId,long requesterId,String status);
			
			//ViewapprovedFilesList
			public List<HODRequestedFiles> getHODRequestedFilesListById(long requester_id);
		
			
			//ResetPassword
			 public List<ImageIndexPojo> resetPassword(String username,String emailId);
			 
			 public GPSIRegistrationHODPojo getHODEmailUsername(String username);
			 
			 
			//view public upload data
			 
			 public List<PublicUploadFile> getPublicData(String username);
}
