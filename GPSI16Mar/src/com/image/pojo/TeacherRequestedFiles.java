package com.image.pojo;

public class TeacherRequestedFiles 
{
	private long t_req_id;
	private long requester_id;
	private long upload_id;
	private String file_name;
	private long owner_id;
	private String status;
	private String teacher_username;
	
	private String upload_url;
	
	private HODUploadFile hodUploadFile;
	
	public HODUploadFile getHodUploadFile() {
		return hodUploadFile;
	}
	public void setHodUploadFile(HODUploadFile hodUploadFile) {
		this.hodUploadFile = hodUploadFile;
	}
	public String getUpload_url() {
		return upload_url;
	}
	public void setUpload_url(String upload_url) {
		this.upload_url = upload_url;
	}
	public long getT_req_id() {
		return t_req_id;
	}
	public void setT_req_id(long t_req_id) {
		this.t_req_id = t_req_id;
	}
	public long getRequester_id() {
		return requester_id;
	}
	public void setRequester_id(long requester_id) {
		this.requester_id = requester_id;
	}
	public long getUpload_id() {
		return upload_id;
	}
	public void setUpload_id(long upload_id) {
		this.upload_id = upload_id;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public long getOwner_id() {
		return owner_id;
	}
	public void setOwner_id(long owner_id) {
		this.owner_id = owner_id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTeacher_username() {
		return teacher_username;
	}
	public void setTeacher_username(String teacher_username) {
		this.teacher_username = teacher_username;
	}
	
	
	
	
}
