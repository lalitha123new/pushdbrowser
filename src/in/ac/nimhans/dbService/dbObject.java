package in.ac.nimhans.dbService;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;



public class dbObject {
	private static Connection conn;

	private dbObject() {
		try {
			Properties prop = new Properties();
			String propFileName = "config.properties";
			InputStream inputStream = getClass().getClassLoader().getResourceAsStream(propFileName);
			prop.load(inputStream);
			String userName = prop.getProperty("UserName");
			String password = prop.getProperty("Password");
			String url = prop.getProperty("DataBaseURL");
			Class.forName(prop.getProperty("DriverName")).newInstance();
			conn = DriverManager.getConnection(url, userName, password);
			System.out.println("connection !");
		} catch (Exception e) {
			System.out.println("Exception found" + e);
			closeConnection();
		}
	}

	private static class DAOHelper {
		//System.out.println("connection !--DAOHelper return");
		private static final dbObject dataobject_INSTANCE = new dbObject();
	}

	public static dbObject getInstance() {
	//	System.out.println("connection !--getInstance return"+Connect());
		return DAOHelper.dataobject_INSTANCE;
	}

	public Connection Connect() {
	     //Connection.isClosed()
		//System.out.println("connection !--Dbobject return");
		return dbObject.conn;
	}

	public void closeConnection() {
		try {
			
			System.out.println("Connection closed");
			conn.close();
		} catch (Exception e) {
			System.out.println("Connection close error");
		}
	}

}
