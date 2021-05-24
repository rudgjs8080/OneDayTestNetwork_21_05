package com.callor.todo.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.callor.todo.config.DbInfo;
import com.callor.todo.model.ListVO;
import com.callor.todo.service.ListService;
import com.callor.todo.service.impl.ListServiceImplV1;
@WebServlet("/list/*")
public class ListController extends HttpServlet{
	
	protected ListService liService;
	public ListController() {
		liService = new ListServiceImplV1();
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String subPath = req.getPathInfo();
		if(subPath.equals("/view")) {
			String strSeq = req.getParameter("li_seq");
			Long li_seq = Long.valueOf(strSeq);
			ListVO liVO = liService.findById(li_seq);
			
			req.setAttribute("Li", liVO);
			req.getRequestDispatcher("/WEB-INF/views/view.jsp").forward(req, resp);
		}
		else if(subPath.equals("/insert")) {
			
		req.getRequestDispatcher("/WEB-INF/views/insert.jsp").forward(req, resp);
		} else if(subPath.equals("/update")) {
			String strSeq = req.getParameter("li_seq");
			Long li_seq = Long.valueOf(strSeq);
			
			ListVO liVO = liService.findById(li_seq);
			req.setAttribute("LiList", liVO);
			
			req.getRequestDispatcher("/WEB-INF/views/insert.jsp").forward(req, resp);
			
			
		} else if(subPath.equals("/delete")) {
			String strSeq = req.getParameter("li_seq");
			Long li_seq = Long.valueOf(strSeq);
			
			
			liService.delte(li_seq);
			resp.sendRedirect("/list/");
		}
		
	} // doGet end
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String subPath = req.getPathInfo();
		
		String li_date = req.getParameter(DbInfo.li_date);
		String li_time = req.getParameter(DbInfo.li_time);
		String li_place = req.getParameter(DbInfo.li_place);
		String li_content = req.getParameter(DbInfo.li_content);
		
		ListVO liVO = new ListVO();
		liVO.setLi_date(li_date);
		liVO.setLi_time(li_time);
		liVO.setLi_place(li_place);
		liVO.setLi_content(li_content);
		
		if(subPath.equals("/insert")) {
			liService.insert(liVO);
			resp.sendRedirect("/list/");
		} else if(subPath.equals("/update")) {
			String strSeq = req.getParameter("li_seq");
			Long li_seq = Long.valueOf(strSeq);
			
			liVO.setLi_seq(li_seq);
			liService.update(liVO);
			resp.sendRedirect("/list/");
		}
	}
	
}
