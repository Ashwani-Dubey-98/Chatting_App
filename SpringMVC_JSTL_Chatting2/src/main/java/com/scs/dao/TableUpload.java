package com.scs.dao;

import javax.persistence.*;

@Entity
@Table(name = "tbl_upload")
public class TableUpload {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
	
	@Column
	private String path;
	
	@Column
	private String Username;
	
	public String getUsername() {
		return Username;
	}

	public void setUsername(String username) {
		Username = username;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
}