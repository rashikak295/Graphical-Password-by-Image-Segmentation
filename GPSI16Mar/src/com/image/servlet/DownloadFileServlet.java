package com.image.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.image.utility.Constant;



public class DownloadFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ServletFileUpload uploader = null;
	@Override
	public void init() throws ServletException{
		DiskFileItemFactory fileFactory = new DiskFileItemFactory();
		File filesDir = (File) getServletContext().getAttribute("FILES_DIR_FILE");
		System.out.println(filesDir);
		fileFactory.setRepository(filesDir);
		this.uploader = new ServletFileUpload(fileFactory);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fileName = Constant.FILE_LOCATION+request.getParameter("fileName");
		//String UserName=(String)request.getSession().getAttribute("UserName");
		System.out.println("fileName "+fileName);
		
		if(fileName == null || fileName.equals("")){
			throw new ServletException("File Name can't be null or empty");
		}
		/*File file = new File(request.getServletContext().getAttribute("FILES_DIR")+File.separator+fileName);*/
		File file=new File(fileName);
		if(!file.exists()){
			throw new ServletException("File doesn't exists on server.");
		}
		System.out.println("File location on server::"+file.getAbsolutePath());
		ServletContext ctx = getServletContext();
		InputStream fis = new FileInputStream(file);
		String mimeType = ctx.getMimeType(file.getAbsolutePath());
		response.setContentType(mimeType != null? mimeType:"application/octet-stream");
		response.setContentLength((int) file.length());
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
		
		ServletOutputStream os       = response.getOutputStream();
		byte[] bufferData = new byte[1024];
		int read=0;
		while((read = fis.read(bufferData))!= -1){
			os.write(bufferData, 0, read);
		}
		os.flush();
		os.close();
		fis.close();
		System.out.println("File downloaded at client successfully");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String UserName=(String)request.getSession().getAttribute("UserName");
		long userId=(Long)session.getAttribute("userMasterId");
		if(!ServletFileUpload.isMultipartContent(request)){
			throw new ServletException("Content type is not multipart/form-data");
		}
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.write("<html><head></head><body>");
		try {
			List<FileItem> fileItemsList = uploader.parseRequest(request);
			Iterator<FileItem> fileItemsIterator = fileItemsList.iterator();
			while(fileItemsIterator.hasNext()){
				FileItem fileItem = fileItemsIterator.next();
				System.out.println("FieldName="+fileItem.getFieldName());
				System.out.println("FileName="+fileItem.getName());
				System.out.println("ContentType="+fileItem.getContentType());
				System.out.println("Size in bytes="+fileItem.getSize());
			
				
				//File fileFolder=new File(request.getServletContext().getAttribute("FILES_DIR")+"\\"+UserName);
				String uploadlocation= Constant.FILE_LOCATION;
				//fileFolder.mkdirs();
				
				File file = new File(uploadlocation+"\\"+fileItem.getName());	
				System.out.println("FileDownloadServlet::::"+file);
				
				System.out.println(file);
				System.out.println("Absolute Path at server="+file.getAbsolutePath());
				fileItem.write(file);
				/*FileUpload fileUpload=new FileUpload();
				fileUpload.setFile_path("\\"+UserName+"\\"+fileItem.getName());
				fileUpload.setUser_name(UserName);
				fileUpload.setFile_name(fileItem.getName());
				fileUpload.setFile_size(fileItem.getSize());
				fileUpload.setUser_id(userId);
				
				
				FileUploadDao FileUploadDao=new FileUploadDaoImpl();
				FileUploadDao.saveFile(fileUpload);*/
				
			    response.sendRedirect("upload_file.jsp");
			}
		} catch (FileUploadException e) {
			out.write("Exception in uploading file."+e);
		} catch (Exception e) {
			out.write("Exception in uploading file."+e);
		}
		out.write("</body></html>");
	}

}
