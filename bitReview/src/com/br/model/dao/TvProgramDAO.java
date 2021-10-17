package com.br.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.br.model.vo.TvProgramVO;
import com.br.mybatis.DBService;

public class TvProgramDAO {

	public static List<TvProgramVO> getList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<TvProgramVO> list = ss.selectList("br.tplist");
		ss.close();
		
		return list;
			
	}
}
