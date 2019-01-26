package com.image.pojo;

public class HODUploadFile 
{
	private long uploadId;
	private long hodId;
	private String uploadFile;
	private String uploadFilePath;
	private String hodUsername;
	private String deptName;
	private String userType;
	
	public long getUploadId() {
		return uploadId;
	}
	public void setUploadId(long uploadId) {
		this.uploadId = uploadId;
	}
	public long getHodId() {
		return hodId;
	}
	public void setHodId(long hodId) {
		this.hodId = hodId;
	}
	public String getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(String uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getUploadFilePath() {
		return uploadFilePath;
	}
	public void setUploadFilePath(String uploadFilePath) {
		this.uploadFilePath = uploadFilePath;
	}
	public String getHodUsername() {
		return hodUsername;
	}
	public void setHodUsername(String hodUsername) {
		this.hodUsername = hodUsername;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	
	
}
