package com.one.action;

import com.one.action.Action;
import com.one.action.ActionFactory;

public class ActionFactory {
	private static ActionFactory instance = new ActionFactory();

	private ActionFactory() {
		super();	// �� Ŭ���� �ۿ����� new�� �θ� �� ����
	}

	public static ActionFactory getInstance() {
		return instance;
	}

	public Action getAction(String command) {
		Action action = null;

		//������ Action Ŭ������ Action �������̽� implements�ؼ� ����

		if("shopping_main".equals(command)) {	//����ȭ��
			action = new MainAction();
		}else if("shopping_registerMember".equals(command)){	//(�Һ���)ȸ������
			action = new RegisterMemberAction();
		}else if("shopping_registerSeller".equals(command)){	//(�Ǹ���)ȸ������
			action = new RegisterSellerAction();
		}else if("shopping_login".equals(command)){	//�α���
			action = new LoginAction();
		}else if("shopping_product".equals(command)) {	//��ǰ �󼼺���
			action = new ProductAction();
		}else if("shopping_basket".equals(command)){	//��ٱ���
			action = new BasketAction();
		}else if("shopping_order".equals(command)){	//�ֹ�������
			action = new OrderAction();
		}else if("search".equals(command)) {
			action = new SearchAction(); 
		}else if("search_category".equals(command)) {
			action = new SearchCategoryAction();
		}else if("shopping_insertBasket".equals(command)){	//��->��ٱ���
			action = new InsertBasketAction();
		}else if("shopping_insertOrder".equals(command)){	// ����������
			action = new OrderInsertAction();
		}else if("shopping_changeInfo".equals(command)){	// ȸ����������
			action = new ChangeInfoAction();
		}else if("shopping_updateInfo".equals(command)){	// ȸ���������� �Ϸ�
			action = new UpdateInfoAction();
		}else if("product_reply".equals(command)) {
			action = new ReplyAction();
		}else if("logout".equals(command)) {
			action = new LogOutAction();
		}else if("seller_id_check".equals(command)) { //�Ǹ��� ȸ������->���̵� �ߺ�Ȯ��
			action = new SellerIdCheckAction();
		}else if("search_id".equals(command)){ //���̵�ã��
			action = new SearchIdAction();
		}else if("insert_product".equals(command)) {
			action = new RegisetProductAction();
		}else if("show_orderlist".equals(command)) {	//���Ÿ�Ϻ���
			action = new OrderListAction();
		}else if("quantity_minus".equals(command)) {
	         action = new QuantityMinusAction();
	    }else if("quantity_plus".equals(command)) {
	         action = new QuantityPlusAction();
	    }

		return action;
	}
}
