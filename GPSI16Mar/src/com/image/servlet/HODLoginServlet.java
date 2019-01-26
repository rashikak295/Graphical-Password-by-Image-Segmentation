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

import com.image.dao.HODRegistrationDao;
import com.image.dao.HODRegistrationDaoImpl;
import com.image.dao.StudentRegistrationDao;
import com.image.dao.StudentRegistrationDaoImpl;
import com.image.dao.TeacherRegistrationDao;
import com.image.dao.TeacherRegistrationDaoImpl;
import com.image.pojo.GPSIRegistrationHODPojo;
import com.image.pojo.GPSIRegistrationStudentPojo;
import com.image.pojo.GPSIRegistrationTeacherPojo;
import com.image.pojo.HODRequestedFiles;
import com.image.pojo.HODUploadFile;
import com.image.pojo.ImageIndexPojo;
import com.image.pojo.PublicUploadFile;
import com.image.pojo.StudentUploadFile;
import com.image.pojo.TeacherRequestedFiles;
import com.image.pojo.TeacherUploadFile;

/**
 * Servlet implementation class HODLoginServlet
 */
@WebServlet("/HODLoginServlet")
public class HODLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HODLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String action=request.getParameter("action");
		HODRegistrationDao hodRegistrationDao=new HODRegistrationDaoImpl();
		
		if(action!=null && action.equalsIgnoreCase("RequestedFilesList"))
		{
			long ownerId=(Long)session.getAttribute("hodid");
			System.out.println("SEssionownerId::::"+ownerId);
			List<TeacherRequestedFiles> teacherRequestList=hodRegistrationDao.getAllRequestedFiles(ownerId);
			session.setAttribute("teacherRequestList", teacherRequestList);
			response.sendRedirect("teacherRequestedFilesList.jsp");
		}
		
		
		//Accept and Reject for Hod
		else if(action!=null && action.equalsIgnoreCase("UpdateFileStatus"))
		{
				 long user_id=(Long)session.getAttribute("hodid");
				 
			     String status=request.getParameter("status");
			     
			    
			     long fileId=0;
			     int requesterId=0;
			     String file_name=request.getParameter("name");
			     if(request.getParameter("fileId")!=null){
					     fileId=Long.parseLong(request.getParameter("fileId"));
					     requesterId=Integer.parseInt(request.getParameter("requester_id"));
					     
					     System.out.println("requester_id "+requesterId);
					     
					     hodRegistrationDao.updateFileStatus(fileId, requesterId, status);
					     
					     //session.setAttribute("status", status);
					     //System.out.println("status::::"+status);					     

					     if(!status.equals("Reject"))
					     {
					    	 TeacherUploadFile teacherUploadFile=new TeacherUploadFile();
					    	 
					    	 teacherUploadFile.setTeacherId(requesterId);
					    	 
					    	 TeacherRequestedFiles teacherRequestedFiles=new TeacherRequestedFiles();
					    	 
					    	 teacherRequestedFiles.setOwner_id(user_id);
					    	 
					    	 teacherRequestedFiles.setFile_name(file_name);
					
					    	 int id=Integer.parseInt(request.getParameter("id"));
					    
					     }	
					     response.sendRedirect("HODLoginServlet?action=RequestedFilesList");
			     }
		}
		
		else if(action!=null && action.equalsIgnoreCase("OtherDeptFiles"))
		{
			String deptName=(String)session.getAttribute("deptName");
			
			long hodid=(Long)session.getAttribute("hodid");
			List<HODRequestedFiles> approvedHODFilesList=hodRegistrationDao.getHODRequestedFilesListById(hodid);
			session.setAttribute("approvedHODFilesList", approvedHODFilesList);
			System.out.println("ApprovListttt::::"+approvedHODFilesList);
			
			List<HODUploadFile> hodOtherDeptFileslist=hodRegistrationDao.getAllOtherDeptFiles(deptName);
			session.setAttribute("hodOtherDeptFileslist", hodOtherDeptFileslist);
			System.out.println("OtherDeptFiles::::"+hodOtherDeptFileslist);
			response.sendRedirect("hodotherdeptfiles.jsp");
		}
		
		else if(action!=null && action.equalsIgnoreCase("hodRequestedFiles"))
		{
				long hodid=(Long)session.getAttribute("hodid");
				System.out.println("Session: HODId::"+hodid);
				
				String hod_username=(String)session.getAttribute("username");
				String deptName=(String)session.getAttribute("deptName");
				
				long file_id=Long.parseLong(request.getParameter("fileId"));
				System.out.println("File_Id::" +file_id);
				String file_name=request.getParameter("filename");
				System.out.println("Name::" +file_name);
				long owner_id=Long.parseLong(request.getParameter("owner_id"));
				session.setAttribute("owner_id", owner_id);
				System.out.println("Owner::" +owner_id);
				
				HODRequestedFiles hodRequestedFiles=new HODRequestedFiles();
				
				hodRequestedFiles.setFile_name(file_name);
				hodRequestedFiles.setOwner_id(owner_id);
				hodRequestedFiles.setRequester_id(hodid);
				hodRequestedFiles.setUpload_id(file_id);
				hodRequestedFiles.setHod_username(hod_username);
				hodRequestedFiles.setDeptName(deptName);
				
				boolean b=hodRegistrationDao.saveRequestedFiles(hodRequestedFiles);
				
				if(b)
				{
					response.sendRedirect("indexHOD.jsp");
				}
		}
		
		else if(action!=null && action.equalsIgnoreCase("UpdateFileStatusHodOtherDept"))
		{
				 long user_id=(Long)session.getAttribute("hodid");
				 
			     String status=request.getParameter("status");
			     
			    
			     long fileId=0;
			     int requesterId=0;
			     String file_name=request.getParameter("name");
			     if(request.getParameter("fileId")!=null){
					     fileId=Long.parseLong(request.getParameter("fileId"));
					     requesterId=Integer.parseInt(request.getParameter("requester_id"));
					     
					     System.out.println("requester_id "+requesterId);
					     
					     hodRegistrationDao.updateFileStatusHodOtherDept(fileId, requesterId, status);
					     
					     //session.setAttribute("status", status);
					     //System.out.println("status::::"+status);					     

					     if(!status.equals("Reject"))
					     {
					    	 HODUploadFile hodUploadFile=new HODUploadFile();
					    	
					    	 hodUploadFile.setHodId(requesterId);
					    	 
					    	 HODRequestedFiles hodRequestedFiles=new HODRequestedFiles();
					    	 
					    	 hodRequestedFiles.setOwner_id(user_id);
					    	 
					    	 hodRequestedFiles.setFile_name(file_name);
					
					    	 int id=Integer.parseInt(request.getParameter("id"));
					    
					     }	
					     response.sendRedirect("HODLoginServlet?action=OtherDeptRequestedFilesList");
			     }
		}
		
		else if(action!=null && action.equalsIgnoreCase("OtherDeptRequestedFilesList"))
		{
			long ownerId=(Long)session.getAttribute("hodid");
			System.out.println("SEssionownerId::::"+ownerId);
			List<HODRequestedFiles> hodRequestList=hodRegistrationDao.getAllhodOtherDeptRequestedFiles(ownerId);
			session.setAttribute("hodRequestList", hodRequestList);
			response.sendRedirect("hodRequestedFilesList.jsp");
		}
		
		
		else if(action!=null && action.equalsIgnoreCase("ResetPassword"))
		{
			String username=request.getParameter("userName");
			String emailId=request.getParameter("emailid");
			
			System.out.println("usernameServlet::"+username);
			System.out.println("emailServlet::"+emailId);
			List<ImageIndexPojo> imageIndexPojoList=hodRegistrationDao.resetPassword(username, emailId);
			session.setAttribute("imageIndexPojoList", imageIndexPojoList);
			System.out.println("imageIndexPojoListServlet:::"+imageIndexPojoList);
			
			
			GPSIRegistrationHODPojo gpsiHodPojo=new GPSIRegistrationHODPojo();
			gpsiHodPojo=hodRegistrationDao.getHODEmailUsername(username);
			String hoduserName=gpsiHodPojo.getUsername();
			String hodemailId=gpsiHodPojo.getEmailId();
			System.out.println("UserName::::"+hoduserName);
			System.out.println("EmailCheck:::::"+hodemailId);
			
			
			if(username.equals(hoduserName) && emailId.equals(hodemailId))
			{
				System.out.println("CheckConditionTrue:::::::");
				response.sendRedirect("getResetHODPassword.jsp");
			}
			else
			{
				System.out.println("CheckConditionFalse:::::::");
				request.setAttribute("error", "Invalid Input");
		    	RequestDispatcher rd=request.getRequestDispatcher("/hodForgotPassword.jsp");
		    	rd.forward(request, response);
			}
			
		}
		
		else if(action!=null && action.equalsIgnoreCase("ViewPublicData"))
		{
			String username=(String)session.getAttribute("username");
			System.out.println("UserNameCheckServlet::"+username);
			
			List<PublicUploadFile> publicuploadList=hodRegistrationDao.getPublicData(username);
			session.setAttribute("publicuploadList", publicuploadList);
			System.out.println("uploadListServlet:::::"+publicuploadList);
			response.sendRedirect("hodviewpublicdata.jsp");
		}
		
		else
		{
			String deptName=(String)session.getAttribute("deptName");
			
			List<TeacherUploadFile> teacherFilesList=hodRegistrationDao.getAllUploadFile(deptName);
			session.setAttribute("teacherFilesList", teacherFilesList);
			System.out.println("TeacherFilesList::::"+teacherFilesList);
			
	
			List<StudentUploadFile> studentFilesList=hodRegistrationDao.getAllUploadStudentFile(deptName);
			session.setAttribute("studentFilesList", studentFilesList);
			System.out.println("studentUploadFilesList::::"+studentFilesList);
			response.sendRedirect("hodviewuploadedfiles.jsp");	
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		//String action=request.getParameter("action");
		
		String username = request.getParameter("username");
		//long studentId=Long.parseLong("student_id");
		//long userId=Long.parseLong(request.getParameter("image_id"));
		session.setAttribute("username", username);
		
		//System.out.println("action :"+action);
		
			HODRegistrationDao hodRegistrationDao=new HODRegistrationDaoImpl();
		
		    GPSIRegistrationHODPojo gpsiRegistrationHODPojo=new GPSIRegistrationHODPojo();
		    
		    
		    gpsiRegistrationHODPojo.setUsername(username);
		    //gpsiRegistrationStudentPojo.setId(userId);
		    
		    
		    
		    long hodId=hodRegistrationDao.loginHOD(username);
		    
		    gpsiRegistrationHODPojo=hodRegistrationDao.getRegistrationHODPojoById(hodId);
		    session.setAttribute("gpsiRegistrationHODPojo", gpsiRegistrationHODPojo);
		    long hodid=gpsiRegistrationHODPojo.getId();
		    session.setAttribute("hodid", hodid);
		    String deptName=gpsiRegistrationHODPojo.getDeptName();
		    session.setAttribute("deptName", deptName);
		    String shuffleImage=gpsiRegistrationHODPojo.getShuffleImage();
		    session.setAttribute("shuffleImage", shuffleImage);
		    
		    System.out.println("ShuffleImage:::::" +shuffleImage);
		    
		    System.out.println("hodId: "+hodId);
		    if(hodId>0)
		    {
		    	List imageList=hodRegistrationDao.getImageListById(hodId);
				
				session.setAttribute("imageList", imageList);
				
				
				System.out.println("imageList "+imageList.size());
				response.sendRedirect("getHODPassword.jsp");
				
		    }
		    else
		    {
		    	//Incorrect UserName
		    	request.setAttribute("error", "Invalid Username or Password");
		    	RequestDispatcher rd=request.getRequestDispatcher("/hodLoginPage.jsp");
		    	rd.forward(request, response);
		    	//response.sendRedirect("hodLogin.jsp");
		    }
		    
	}

}
