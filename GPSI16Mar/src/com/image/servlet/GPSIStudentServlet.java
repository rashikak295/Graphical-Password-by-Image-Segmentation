package com.image.servlet;
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;

import javax.imageio.ImageIO;

import java.awt.image.BufferedImage;
import java.io.*;
import java.awt.*;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import java.util.Iterator;
import java.util.List;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.image.dao.StudentRegistrationDao;
import com.image.dao.StudentRegistrationDaoImpl;
import com.image.pojo.GPSIRegistrationHODPojo;
import com.image.pojo.GPSIRegistrationStudentPojo;
import com.image.utility.Constant;

import java.io.InputStream;

@WebServlet("/GPSIStudentServlet")
@MultipartConfig(location = "/tmp", fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class GPSIStudentServlet extends HttpServlet {

   
    FileItem flItem = null;
    GPSIRegistrationStudentPojo gpsiRegistrationStudentPojo=new GPSIRegistrationStudentPojo();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Connection con = null;
        PreparedStatement stat = null;
        
        try {
            long maxFileSize = (2 * 1024 * 1024);
            int maxMemSize = (2 * 1024 * 1024);
//            final String path = "/tmp";
            boolean isMultiPart = ServletFileUpload.isMultipartContent(request);
            if (isMultiPart) {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List items = upload.parseRequest(request);
                Iterator<FileItem> iter = items.iterator();
                while (iter.hasNext()) {
                    FileItem fileItem = iter.next();
                    if (fileItem.isFormField()) {
                        processFormField(fileItem);
                    } else {
                        flItem = fileItem;
                    }
                }
                
             	
            	InputStream inputStream = null;  
            	 OutputStream outputStream = null;
            	 String fileName = System.currentTimeMillis()+"_"+flItem.getName();
            	 ServletContext context = request.getSession().getServletContext();
				 String uploadFileLocation=context.getInitParameter("UploadFileLocation");
				 gpsiRegistrationStudentPojo.setImage(fileName);
            	try {
            		
					 inputStream  =  flItem.getInputStream();
					
					File newFile = new File(uploadFileLocation+"" + fileName);  
					   if (!newFile.exists()) {  
					    newFile.createNewFile();  
					   }  
					   outputStream = new FileOutputStream(newFile);  
					   int read = 0;  
					   byte[] bytes = new byte[1024];  
					  
					   while ((read = inputStream.read(bytes)) != -1) {  
					    outputStream.write(bytes, 0, read);  
					   }  
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
            	
            	
            	//first will check the uname and then will further proceed with registration
            	StudentRegistrationDao studentRegistrationDao=new StudentRegistrationDaoImpl();
            	boolean b=studentRegistrationDao.isUserExist(gpsiRegistrationStudentPojo.getUsername());
            	System.out.println("b" +b);
            	if(b==true)
            	{
            		request.setAttribute("error", "UserName already exists");
            		RequestDispatcher rd=request.getRequestDispatcher("/studentRegistrationPage.jsp");
            		rd.forward(request, response);
            		//response.sendRedirect("studentRegistrationPage.jsp");
            	}
            	
            	else
            	{
            	File file = new File(uploadFileLocation+"" + fileName); // I have bear.jpg in my working directory
                FileInputStream fis = new FileInputStream(file);
                BufferedImage image = ImageIO.read(fis); //reading the image file

                
                int chunks = gpsiRegistrationStudentPojo.getRows() * gpsiRegistrationStudentPojo.getCols();

                int chunkWidth = image.getWidth() / gpsiRegistrationStudentPojo.getCols(); // determines the chunk width and height
                int chunkHeight = image.getHeight() / gpsiRegistrationStudentPojo.getRows();
                int count = 0;
                String imageArray[]=new String[100];
                BufferedImage imgs[] = new BufferedImage[chunks]; //Image array to hold image chunks
                for (int x = 0; x < gpsiRegistrationStudentPojo.getRows(); x++) {
                    for (int y = 0; y < gpsiRegistrationStudentPojo.getCols(); y++) {
                        //Initialize the image array with image chunks
                        imgs[count] = new BufferedImage(chunkWidth, chunkHeight, image.getType());

                        // draws the image chunk
                        Graphics2D gr = imgs[count++].createGraphics();
                        gr.drawImage(image, 0, 0, chunkWidth, chunkHeight, chunkWidth * y, chunkHeight * x, chunkWidth * y + chunkWidth, chunkHeight * x + chunkHeight, null);
                        gr.dispose();
                    }
                }
                System.out.println("Splitting done");

                //writing mini images into image files
                for (int i = 0; i < imgs.length; i++) {
                	String tempImage="img" + System.currentTimeMillis() + ".jpg";
                	imageArray[i]=tempImage;
                    ImageIO.write(imgs[i], "jpg", new File(uploadFileLocation+tempImage));
                    
                }
                System.out.println("Mini images created");
                long id_created=0;
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gpsi","root","root");
                stat = con.prepareStatement("insert into student_registration(username,address,phoneNo,rollNo,emailId,deptName,semesterWise,yearOfJoining,yearOfCompletion,rows,cols,shuffle_image,image) values (?,?,?,?,?,?,?,?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
                stat.setString(1, gpsiRegistrationStudentPojo.getUsername());
                stat.setString(2, gpsiRegistrationStudentPojo.getAddress());
                stat.setString(3, gpsiRegistrationStudentPojo.getPhoneNo());
                stat.setLong(4, gpsiRegistrationStudentPojo.getRollNo());
                stat.setString(5, gpsiRegistrationStudentPojo.getEmailId());
                stat.setString(6, gpsiRegistrationStudentPojo.getDeptName());
                stat.setString(7, gpsiRegistrationStudentPojo.getSemesterWise());
                stat.setString(8, gpsiRegistrationStudentPojo.getYearOfJoining());
                stat.setString(9, gpsiRegistrationStudentPojo.getYearOfCompletion());
                stat.setInt(10, gpsiRegistrationStudentPojo.getRows());
                stat.setInt(11, gpsiRegistrationStudentPojo.getCols());
                stat.setString(12, gpsiRegistrationStudentPojo.getShuffleImage());
                stat.setString(13, gpsiRegistrationStudentPojo.getImage());
                // stat.setBinaryStream(4, (InputStream) itemPhoto.getInputStream(), (int) itemPhoto.getSize());
                 int rows = stat.executeUpdate();
                 try (ResultSet generatedKeys = stat.getGeneratedKeys()) {
                     if (generatedKeys.next()) {
                    	 id_created=generatedKeys.getLong(1);
                     }
                     else {
                         throw new SQLException("Creating user failed, no ID obtained.");
                     }
                 }
                
                if (rows > 0) {
                	
                	for(int ii=0;ii<100;ii++)
                	{
	                	if(imageArray[ii]!= null && imageArray[ii].trim().length()>0){	
		                     stat = con.prepareStatement("insert into image_password_student_registration_index(image_id,image) values(?,?)");
		                     stat.setLong(1, id_created);
		                     stat.setString(2, imageArray[ii]);
		                     // stat.setBinaryStream(4, (InputStream) itemPhoto.getInputStream(), (int) itemPhoto.getSize());
		                      rows = stat.executeUpdate();
	                	}
                	}
                	request.getSession().setAttribute("imagesList", imageArray);
                	request.getSession().setAttribute("gpsiRegistrationPojo", gpsiRegistrationStudentPojo);
                	
                	
                	String context1= Constant.USER_FILE_LOCATION;
            		
            		File dir = new File(context1+"\\"+gpsiRegistrationStudentPojo.getUsername());
            		dir.mkdir();
            	
            		System.out.println("FileDirectory::::" +dir);
            		System.out.println("Success Registration With Folder Name");
                
                	
                	
                	response.sendRedirect("setPasswordStudentPage.jsp");
                	
        
                } 
                else {
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<title>Error Adding Employee</title>");
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<h2>Error Adding Employee Data</h2>");
                    out.println("</body>");
                    out.println("</html>");
                }
            }
            }
        } catch (Exception ex) {
            out.println(ex.getMessage());
        } finally {
            try {
                con.close();
                stat.close();
                out.close();
            } catch (Exception ex) {
                out.println(ex.getMessage());
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processFormField(FileItem item) {
        //String na = item.getFieldName();
        if (item.getFieldName().equals("username")) {
        	gpsiRegistrationStudentPojo.setUsername(item.getString());
        } else if (item.getFieldName().equals("address")) {
        	gpsiRegistrationStudentPojo.setAddress(item.getString());
        } else if (item.getFieldName().equals("phoneNo")) {
        	gpsiRegistrationStudentPojo.setPhoneNo(item.getString());
        }
        
        else if (item.getFieldName().equals("rollNo")) {
        	gpsiRegistrationStudentPojo.setRollNo(Long.parseLong(item.getString()));
        }
        
        else if (item.getFieldName().equals("emailId")) {
        	gpsiRegistrationStudentPojo.setEmailId(item.getString());
        }
        
        else if (item.getFieldName().equals("deptName")) {
        	gpsiRegistrationStudentPojo.setDeptName(item.getString());
        }
        
        else if (item.getFieldName().equals("semester")) {
        	gpsiRegistrationStudentPojo.setSemesterWise(item.getString());
        }
        
        else if (item.getFieldName().equals("yearOfJoining")) {
        	gpsiRegistrationStudentPojo.setYearOfJoining(item.getString());
        }
        else if (item.getFieldName().equals("yearOfCompletion")) {
        	gpsiRegistrationStudentPojo.setYearOfCompletion(item.getString());
        }
        
        else if (item.getFieldName().equals("rows")) {
        	gpsiRegistrationStudentPojo.setRows(Integer.parseInt(item.getString()));
        }
        else if (item.getFieldName().equals("cols")) {
        	gpsiRegistrationStudentPojo.setCols(Integer.parseInt(item.getString()));
        	/*String cols1 = item.getString();
	    	cols = Integer.parseInt(cols1);*/
        }
        else if(item.getFieldName().equals("shuffleImage")){
        	gpsiRegistrationStudentPojo.setShuffleImage(item.getString());
        }
	  }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
