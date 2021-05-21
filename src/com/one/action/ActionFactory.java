package com.one.action;

import com.one.action.Action;
import com.one.action.ActionFactory;

public class ActionFactory {
	private static ActionFactory instance = new ActionFactory();

	private ActionFactory() {
		super();	// 이 클래스 밖에서는 new로 부를 수 없음
	}

	public static ActionFactory getInstance() {
		return instance;
	}

	public Action getAction(String command) {
		Action action = null;

		//각각의 Action 클래스는 Action 인터페이스 implements해서 구현

		if("shopping_main".equals(command)) {	//메인화면
			action = new MainAction();
		}else if("shopping_registerMember".equals(command)){	//(소비자)회원가입
			action = new RegisterMemberAction();
		}else if("shopping_registerSeller".equals(command)){	//(판매자)회원가입
			action = new RegisterSellerAction();
		}else if("shopping_login".equals(command)){	//로그인
			action = new LoginAction();
		}else if("shopping_product".equals(command)) {	//제품 상세보기
			action = new ProductAction();
		}else if("shopping_basket".equals(command)){	//장바구니
			action = new BasketAction();
		}else if("shopping_order".equals(command)){	//주문페이지
			action = new OrderAction();
		}else if("search".equals(command)) {
			action = new SearchAction(); 
		}else if("search_category".equals(command)) {
			action = new SearchCategoryAction();
		}else if("shopping_insertBasket".equals(command)){	//상세->장바구니
			action = new InsertBasketAction();
		}else if("shopping_insertOrder".equals(command)){	// 결제페이지
			action = new OrderInsertAction();
		}else if("shopping_changeInfo".equals(command)){	// 회원정보수정
			action = new ChangeInfoAction();
		}else if("shopping_updateInfo".equals(command)){	// 회원정보수정 완료
			action = new UpdateInfoAction();
		}else if("product_reply".equals(command)) {
			action = new ReplyAction();
		}else if("logout".equals(command)) {
			action = new LogOutAction();
		}else if("seller_id_check".equals(command)) { //판매자 회원가입->아이디 중복확인
			action = new SellerIdCheckAction();
		}else if("search_id".equals(command)){ //아이디찾기
			action = new SearchIdAction();
		}else if("insert_product".equals(command)) {
			action = new RegisetProductAction();
		}else if("show_orderlist".equals(command)) {	//구매목록보기
			action = new OrderListAction();
		}else if("quantity_minus".equals(command)) {
	         action = new QuantityMinusAction();
	    }else if("quantity_plus".equals(command)) {
	         action = new QuantityPlusAction();
	    }

		return action;
	}
}
