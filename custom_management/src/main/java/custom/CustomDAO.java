package custom;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CustomDAO {

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	public CustomDAO() {

		try {
			// MariaDB 드라이버 로드
			Class.forName("org.mariadb.jdbc.Driver");
			// 데이터베이스 접속(커넥션)
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/dump1", "dump", "zxcv1234");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	public int insert(CustomVO vo) {

		int r = 0;
		try {
			stmt = conn.createStatement();
			String sql = "INSERT INTO custom"
					+ "	(BUSI_NUM, CUSTOM, SHORT, CEO, CHARGE_PERSON, BUSI_CONDITION, ITEM, POST_NUM, ADDR1, ADDR2, TEL, FAX, HOMEPAGE, CO_YN, FOREIGN_YN, TAX_YN, COUNTRY_ENG, COUNTRY_KOR, SPECIAL_RELATION, TRADE_STOP, CONTRACT_PERIOD_S, CONTRACT_PERIOD_E, REGI_INFO_MAN, REGI_INFO_DATE, MODI_INFO_MAN, MODI_INFO_DATE) "
					+ "VALUES ('" + vo.getBusi_num() + "', '" + vo.getCustom() + "', '" + vo.getShort_name() + "', '"
					+ vo.getCeo() + "', '" + vo.getCharge_person() + "', '" + vo.getBusi_condition() + "', '"
					+ vo.getItem() + "', '" + vo.getPost_num() + "', '" + vo.getAddr1() + "', '" + vo.getAddr2()
					+ "', '" + vo.getTel() + "', '" + vo.getFax() + "', '" + vo.getHomepage() + "', '" + vo.getCo_yn()
					+ "', '" + vo.getForeign_yn() + "', '" + vo.getTax_yn() + "', '" + vo.getCountry_eng() + "', '"
					+ vo.getCountry_kor() + "', '" + vo.getSpecial_relation() + "', '" + vo.getTrade_stop() + "', '"
					+ vo.getContract_period_s() + "', '" + vo.getContract_period_e() + "', '" + vo.getRegi_info_man()
					+ "', NOW(), '" + vo.getModi_info_man() + "', NOW());\n";
			r = stmt.executeUpdate(sql); // insert, update, delete -> executeUpdate() 사용
			sql = "INSERT INTO account " + "(BUSI_NUM, FACTORY, TRADE_BANK, ACCOUNT_NUM) " + "VALUES ('"
					+ vo.getBusi_num() + "', '" + vo.getFactory() + "', '" + vo.getTrade_bank() + "', '"
					+ vo.getAccount_num() + "'); ";
			r = stmt.executeUpdate(sql); // insert, update, delete -> executeUpdate() 사용
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return r;
	}

	public int update(CustomVO vo) {
		int r = 0;
		try {
			stmt = conn.createStatement();
			String sql = "update custom set " + "BUSI_NUM='" + vo.getBusi_num() + "'," + "CUSTOM='" + vo.getCustom()
					+ "'," + "SHORT='" + vo.getShort_name() + "'," + "CEO='" + vo.getCeo() + "'," + "CHARGE_PERSON='"
					+ vo.getCharge_person() + "'," + "BUSI_CONDITION='" + vo.getBusi_condition() + "'," + "ITEM='"
					+ vo.getItem() + "'," + "POST_NUM='" + vo.getPost_num() + "'," + "ADDR1='" + vo.getAddr1() + "',"
					+ "ADDR2='" + vo.getAddr2() + "'," + "TEL='" + vo.getTel() + "'," + "FAX='" + vo.getFax() + "',"
					+ "HOMEPAGE='" + vo.getHomepage() + "'," + "CO_YN='" + vo.getCo_yn() + "'," + "FOREIGN_YN='"
					+ vo.getForeign_yn() + "'," + "TAX_YN='" + vo.getTax_yn() + "'," + "COUNTRY_ENG='"
					+ vo.getCountry_eng() + "'," + "COUNTRY_KOR='" + vo.getCountry_kor() + "'," + "SPECIAL_RELATION='"
					+ vo.getSpecial_relation() + "'," + "TRADE_STOP='" + vo.getTrade_stop() + "',"
					+ "CONTRACT_PERIOD_S='" + vo.getContract_period_s() + "'," + "CONTRACT_PERIOD_E='"
					+ vo.getContract_period_e() + "'," + "MODI_INFO_MAN='" + vo.getModi_info_man() + "',"
					+ "MODI_INFO_DATE=NOW()" + " where BUSI_NUM='" + vo.getBusi_num() + "'";
			r = stmt.executeUpdate(sql); // insert, update, delete -> executeUpdate() 사용
			sql = "UPDATE account\r\n" + "	SET\r\n" + "		BUSI_NUM='" + vo.getBusi_num() + "',\r\n"
					+ "		FACTORY='" + vo.getFactory() + "',\r\n" + "		TRADE_BANK='" + vo.getTrade_bank()
					+ "',\r\n" + "		ACCOUNT_NUM='" + vo.getAccount_num() + "'\r\n" + "	WHERE BUSI_NUM='"
					+ vo.getBusi_num() + "'";
			r = stmt.executeUpdate(sql); // insert, update, delete -> executeUpdate() 사용
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return r;
	}

	public int delete(String busi_num) {
		int r = 0;
		try {
			stmt = conn.createStatement();
			String sql = "delete from custom where BUSI_NUM='" + busi_num + "'";
			r = stmt.executeUpdate(sql); // insert, update, delete -> executeUpdate() 사용
			sql = "delete from account where BUSI_NUM='" + busi_num + "'";
			r = stmt.executeUpdate(sql); // insert, update, delete -> executeUpdate() 사용
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return r;
	}

	public CustomVO selectOne(String busi_num) {
		CustomVO vo = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(
					"SELECT * FROM custom c LEFT JOIN account a ON c.BUSI_NUM=a.BUSI_NUM WHERE c.BUSI_NUM='" + busi_num
							+ "'");
			if (rs.next()) {
				vo = new CustomVO();
				vo.setBusi_num(rs.getString("BUSI_NUM"));
				vo.setCustom(rs.getString("CUSTOM"));
				vo.setShort_name(rs.getString("SHORT"));
				vo.setCeo(rs.getString("CEO"));
				vo.setCharge_person(rs.getString("CHARGE_PERSON"));
				vo.setBusi_condition(rs.getString("BUSI_CONDITION"));
				vo.setItem(rs.getString("ITEM"));
				vo.setPost_num(rs.getString("POST_NUM"));
				vo.setAddr1(rs.getString("ADDR1"));
				vo.setAddr2(rs.getString("ADDR2"));
				vo.setTel(rs.getString("TEL"));
				vo.setFax(rs.getString("FAX"));
				vo.setHomepage(rs.getString("HOMEPAGE"));
				vo.setCo_yn(rs.getString("CO_YN"));
				vo.setForeign_yn(rs.getString("FOREIGN_YN"));
				vo.setTax_yn(rs.getString("TAX_YN"));
				vo.setCountry_eng(rs.getString("COUNTRY_ENG"));
				vo.setCountry_kor(rs.getString("COUNTRY_KOR"));
				vo.setSpecial_relation(rs.getString("SPECIAL_RELATION"));
				vo.setTrade_stop(rs.getString("TRADE_STOP"));
				vo.setContract_period_s(rs.getString("CONTRACT_PERIOD_S"));
				vo.setContract_period_e(rs.getString("CONTRACT_PERIOD_E"));
				vo.setRegi_info_man(rs.getString("REGI_INFO_MAN"));
				vo.setRegi_info_date(rs.getString("REGI_INFO_DATE"));
				vo.setModi_info_man(rs.getString("MODI_INFO_MAN"));
				vo.setModi_info_date(rs.getString("MODI_INFO_DATE"));
				vo.setFactory(rs.getString("FACTORY"));
				vo.setTrade_bank(rs.getString("TRADE_BANK"));
				vo.setAccount_num(rs.getString("ACCOUNT_NUM"));
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return vo;
	}

	public List<CustomVO> selectList(String busi_num, String custom) {
		List<CustomVO> list = new ArrayList<CustomVO>();
		try {
			stmt = conn.createStatement();
			String sql;
			sql = "select BUSI_NUM, CUSTOM from custom";
			if (busi_num.equals("") && custom.equals("")) {
				// intentional blank
			} else {
				sql += " where ";
				if (!busi_num.equals("") && custom.equals("")) {
					sql += "busi_num like '%" + busi_num + "%' ";
				} else if (!custom.equals("") && busi_num.equals("")) {
					sql += "custom like '%" + custom + "%'";
				} else {
					sql += "busi_num like'%" + busi_num + "%' or custom like '%" + custom + "%'";
				}
			}
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				CustomVO vo = new CustomVO();
				vo.setBusi_num(rs.getString("BUSI_NUM"));
				vo.setCustom(rs.getString("CUSTOM"));
				list.add(vo);
			}
		} catch (Exception e) {
		}
		return list;
	}

	public void close() {
		try {
			conn.close();
			stmt.close();
			if (rs != null)
				rs.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	public boolean isDuplicatePk(String busi_num) {
		boolean r = true;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from custom where busi_num='" + busi_num + "'");
			if (rs.next()) {
				if (rs.getInt(1) == 0) {
					r = false;
				}
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return r;
	}
}
