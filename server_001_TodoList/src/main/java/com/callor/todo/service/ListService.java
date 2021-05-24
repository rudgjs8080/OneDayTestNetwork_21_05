package com.callor.todo.service;

import java.util.List;

import com.callor.todo.model.ListVO;

public interface ListService {
	
	public List<ListVO> selectAll();
	
	public ListVO findById(Long seq);
	public List<ListVO> findByDate();
	public List<ListVO> findByPlace();
	
	public Integer insert(ListVO liVO);
	public Integer update(ListVO liVO);
	public Integer delte(Long seq);
	
}
