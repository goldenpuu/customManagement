Server : Tomcat8.5
DB : MariaDB 10.9

고객처관리 프로그램

public CustomDAO() {
		
		try {
			// MariaDB 드라이버 로드
			Class.forName("org.mariadb.jdbc.Driver");
			// 데이터베이스 접속(커넥션)
			conn = DriverManager.getConnection(
					"jdbc:mariadb://localhost:3306/디비명", "아이디", "비밀번호");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
