package com.one.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.one.dao.BuyerDAO;
import com.one.dto.BuyerDTO;

public class UpdateInfoAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//메인에서 b_idx 받아오기
		HttpSession session = request.getSession();
		int b_idx = (int)(session.getAttribute("b_idx"));
		
		// 회원정보 수정 페이지에서 수정되는 parameter 가져오기
		String newpw1 = request.getParameter("newpw1");
		String newpw2 = request.getParameter("newpw2");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		
		BuyerDAO dao = BuyerDAO.getInstance();

		//새 비번으로 변경 안할 경우(빈칸일 경우)
		if(newpw1 == null && newpw2 == null) {
			//
		}else {
			// 비밀번호 변경시, 기존 비밀번호와 동일한지 확인(같으면 안됨)
			// 새 비번 1,2가 같은지 확인
			// 그 후에 다 update
		}
		
		
		
	}

}
