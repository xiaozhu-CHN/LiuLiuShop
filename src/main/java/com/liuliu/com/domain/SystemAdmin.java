package com.liuliu.com.domain;

import lombok.Data;


@Data
public class SystemAdmin {
	private Integer SysAdminId;
	private String sysAdminName;
	private Integer authId;
	private String sysAdminPwd;
	private String sysAdminCall;
}
