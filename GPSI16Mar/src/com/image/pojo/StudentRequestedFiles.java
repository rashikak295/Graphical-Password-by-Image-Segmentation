package com.image.pojo;

public class StudentRequestedFiles 
{
	private long s_req_id;
	private long requester_id;
	private long upload_id;
	private String file_name;
	private long owner_id;
	private String status;
	private String student_username;
	
	private String upload_url;
	
	private TeacherUploadFile teacherUploadFile;

	public long getS_req_id() {
		return s_req_id;
	}

	public void setS_req_id(long s_req_id) {
		this.s_req_id = s_req_id;
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

	public String getStudent_username() {
		return student_username;
	}

	public void setStudent_username(String student_username) {
		this.student_username = student_username;
	}

	public String getUpload_url() {
		return upload_url;
	}

	public void setUpload_url(String upload_url) {
		this.upload_url = upload_url;
	}

	public TeacherUploadFile getTeacherUploadFile() {
		return teacherUploadFile;
	}

	public void setTeacherUploadFile(TeacherUploadFile teacherUploadFile) {
		this.teacherUploadFile = teacherUploadFile;
	}

	
	
}
