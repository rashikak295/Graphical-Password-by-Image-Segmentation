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

import com.image.dao.TeacherRegistrationDao;
import com.image.dao.TeacherRegistrationDaoImpl;
import com.image.pojo.ImageIndexPojo;

/**
 * Servlet implementation class SaveTeacherPasswordServlet
 */
@WebServlet("/SaveTeacherPasswordServlet")
public class SaveTeacherPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveTeacherPasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String action=request.getParameter("action");
		TeacherRegistrationDao teacherRegistrationDao=new TeacherRegistrationDaoImpl();
		
		
		//Gets the temporary Password
		if(action!=null && action.equalsIgnoreCase("save"))
		{
			String image=request.getParameter("imageName");
			long indexId=Long.parseLong(request.getParameter("numValue").trim());
			
			ImageIndexPojo imageIndexPojo=new ImageIndexPojo();
			imageIndexPojo.setImage(image);
			imageIndexPojo.setIndex_id(indexId);
			imageIndexPojo.setUsername((String)request.getSession().getAttribute("username"));
			
			List<ImageIndexPojo> imageIndexPojoList=new ArrayList<ImageIndexPojo>();
			
			if(request.getSession().getAttribute("imageIndexPojoList")!=null)
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
			
			boolean b=teacherRegistrationDao.savePassword(imageIndexPojo);
			
			if(b)
			{
				//Successfully Login
				response.sendRedirect("indexTeacher.jsp");
			}
			else 
			{
				request.setAttribute("error", "Invalid Username or Password");
		    	RequestDispatcher rd=request.getRequestDispatcher("/teacherLoginPage.jsp");
		    	rd.forward(request, response);
			}
		}
		
		
		//Sets the Updated Password
		else if(action!=null && action.equalsIgnoreCase("update"))
		{
			String image=request.getParameter("imageName");
			long indexId=Long.parseLong(request.getParameter("numValue").trim());
			
			ImageIndexPojo imageIndexPojo=new ImageIndexPojo();
			imageIndexPojo.setImage(image);
			imageIndexPojo.setIndex_id(indexId);
			imageIndexPojo.setUsername((String)request.getSession().getAttribute("username"));
			
			boolean b=teacherRegistrationDao.updatePassword(imageIndexPojo);
			
		}
		
		
		else if(action!=null && action.equalsIgnoreCase("verify"))
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
					response.sendRedirect("teacherLoginPage.jsp?msg=Wrong Password");
				}
				else
				{
						for(int i=0;i<imageIndexPojoList.size();i++)
							
						{
							
							boolean flag=teacherRegistrationDao.checkImageByFilename(imageIndexPojoList.get(i).getImage().trim(), imageIndexPojoList.get(i).getIndex_id());
							if(!flag)
							{
								flagFinal=false;
								break;
								
							}
						}
				}
				
				
				if(flagFinal)
				{
					response.sendRedirect("indexTeacher.jsp");
				}
				/*else
				{
					response.sendRedirect("teacherLogin.jsp?msg=Wrong Password");
				}*/
				
			}
			request.setAttribute("error", "Invalid Username or Password");
			RequestDispatcher rd=request.getRequestDispatcher("/teacherLoginPage.jsp");
			rd.include(request, response);
			//response.sendRedirect("teacherLogin.jsp?msg=Wrong Password");
		}
		
	}

}
