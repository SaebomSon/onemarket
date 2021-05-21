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
		//���ο��� b_idx �޾ƿ���
		HttpSession session = request.getSession();
		int b_idx = (int)(session.getAttribute("b_idx"));
		
		// ȸ������ ���� ���������� �����Ǵ� parameter ��������
		String newpw1 = request.getParameter("newpw1");
		String newpw2 = request.getParameter("newpw2");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		
		BuyerDAO dao = BuyerDAO.getInstance();

		//�� ������� ���� ���� ���(��ĭ�� ���)
		if(newpw1 == null && newpw2 == null) {
			//
		}else {
			// ��й�ȣ �����, ���� ��й�ȣ�� �������� Ȯ��(������ �ȵ�)
			// �� ��� 1,2�� ������ Ȯ��
			// �� �Ŀ� �� update
		}
		
		
		
	}

}
