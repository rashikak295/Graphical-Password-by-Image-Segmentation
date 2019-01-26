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
import com.image.pojo.ImageIndexPojo;

/**
 * Servlet implementation class SavePasswordServlet
 */
@WebServlet("/SaveStudentPasswordServlet")
public class SaveStudentPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveStudentPasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//HttpSession session=request.getSession();
		//System.out.println("ImageName: "+request.getParameter("imageName"));
		//System.out.println("IndexNumber: "+request.getParameter("numValue").trim());
		String action=request.getParameter("action");
		StudentRegistrationDao registrationDao=new StudentRegistrationDaoImpl();
		if(action!= null && action.equals("save"))						//save to get password in temp PasswordTable for Student
		{
			String image=request.getParameter("imageName");
			long indexId=Long.parseLong(request.getParameter("numValue").trim());
			
			ImageIndexPojo imageIndexPojo=new ImageIndexPojo();
			
			imageIndexPojo.setImage(image);
			imageIndexPojo.setIndex_id(indexId);
			imageIndexPojo.setUsername((String)request.getSession().getAttribute("username"));
			List<ImageIndexPojo> imageIndexPojoList=new ArrayList<ImageIndexPojo>();
			if(request.getSession().getAttribute("imageIndexPojoList")!= null)
			{
				imageIndexPojoList=(List<ImageIndexPojo>)request.getSession().getAttribute("imageIndexPojoList");
				imageIndexPojoList.add(imageIndexPojo);
				request.getSession().setAttribute("imageIndexPojoList",imageIndexPojoList);
				
			}
			else
			{
				imageIndexPojoList.add(imageIndexPojo);
				request.getSession().setAttribute("imageIndexPojoList",imageIndexPojoList);
			}
			
			boolean b=registrationDao.savePassword(imageIndexPojo);
			
			if(b)
			{
				//Successfully Login
				response.sendRedirect("indexStudent.jsp");
			}
			else 
			{
				request.setAttribute("error", "Invalid Username or Password");
		    	RequestDispatcher rd=request.getRequestDispatcher("/studentLoginPage.jsp");
		    	//rd.include(request, response);
		    	rd.forward(request, response);
		    	//response.sendRedirect("studentLoginPage.jsp");
			}
		
		}
		
		
		else if(action!= null && action.equals("update"))         //update to set password Student
		{
			String image=request.getParameter("imageName");
			long indexId=Long.parseLong(request.getParameter("numValue").trim());
			
			ImageIndexPojo imageIndexPojo=new ImageIndexPojo();
			
			imageIndexPojo.setImage(image);
			imageIndexPojo.setIndex_id(indexId);
			imageIndexPojo.setUsername((String)request.getSession().getAttribute("username"));
			
			
			boolean b=registrationDao.updatePassword(imageIndexPojo);
		}
		else if(action!= null && action.equals("verifyPassword"))
		{
			
			List<ImageIndexPojo> imageIndexList=new ArrayList<ImageIndexPojo>();
			if(request.getSession().getAttribute("imageList")!= null)
			{
				imageIndexList=(List<ImageIndexPojo>)request.getSession().getAttribute("imageList");
				for(int i=0;i<imageIndexList.size();i++)
				{
					System.out.println(imageIndexList.get(i).getImage()+"   "+imageIndexList.get(i).getIndex_id());
				}
			}
			
			boolean flagFinal=true;
			
			System.out.println("--------------------------------------------------");
			List<ImageIndexPojo> imageIndexPojoList=new ArrayList<ImageIndexPojo>();
			if(request.getSession().getAttribute("imageIndexPojoList")!= null)
			{
				imageIndexPojoList=(List<ImageIndexPojo>)request.getSession().getAttribute("imageIndexPojoList");
				if(imageIndexList.size()!=imageIndexPojoList.size())
				{
					flagFinal=false;
					response.sendRedirect("studentLoginPage.jsp?msg=Wrong Password");
				}
				else
				{
						for(int i=0;i<imageIndexPojoList.size();i++)
							
						{
							
							boolean flag=registrationDao.checkImageByFilename(imageIndexPojoList.get(i).getImage().trim(), imageIndexPojoList.get(i).getIndex_id());
							if(!flag)
							{
								flagFinal=false;
								break;
								
							}
						}
				}
				
				
				if(flagFinal)
				{
					response.sendRedirect("indexStudent.jsp");
				}
				/*else
				{
					response.sendRedirect("studentLogin.jsp?msg=Wrong Password");
				}*/
				
			}
			
			request.setAttribute("error", "Invalid Username or Password");
			RequestDispatcher rd=request.getRequestDispatcher("/studentLoginPage.jsp");
			rd.include(request, response);
			//response.sendRedirect("studentLoginPage.jsp");
			//response.sendRedirect("studentLogin.jsp?msg=Wrong Password");
			
		}
	}

}
