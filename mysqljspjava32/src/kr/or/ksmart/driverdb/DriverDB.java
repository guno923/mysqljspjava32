package kr.or.ksmart.driverdb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DriverDB {
//1)����̹� �ε��� DB���� �� Connection��ü �ּҰ��� �����ϴ� �޼��� ����
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
