package com.billingsoftware.beans;

import java.io.IOException;

public class TestBackup {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		String dbName = "dbName";
		String dbUser = "dbUser";
		String dbPass = "dbPass";
		
		String executeCmd = "";
		executeCmd = "mysqldump -u "+dbUser+" -p"+dbPass+" "+dbName+" -r backup.sql";
		
		Process runtimeProcess = null;
		try {
			runtimeProcess = Runtime.getRuntime().exec(executeCmd);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int processComplete = 0;
		try {
			processComplete = runtimeProcess.waitFor();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(processComplete == 0){
		System.out.println("Backup taken successfully");
		} else {
		System.out.println("Could not take mysql backup");
		}

	}

}
