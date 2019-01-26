package com.image.servlet;


import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.image.dao.FileDao;
import com.image.dao.FileDaoImpl;
import com.image.pojo.FilePojo;


@WebServlet("/FileServlet")
@MultipartConfig(maxFileSize =1024*1024*100) // upload file up to 16MB
public class FileServlet extends HttpServlet {
	

	private static final long serialVersionUID = -1623656324694499109L;
	 private static final String UPLOAD_DIR = "photo";
	 String filePath="";
	private Connection conn;

	public FileServlet() {
		//conn = MyConnection.getConnection();
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		// gets values of text fields
		/*String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");*/
		
		FilePojo filePojo=new FilePojo();
		
		//String image=request.getParameter("image_name");
		//String category=request.getParameter("category");

		InputStream inputStream = null;
		File fileSaveDir=null;
		// obtains the upload file part in this multipart request
		Part filePart = request.getPart("photo");
		if (filePart != null) {
			
			// debug messages
			System.out.println(filePart.getName());
			System.out.println(filePart.getSize());
			System.out.println(filePart.getContentType());

			// obtains input stream of the upload file
			inputStream = filePart.getInputStream();
			
			// gets absolute path of the web application
	        String applicationPath = request.getServletContext().getRealPath("");
	        
	        System.out.println("applicationPath "+applicationPath);
	        // constructs path of the directory to save uploaded file
	        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;
	        System.out.println("uploadFilePath "+uploadFilePath);
	        // creates the save directory if it does not exists
	        fileSaveDir = new File(uploadFilePath);
	        if (!fileSaveDir.exists()) {
	            fileSaveDir.mkdirs();
	        }
		        System.out.println("Upload File Directory="+fileSaveDir.getAbsolutePath());
		        
		        String fileName = null;
		        //Get all the parts from request and write it to the file on server
		      if(filePart!=null)
		            fileName = getFileName(filePart);
		      		filePart.write(uploadFilePath + File.separator + fileName);
		      		filePath=UPLOAD_DIR+File.separator+fileName;
		      		System.out.println("filePath "+filePath);
		        }
		

		String message = null; // message will be sent back to client

		FileDao fileDao=new FileDaoImpl();
		//imagepojo.setCategory(category);
		filePojo.setFile(filePath);
		
		boolean b=fileDao.addFile(filePojo);
		
		if(b)
		{
			// sets the message in request scope
			request.setAttribute("Message", message);

			// forwards to the message page
			getServletContext().getRequestDispatcher("/firstPage.jsp").forward(
					request, response);
		}
		else
		{
			response.sendRedirect("error.jsp");
		}
		
		/*try {
			// constructs SQL statement
			
			PreparedStatement statement=conn.prepareStatement("insert into add_image_table(category,image_name) values(?,?)");
			System.out.println("statement" +statement);
			
			statement.setString(1, category);

			if (inputStream != null) {
				// fetches input stream of the upload file for the blob column
				//statement.setBlob(3, inputStream);
				statement.setString(2, filePath);
			}

			// sends the statement to the database server
			int row = statement.executeUpdate();
			if (row > 0) {
				message = "Image is uploaded successfully into the Database";
			}
		} catch (SQLException ex) {
			message = "ERROR: " + ex.getMessage();
			ex.printStackTrace();
		}*/
		/*// sets the message in request scope
		request.setAttribute("Message", message);

		// forwards to the message page
		getServletContext().getRequestDispatcher("/adminHomePage.jsp").forward(
				request, response);*/
	}
	
	 /**
     * Utility method to get file name from HTTP header content-disposition
     */
    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        System.out.println("content-disposition header= "+contentDisp);
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length()-1);
            }
        }
        return "";
    }
}
