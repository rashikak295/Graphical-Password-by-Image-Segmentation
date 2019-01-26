package com.image.pojo;


public class HODRequestedFiles 
{
	private long h_req_id;
	private long requester_id;
	private long upload_id;
	private String file_name;
	private long owner_id;
	private String status;
	private String hod_username;
	private String deptName;
	
	public long getH_req_id() {
		return h_req_id;
	}
	public void setH_req_id(long h_req_id) {
		this.h_req_id = h_req_id;
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
	public String getHod_username() {
		return hod_username;
	}
	public void setHod_username(String hod_username) {
		this.hod_username = hod_username;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	
	
	
}
