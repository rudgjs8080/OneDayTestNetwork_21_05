package com.callor.todo.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.callor.todo.model.ListVO;
import com.callor.todo.service.ListService;
import com.callor.todo.service.impl.ListServiceImplV1;

@WebServlet("/")
public class HomeController extends HttpServlet {

	private static final long serialVersionUID = -4698990536465056302L;
	protected ListService liService;

	public HomeController() {
		liService = new ListServiceImplV1();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String li_date = req.getParameter("li_date");
		List<ListVO> liList = null;
		if (li_date == null || li_date.equals("")) {
			liList = liService.selectAll();
		} else {
			liList = liService.findByDate(li_date);
		}

		req.setAttribute("LiList", liList);

		req.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(req, resp);
	}

}
