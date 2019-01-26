package com.image.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.image.dao.StudentRegistrationDao;
import com.image.dao.StudentRegistrationDaoImpl;
import com.image.dao.TeacherRegistrationDao;
import com.image.dao.TeacherRegistrationDaoImpl;
import com.image.pojo.GPSIRegistrationStudentPojo;
import com.image.pojo.ImageIndexPojo;
import com.image.pojo.PublicUploadFile;
import com.image.pojo.StudentRequestedFiles;
import com.image.pojo.StudentUploadFile;
import com.image.pojo.TeacherRequestedFiles;
import com.image.pojo.TeacherUploadFile;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/StudentLoginServlet")
public class StudentLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session=request.getSession();
		String action=request.getParameter("action");
		StudentRegistrationDao studentRegistrationDao=new StudentRegistrationDaoImpl();
		
		
		if(action!=null && action.equalsIgnoreCase("RequestedFiles"))
		{
			long studentId=(Long)session.getAttribute("studentId");
			System.out.println("Session: TeacherId::"+studentId);
			
			String student_username=(String)session.getAttribute("username");
			
			
			long file_id=Long.parseLong(request.getParameter("fileId"));
			System.out.println("File_Id::" +file_id);
			String file_name=request.getParameter("filename");
			System.out.println("Name::" +file_name);
			long owner_id=Integer.parseInt(request.getParameter("owner_id"));
			session.setAttribute("owner_id", owner_id);
			System.out.println("Owner::" +owner_id);
			
			StudentRequestedFiles studentRequestedFiles = new StudentRequestedFiles();
			
			studentRequestedFiles.setFile_name(file_name);
			studentRequestedFiles.setOwner_id(owner_id);
			studentRequestedFiles.setRequester_id(studentId);
			studentRequestedFiles.setUpload_id(file_id);
			studentRequestedFiles.setStudent_username(student_username);
			
			boolean b=studentRegistrationDao.saveRequestedFiles(studentRequestedFiles);
			
			if(b)
			{
				response.sendRedirect("StudentLoginServlet");
			}
		}
		
		else if(action!=null && action.equalsIgnoreCase("ResetPassword"))
		{
			String username=request.getParameter("userName");
			String emailId=request.getParameter("emailid");
			
			System.out.println("usernameServlet::"+username);
			System.out.println("emailServlet::"+emailId);
			List<ImageIndexPojo> imageIndexPojoList=studentRegistrationDao.resetPassword(username, emailId);
			session.setAttribute("imageIndexPojoList", imageIndexPojoList);
			System.out.println("imageIndexPojoListServlet:::"+imageIndexPojoList);
			
			
			GPSIRegistrationStudentPojo gpsiStudentPojo=new GPSIRegistrationStudentPojo();
			gpsiStudentPojo=studentRegistrationDao.getStudentEmailUsername(username);
			String userName1=gpsiStudentPojo.getUsername();
			String emailId1=gpsiStudentPojo.getEmailId();
			System.out.println("UserName::::"+userName1);
			System.out.println("EmailCheck:::::"+emailId1);
			
			
			if(username.equals(userName1) && emailId.equals(emailId1))
			{

				System.out.println("CheckConditionTrue:::::::");
				response.sendRedirect("getResetStudentPassword.jsp");
			}
			else
			{
				System.out.println("CheckConditionFalse:::::::");
				request.setAttribute("error", "Invalid Input");
		    	RequestDispatcher rd=request.getRequestDispatcher("/studentForgotPassword.jsp");
		    	rd.forward(request, response);
			}
			
		}
		
		
		else if(action!=null && action.equalsIgnoreCase("RegistrationUpdateList"))
		{
			long studentId=(Long)session.getAttribute("studentId");
			List<GPSIRegistrationStudentPojo> registerList=studentRegistrationDao.registrationUpdateList(studentId);
			System.out.println("studentIdRegister:::::"+studentId);
			session.setAttribute("registerList", registerList);
			System.out.println("RegisterListttt::::"+registerList);
			response.sendRedirect("studentEditProfile.jsp");
		}
		
		else if(action!=null && action.equalsIgnoreCase("UpdateProfile"))
		{
			String semester=request.getParameter("semester");
			long studentId=(Long)session.getAttribute("studentId");
			
			boolean b=studentRegistrationDao.updateRegistration(semester, studentId);
			
			if(b)
			{
				response.sendRedirect("indexStudent.jsp");
			}
			else
			{
				response.sendRedirect("studentEditProfile.jsp");
			}
		}
		
		
		else if(action!=null && action.equalsIgnoreCase("ViewPublicData"))
		{
			String username=(String)session.getAttribute("username");
			
			List<PublicUploadFile> publicuploadList=studentRegistrationDao.getPublicData(username);
			session.setAttribute("publicuploadList", publicuploadList);
			System.out.println("uploadListServlet:::::"+publicuploadList);
			response.sendRedirect("viewpublicdata.jsp");
		}
		
		else
		{
			String deptName=(String)session.getAttribute("deptName");
			
			List<TeacherUploadFile> teacherFilesList=studentRegistrationDao.getAllUploadFile(deptName);
			session.setAttribute("teacherFilesList", teacherFilesList);
			System.out.println("teacherUploadFilesList::::"+teacherFilesList);
			
			
			long studentId=(Long)session.getAttribute("studentId");
			List<StudentRequestedFiles> teacherapprovedFilesList=studentRegistrationDao.getRequestedFilesListById(studentId);
			session.setAttribute("teacherapprovedFilesList", teacherapprovedFilesList);
			System.out.println("ApprovListttt::::"+teacherapprovedFilesList);
			response.sendRedirect("teacherUploadedFileList.jsp");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session=request.getSession();
		//String action=request.getParameter("action");
		
		String username = request.getParameter("username");
		//long studentId=Long.parseLong("student_id");
		//long userId=Long.parseLong(request.getParameter("image_id"));
		session.setAttribute("username", username);
		
		//System.out.println("action :"+action);
		
			StudentRegistrationDao registrationDao=new StudentRegistrationDaoImpl(); 
			
		    
		    GPSIRegistrationStudentPojo gpsiRegistrationStudentPojo=new GPSIRegistrationStudentPojo();
		    
		    
		    gpsiRegistrationStudentPojo.setUsername(username);
		    //gpsiRegistrationStudentPojo.setId(userId);
		    
		    
		    
		    long userId=registrationDao.loginStudent(username);
		    
		    gpsiRegistrationStudentPojo=registrationDao.getRegistrationStudentPojoById(userId);
		    session.setAttribute("gpsiRegistrationStudentPojo", gpsiRegistrationStudentPojo);
		    long studentId=gpsiRegistrationStudentPojo.getId();
		    session.setAttribute("studentId", studentId);
		    String deptName=gpsiRegistrationStudentPojo.getDeptName();
		    session.setAttribute("deptName", deptName);
		    String shuffleImage=gpsiRegistrationStudentPojo.getShuffleImage();
		    session.setAttribute("shuffleImage", shuffleImage);
		    
		    String semester=gpsiRegistrationStudentPojo.getSemesterWise();
		    session.setAttribute("semester", semester);
		    
		    System.out.println("ShuffleImage:::::" +shuffleImage);
		    
		    System.out.println("userId: "+userId);
		    if(userId>0)
		    {
		    	List imageList=registrationDao.getImageListById(userId);
				session.setAttribute("imageList", imageList);
				
				System.out.println("imageList "+imageList.size());
				response.sendRedirect("getStudentPassword.jsp");
			}
		    else
		    {
		    	//Incorrect UserName
		    	request.setAttribute("error", "Invalid Username or Password");
		    	RequestDispatcher rd=request.getRequestDispatcher("/studentLoginPage.jsp");
		    	rd.forward(request, response);
		    	//rd.include(request, response);
		    	//response.sendRedirect("studentLogin.jsp");
		    }
		    
		
	}
		
		
}