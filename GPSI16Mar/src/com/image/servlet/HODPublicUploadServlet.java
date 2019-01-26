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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.image.utility.Constant;
import com.image.utility.DBUtility;

/**
 * Servlet implementation class HODPublicUploadServlet
 */
@WebServlet("/HODPublicUploadServlet")
@MultipartConfig(maxFileSize =1024*1024*100) // upload file up to 16MB
public class HODPublicUploadServlet extends HttpServlet {
	

	private static final long serialVersionUID = -1623656324694499109L;
	 private static final String UPLOAD_DIR = Constant.FILE_LOCATION;
	 String filePath="";
	private Connection conn;

	public HODPublicUploadServlet() {
		conn = DBUtility.getConnection();
	}

	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		
		
		// gets values of text fields
		String userType = request.getParameter("userType");
		String deptName = request.getParameter("deptName");
		String semesterWise = request.getParameter("semester");
		String username=(String)session.getAttribute("username");
		String uploadBy=request.getParameter("uploaded_by");

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
	        //String applicationPath = request.getServletContext().getRealPath("");
	        
	        //System.out.println("applicationPath "+applicationPath);
	        // constructs path of the directory to save uploaded file
	        //String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;
	        String uploadFilePath = UPLOAD_DIR;
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
		      		filePart.write(uploadFilePath + fileName);
		      		filePath=fileName;
		      		System.out.println("filePath "+filePath);
		        }
		

		String message = null; // message will be sent back to client

		try {
			// constructs SQL statement
			
			PreparedStatement statement = conn.prepareStatement("INSERT INTO upload_public_data(view_user_type, deptName, semesterWise,username,uploaded_by, upload_file) values (?,?,?,?,?,?)");
			statement.setString(1, userType);
			statement.setString(2, deptName);
			statement.setString(3, semesterWise);
			statement.setString(4, username);
			statement.setString(5, "HOD");

			if (inputStream != null) {
				// fetches input stream of the upload file for the blob column
				//statement.setBlob(3, inputStream);
				statement.setString(6, filePath);
			}

			// sends the statement to the database server
			int row = statement.executeUpdate();
			if (row > 0) {
				message = "Image is uploaded successfully into the Database";
			}
		} catch (SQLException ex) {
			//message = "ERROR: " + ex.getMessage();
			//ex.printStackTrace();
		}
		// sets the message in request scope
		request.setAttribute("message", message);

		// forwards to the message page
		getServletContext().getRequestDispatcher("/indexHOD.jsp").forward(
				request, response);
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