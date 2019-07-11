package kr.or.ksmart.driverdb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DriverDB {
//1)드라이버 로딩과 DB연결 후 Connection객체 주소값을 리턴하는 메서드 선언
	public Connection driverDbcon() throws ClassNotFoundException, SQLException {
		System.out.println("###############");
		System.out.println("01 driverDbcon DriverDB.java");
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcDriver = "jdbc:mysql://localhost:3306/dev32db?" +
				"useUnicode=true&characterEncoding=euckr";
		String dbUser = "dev32id";
		String dbPass = "dev32pw";
		Connection reconn = null;
		reconn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		System.out.println(reconn + "<-- reconn");
		return reconn;
	}

}
