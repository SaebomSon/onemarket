package com.one.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.one.dao.ReplyDAO;
import com.one.dto.ReplyDTO;

public class ReplyAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="Reply.jsp";
		ReplyDAO rDAO = ReplyDAO.getInstance();
		List<ReplyDTO> list = null;
		
		int numPage = 0;
		
		if(request.getParameter("page") != null) {
			numPage = Integer.parseInt(request.getParameter("page"));
		}else {
			numPage = 1;
		}
		
		try {
			list = rDAO.ReplyAll(numPage, 10);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("replyAll", list);
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
}
