package com.billingsoftware.constants;

public class SQLConstants {

    public  final static String  INSERT_USER_DETAILS = "INSERT INTO USERS " +
			" VALUES (?,?, ?,?, ?, ?,?, ?)";
    
    public final static String FIND_ALL_USERS =  "SELECT * FROM USERS";
    
    public final static String GET_LOGIN_DETAILS = "SELECT USERNAME, PASSWORD FROM LOGIN";
}
