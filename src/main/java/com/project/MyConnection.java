package com.project;

import java.sql.Connection;
import java.sql.DriverManager;

public class MyConnection {
	static Connection con ;

	

		public static Connection createConnection() {
			
			// load the driver
			
			
			
			try {
			Class.forName("org.postgresql.Driver");
			
			
			
			String JdbcURL = "jdbc:postgresql://ec2-52-3-2-245.compute-1.amazonaws.com:5432/ddcm41bh3t6u7b";
		    String Username = "qttguscfswxcky";
		    String password = "62d4182d1a44636e8b018b39bae7d5990fbe3aeed689424078a8f9b677e5fd1b";
		    
		    con=DriverManager.getConnection(JdbcURL, Username, password);
			}
			catch (Exception e) {
				// TODO: handle exception
				
				e.printStackTrace();
			}
			
			return con;
	}
}
