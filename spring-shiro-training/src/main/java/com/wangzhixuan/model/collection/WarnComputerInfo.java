package com.wangzhixuan.model.collection;

import java.util.Date;

/***
 * 涉密计算机内网台账预警实体
 * 
 * @author kate
 *
 */
public class WarnComputerInfo {
	private String id;
	private String ip;
	private String mac;
	private String serialNumber;
	private String os;
	private String status;
	private String changeField;
	private Date updateTime;
	private String depname;
	private String resperson;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getMac() {
		return mac;
	}

	public void setMac(String mac) {
		this.mac = mac;
	}

	public String getChangeField() {
		return changeField;
	}

	public void setChangeField(String changeField) {
		this.changeField = changeField;
	}

	public String getSerialNumber() {
		return serialNumber;
	}

	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}

	public String getOs() {
		return os;
	}

	public void setOs(String os) {
		this.os = os;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getDepname() {
		return depname;
	}

	public void setDepname(String depname) {
		this.depname = depname;
	}

	public String getResperson() {
		return resperson;
	}

	public void setResperson(String resperson) {
		this.resperson = resperson;
	}

}
