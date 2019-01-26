package com.image.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.image.dao.TeacherRegistrationDao;
import com.image.dao.TeacherRegistrationDaoImpl;
import com.image.pojo.GPSIRegistrationStudentPojo;
import com.image.pojo.GPSIRegistrationTeacherPojo;
import com.image.pojo.HODUploadFile;
import com.image.pojo.ImageIndexPojo;
import com.image.pojo.PublicUploadFile;
import com.image.pojo.StudentRequestedFiles;
import com.image.pojo.StudentUploadFile;
import com.image.pojo.TeacherRequestedFiles;
import com.image.pojo.TeacherUploadFile;

/**
 * Servlet implementation class TeacherLoginServlet
 */
@WebServlet("/TeacherLoginServlet")
public class TeacherLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeacherLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
			
		String action=request.getParameter("action");
		TeacherRegistrationDao teacherRegistrationDao=new TeacherRegistrationDaoImpl();
		//GPSIRegistrationTeacherPojo gpsiRegistrationTeacherPojo=new GPSIRegistrationTeacherPojo();
		
		if(action!=null && action.equalsIgnoreCase("RequestedFiles"))
		{
			long teacherId=(Long)session.getAttribute("teacherId");
			System.out.println("Session: TeacherId::"+teacherId);
			
			String teacher_username=(String)session.getAttribute("username");
			
			
			long file_id=Long.parseLong(request.getParameter("fileId"));
			System.out.println("File_Id::" +file_id);
			String file_name=request.getParameter("filename");
			System.out.println("Name::" +file_name);
			long owner_id=Long.parseLong(request.getParameter("owner_id"));
			session.setAttribute("owner_id", owner_id);
			System.out.println("Owner::" +owner_id);
			
		
			TeacherRequestedFiles teacherRequestedFiles=new TeacherRequestedFiles();
			
			teacherRequestedFiles.setFile_name(file_name);
			teacherRequestedFiles.setOwner_id(owner_id);
			teacherRequestedFiles.setRequester_id(teacherId);
			teacherRequestedFiles.setUpload_id(file_id);
			teacherRequestedFiles.setTeacher_username(teacher_username);
			
			boolean b=teacherRegistrationDao.saveRequestedFiles(teacherRequestedFiles);
			
			if(b)
			{
				response.sendRedirect("TeacherLoginServlet");
			}
		}
		
		else if(action!=null && action.equalsIgnoreCase("StudentRequestedFilesList"))
		{
			long ownerId=(Long)session.getAttribute("teacherId");
			System.out.println("SEssionownerId::::"+ownerId);
			List<StudentRequestedFiles> studentRequestList=teacherRegistrationDao.getAllStudentRequestedFiles(ownerId);
			session.setAttribute("studentRequestList", studentRequestList);
			response.sendRedirect("studentRequestedFilesList.jsp");
		}
		
		//Accept and Reject For Student's requested files
		else if(action!=null && action.equalsIgnoreCase("UpdateStudentRequestFileStatus"))
			{
					 long user_id=(Long)session.getAttribute("teacherId");
					 
				     String status=request.getParameter("status");
				     
				    

				     long fileId=0;
				     int requesterId=0;
				     String file_name=request.getParameter("name");
				     if(request.getParameter("fileId")!=null)
				     {
						     fileId=Long.parseLong(request.getParameter("fileId"));
						     requesterId=Integer.parseInt(request.getParameter("requester_id"));
						     
						     System.out.println("requester_id "+requesterId);
						     
						     teacherRegistrationDao.updateFileStatus(fileId, requesterId, status);				     

						     if(!status.equals("Reject"))
						     {
						    	 StudentUploadFile studentUploadFile= new StudentUploadFile();
						    	 
						    	 studentUploadFile.setStudentId(requesterId);
						    	 
						    	 StudentRequestedFiles studentRequestedFiles=new StudentRequestedFiles();
						    	 
						    	 studentRequestedFiles.setOwner_id(user_id);  //teacherId
						    	 studentRequestedFiles.setFile_name(file_name);

						    	 int id=Integer.parseInt(request.getParameter("id"));
						    
						     }	
						     response.sendRedirect("TeacherLoginServlet?action=StudentRequestedFilesList");
				     }
		 }
		
		else if(action!=null && action.equalsIgnoreCase("ResetPassword"))
		{
			String username=request.getParameter("userName");
			String emailId=request.getParameter("emailid");
			
			System.out.println("usernameServlet::"+username);
			System.out.println("emailServlet::"+emailId);
			List<ImageIndexPojo> imageIndexPojoList=teacherRegistrationDao.resetPassword(username, emailId);
			session.setAttribute("imageIndexPojoList", imageIndexPojoList);
			System.out.println("imageIndexPojoListServlet:::"+imageIndexPojoList);
			
			
			GPSIRegistrationTeacherPojo gpsiteacherPojo=new GPSIRegistrationTeacherPojo();
			gpsiteacherPojo=teacherRegistrationDao.getTeacherEmailUsername(username);
			String teacheruserName=gpsiteacherPojo.getUsername();
			String teacheremailId=gpsiteacherPojo.getEmailId();
			System.out.println("UserName::::"+teacheruserName);
			System.out.println("EmailCheck:::::"+teacheremailId);
			
			
			if(username.equals(teacheruserName) && emailId.equals(teacheremailId))
			{

				System.out.println("CheckConditionTrue:::::::");
				response.sendRedirect("getResetTeacherPassword.jsp");
			}
			else
			{
				System.out.println("CheckConditionFalse:::::::");
				request.setAttribute("error", "Invalid Input");
		    	RequestDispatcher rd=request.getRequestDispatcher("/teacherForgotPassword.jsp");
		    	rd.forward(request, response);
			}
			
		}
		
		else if(action!=null && action.equalsIgnoreCase("ViewPublicData"))
		{
			String username=(String)session.getAttribute("username");
			System.out.println("UserNameCheckServlet::"+username);
			
			List<PublicUploadFile> publicuploadList=teacherRegistrationDao.getPublicData(username);
			session.setAttribute("publicuploadList", publicuploadList);
			System.out.println("uploadListServlet:::::"+publicuploadList);
			response.sendRedirect("facultyviewpublicdata.jsp");
		}
		
		
		else
		{
			String deptName=(String)session.getAttribute("deptName");
			List<StudentUploadFile> studentFilesList=teacherRegistrationDao.getAllUploadFile(deptName);
			session.setAttribute("studentFilesList", studentFilesList);
			System.out.println("studentUploadFilesList::::"+studentFilesList);
			
			List<HODUploadFile> hodFilesList=teacherRegistrationDao.getAllHODUploadFile(deptName);
			session.setAttribute("hodFilesList", hodFilesList);
			
			
			long teacherId=(Long)session.getAttribute("teacherId");
			List<TeacherRequestedFiles> approvedFilesList=teacherRegistrationDao.getRequestedFilesListById(teacherId);
			session.setAttribute("approvedFilesList", approvedFilesList);
			System.out.println("ApprovListttt::::"+approvedFilesList);
			response.sendRedirect("studenthodUploadedFileList.jsp");
		}
		

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();

		GPSIRegistrationTeacherPojo gpsiRegistrationTeacherPojo=new GPSIRegistrationTeacherPojo();
		
		String username=request.getParameter("username");
		session.setAttribute("username", username);
		
		//System.out.println("action :"+action);
		
		TeacherRegistrationDao teacherRegistrationDao=new TeacherRegistrationDaoImpl();
		
		gpsiRegistrationTeacherPojo.setUsername(username);
		
		long userId=teacherRegistrationDao.loginTeacher(username);
		
		
		gpsiRegistrationTeacherPojo=teacherRegistrationDao.getRegistrationTeacherPojoById(userId);
		session.setAttribute("gpsiRegistrationTeacherPojo", gpsiRegistrationTeacherPojo);
		long teacherId=gpsiRegistrationTeacherPojo.getId();
		session.setAttribute("teacherId", teacherId);
		//System.out.println("Teacher:::"+teacherId);
		String deptName=gpsiRegistrationTeacherPojo.getDeptName();
		session.setAttribute("deptName", deptName);
		String shuffleImage=gpsiRegistrationTeacherPojo.getShuffleImage();
		session.setAttribute("shuffleImage", shuffleImage);
		System.out.println("ShuffleImage:::::" +shuffleImage);
		
		//System.out.println("userId :"+userId);
		if(userId>0)
		{
			List<ImageIndexPojo> imageList=teacherRegistrationDao.getImageListById(userId);
			session.setAttribute("imageList", imageList);
			System.out.println("imageList "+imageList.size());
			response.sendRedirect("getTeacherPassword.jsp");
		}
		else
		{
			//Incorrect UserName
			request.setAttribute("error", "Invalid Username or Password");
	    	RequestDispatcher rd=request.getRequestDispatcher("/teacherLoginPage.jsp");
	    	rd.forward(request, response);
			//response.sendRedirect("teacherLogin.jsp");
		}
		
		
	}

}
