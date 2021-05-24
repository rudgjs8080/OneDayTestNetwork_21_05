package com.callor.todo.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.callor.todo.config.DbInfo;
import com.callor.todo.config.OracleConnection;
import com.callor.todo.model.ListVO;
import com.callor.todo.service.ListService;

public class ListServiceImplV1 implements ListService {

	protected Connection dbConn;

	public ListServiceImplV1() {
		dbConn = OracleConnection.getDBConnection();

	}

	public List<ListVO> select(PreparedStatement pStr) throws SQLException {
		List<ListVO> liList = new ArrayList<ListVO>();

		ResultSet rSet = pStr.executeQuery();

		while (rSet.next()) {
			ListVO liVO = new ListVO();
			liVO.setLi_seq(rSet.getLong(DbInfo.li_seq));
			liVO.setLi_date(rSet.getString(DbInfo.li_date));
			liVO.setLi_time(rSet.getString(DbInfo.li_time));
			liVO.setLi_place(rSet.getString(DbInfo.li_place));
			liVO.setLi_content(rSet.getString(DbInfo.li_content));
			liList.add(liVO);

		}
		return liList;
	}

	@Override
	public List<ListVO> selectAll() {
		// TODO 전체조회
		String sql = " select * from tbl_list";
		sql += " order by li_seq";

		PreparedStatement pStr = null;

		try {
			pStr = dbConn.prepareStatement(sql);
			List<ListVO> liList = this.select(pStr);
			pStr.close();

			return liList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}
	
	@Override
	public ListVO findById(Long seq) {
		// TODO Auto-generated method stub
		String sql = " select * from tbl_list ";
		sql += " where li_seq = ? ";
		
		PreparedStatement pStr = null;
		
		try {
			pStr = dbConn.prepareStatement(sql);
			pStr.setLong(1, seq);
			
			List<ListVO> liList = this.select(pStr);
			pStr.close();
			if(liList != null && liList.size() > 0) {
				
				return liList.get(0);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	
		@Override
	public List<ListVO> findByDate() {
		// TODO 날짜로 조회
		String sql = " select * from tbl_list";
		sql += " where li_date = ? ";

		PreparedStatement pStr = null;

		try {
			pStr = dbConn.prepareStatement(sql);
			pStr.setString(1, DbInfo.li_date);
			List<ListVO> liList = this.select(pStr);
			pStr.close();

			return liList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;

	}

	@Override
	public List<ListVO> findByPlace() {
		// TODO 장소
		String sql = " select * from tbl_list";
		sql += " where li_place = ? ";

		PreparedStatement pStr = null;

		try {
			pStr = dbConn.prepareStatement(sql);
			pStr.setString(1, DbInfo.li_place);
			List<ListVO> liList = this.select(pStr);
			pStr.close();

			return liList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public Integer insert(ListVO liVO) {
		// TODO 추가
		String sql = " insert into tbl_list (li_seq, li_date, li_time, li_place, li_content) ";
		sql += " values (seq_list.nextval, ?, ?, ?, ?)";

		PreparedStatement pStr = null;
		try {
			pStr = dbConn.prepareStatement(sql);
			pStr.setString(1, liVO.getLi_date());
			pStr.setString(2, liVO.getLi_time());
			pStr.setString(3, liVO.getLi_place());
			pStr.setString(4, liVO.getLi_content());
			System.out.println("insert 완료");
			Integer result = pStr.executeUpdate();
			pStr.close();
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Integer update(ListVO liVO) {
		// TODO 수정
		String sql = " update tbl_list set ";
		sql += " li_date = ?, li_time = ?, li_place = ?, li_content = ? ";
		sql += " where li_seq = ? ";

		PreparedStatement pStr = null;

		try {
			pStr = dbConn.prepareStatement(sql);
			pStr.setString(1, liVO.getLi_date());
			pStr.setString(2, liVO.getLi_time());
			pStr.setString(3, liVO.getLi_place());
			pStr.setString(4, liVO.getLi_content());
			pStr.setLong(5, liVO.getLi_seq());
			System.out.println("update 완료");
			Integer result = pStr.executeUpdate();
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Integer delte(Long seq) {
		// TODO 삭제
		String sql = "delete from tbl_list ";
		sql += " where li_seq = ? ";

		PreparedStatement pStr = null;

		try {
			pStr = dbConn.prepareStatement(sql);
			pStr.setLong(1, seq);
			pStr.executeUpdate();
			System.out.println("삭제완료");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	
	

}
