package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Category;
import model.DisplayItemLogic;
import model.FavoriteLogic;
import model.TemporaryItem;
import model.User;

@WebServlet("/NaoeServlet")
public class NaoeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();

		DisplayItemLogic selectLogic = new DisplayItemLogic();
		List<TemporaryItem>ItemList = selectLogic.DisplayAllItem();
		request.setAttribute("ItemList",ItemList);
		
		List<TemporaryItem> Ranking = selectLogic.DisplayItemOrderRanking();
		request.setAttribute("Ranking", Ranking);

		List<TemporaryItem> cateRankList = selectLogic.selectCategoryRank(1,0,5);
		request.setAttribute("cateRankList", cateRankList);

		// おすすめ 3/9~
		//DisplayItemLogic osusume = new DisplayItemLogic();
		List<TemporaryItem> categoryList_osusume = selectLogic.CategorySearchLimit(27, 0, 10);
		request.setAttribute("categoryList_osusume", categoryList_osusume);

		// 野菜・果物
		List<TemporaryItem> categoryList_yasai = selectLogic.CategorySearchLimit(9, 0, 50);
		request.setAttribute("categoryList_yasai", categoryList_yasai);
		
		// 肉、ハム、ソーセージ
		List<TemporaryItem> categoryList_niku = selectLogic.CategorySearchLimit(10, 0, 50);
		request.setAttribute("categoryList_niku", categoryList_niku);

		// 魚、刺身、海藻
		List<TemporaryItem> categoryList_sakana = selectLogic.CategorySearchLimit(11, 0, 50);
		request.setAttribute("categoryList_sakana", categoryList_sakana);
		
		// 卵、牛乳、乳製品、パン、ジャム、スープ
		List<TemporaryItem> categoryList_tamago = selectLogic.CategorySearchLimit(12, 0, 50);
		request.setAttribute("categoryList_tamago", categoryList_tamago);

		// 豆腐、納豆、油揚げ、蒟蒻、練物、つくだ煮、漬物
		List<TemporaryItem> categoryList_tofu = selectLogic.CategorySearchLimit(13, 0, 50);
		request.setAttribute("categoryList_tofu", categoryList_tofu);
		
		// 米、餅、麺類
		List<TemporaryItem> categoryList_kome = selectLogic.CategorySearchLimit(14, 0, 50);
		request.setAttribute("categoryList_kome", categoryList_kome);

		// 時短料理の素、チルド野菜
		List<TemporaryItem> categoryList_zitan = selectLogic.CategorySearchLimit(15, 0, 50);
		request.setAttribute("categoryList_zitan", categoryList_zitan);
		
		// レトルト、インスタント食品
		List<TemporaryItem> categoryList_retoruto = selectLogic.CategorySearchLimit(16, 0, 50);
		request.setAttribute("categoryList_retoruto", categoryList_retoruto);
		
		// 冷凍食品、冷凍食材
		List<TemporaryItem> categoryList_reitou = selectLogic.CategorySearchLimit(17, 0, 50);
		request.setAttribute("categoryList_reitou", categoryList_reitou);
		
		// カップ麺、粉類、乾物、海苔、缶詰、瓶詰、水煮
		List<TemporaryItem> categoryList_cup = selectLogic.CategorySearchLimit(18, 0, 50);
		request.setAttribute("categoryList_cup", categoryList_cup);

		// お菓子、アイス、デザート、製菓材料
		List<TemporaryItem> categoryList_okasi = selectLogic.CategorySearchLimit(19, 0, 50);
		request.setAttribute("categoryList_okasi", categoryList_okasi);

		// 調味料、ルー、だし、スープの素、油
		List<TemporaryItem> categoryList_tyoumi = selectLogic.CategorySearchLimit(20, 0, 50);
		request.setAttribute("categoryList_tyoumi", categoryList_tyoumi);

		// 水、飲料
		List<TemporaryItem> categoryList_mizu = selectLogic.CategorySearchLimit(21, 0, 50);
		request.setAttribute("categoryList_mizu", categoryList_mizu);

		// お酒
		List<TemporaryItem> categoryList_sake = selectLogic.CategorySearchLimit(22, 0, 50);
		request.setAttribute("categoryList_sake", categoryList_sake);

		// 日用品、ホーム＆キッチン、ペット、文房具
		List<TemporaryItem> categoryList_nitiyou = selectLogic.CategorySearchLimit(23, 0, 50);
		request.setAttribute("categoryList_nitiyou", categoryList_nitiyou);
		
		// お薬、健康、美容、介護
		List<TemporaryItem> categoryList_kusuri = selectLogic.CategorySearchLimit(24, 0, 50);
		request.setAttribute("categoryList_kusuri", categoryList_kusuri);

		// ベビー、キッズ
		List<TemporaryItem> categoryList_baby = selectLogic.CategorySearchLimit(25, 0, 50);
		request.setAttribute("categoryList_baby", categoryList_baby);

		// 健康食品
		List<TemporaryItem> categoryList_kenkou = selectLogic.CategorySearchLimit(26, 0, 50);
		request.setAttribute("categoryList_kenkou", categoryList_kenkou);
		
		//お気に入り
		User user = (User) session.getAttribute("user");
		if(user!=null) {
			FavoriteLogic favoriteItem=new FavoriteLogic();
			List<TemporaryItem> favoriteList = favoriteItem.SelectFavorite(user.getId());
			request.setAttribute("favoriteList", favoriteList);
		}
		
		// ランキングTOP５
		List<TemporaryItem> itemList = selectLogic.CreateItemListLimit(0, 5);
		request.setAttribute("itemList", itemList);
		
		List<Category> category = selectLogic.DisplayCategory();
		session.setAttribute("category", category);

		// ここからカテゴリごとの売り上げランキング
		// 野菜・果物
		List<TemporaryItem> categoryList_yasa = selectLogic.selectCategoryRank(9, 0, 5);
		request.setAttribute("categoryList_yasa", categoryList_yasa);
		
		// 肉、ハム、ソーセージ
		List<TemporaryItem> categoryList_nik = selectLogic.selectCategoryRank(10, 0, 5);
		request.setAttribute("categoryList_nik", categoryList_nik);

		// 魚、刺身、海藻
		List<TemporaryItem> categoryList_sakan = selectLogic.selectCategoryRank(11, 0, 5);
		request.setAttribute("categoryList_sakan", categoryList_sakan);
		// 卵、牛乳、乳製品、パン、ジャム、スープ
		List<TemporaryItem> categoryList_tamag = selectLogic.selectCategoryRank(12, 0, 5);
		request.setAttribute("categoryList_tamag", categoryList_tamag);

		// 豆腐、納豆、油揚げ、蒟蒻、練物、つくだ煮、漬物
		List<TemporaryItem> categoryList_tof = selectLogic.selectCategoryRank(13, 0, 5);
		request.setAttribute("categoryList_tof", categoryList_tof);
		
		// 米、餅、麺類
		List<TemporaryItem> categoryList_kom = selectLogic.selectCategoryRank(14, 0, 5);
		request.setAttribute("categoryList_kom", categoryList_kom);

		// 時短料理の素、チルド野菜
		List<TemporaryItem> categoryList_zita = selectLogic.selectCategoryRank(15, 0, 5);
		request.setAttribute("categoryList_zita", categoryList_zita);
		
		// レトルト、インスタント食品
		List<TemporaryItem> categoryList_retorut = selectLogic.selectCategoryRank(16, 0, 5);
		request.setAttribute("categoryList_retorut", categoryList_retorut);
		
		// 冷凍食品、冷凍食材
		List<TemporaryItem> categoryList_reito = selectLogic.selectCategoryRank(17, 0, 5);
		request.setAttribute("categoryList_reito", categoryList_reito);
		
		// カップ麺、粉類、乾物、海苔、缶詰、瓶詰、水煮
		List<TemporaryItem> categoryList_cu = selectLogic.selectCategoryRank(18, 0, 5);
		request.setAttribute("categoryList_cu", categoryList_cu);

		// お菓子、アイス、デザート、製菓材料
		List<TemporaryItem> categoryList_okas = selectLogic.selectCategoryRank(19, 0, 5);
		request.setAttribute("categoryList_okas", categoryList_okas);

		// 調味料、ルー、だし、スープの素、油
		List<TemporaryItem> categoryList_tyoum = selectLogic.selectCategoryRank(20, 0, 5);
		request.setAttribute("categoryList_tyoum", categoryList_tyoum);

		// 水、飲料
		List<TemporaryItem> categoryList_miz = selectLogic.selectCategoryRank(21, 0, 5);
		request.setAttribute("categoryList_miz", categoryList_miz);

		// お酒
		List<TemporaryItem> categoryList_sak = selectLogic.selectCategoryRank(22, 0, 5);
		request.setAttribute("categoryList_sak", categoryList_sak);

		// 日用品、ホーム＆キッチン、ペット、文房具
		List<TemporaryItem> categoryList_nitiyo = selectLogic.selectCategoryRank(23, 0, 5);
		request.setAttribute("categoryList_nitiyo", categoryList_nitiyo);
		
		// お薬、健康、美容、介護
		List<TemporaryItem> categoryList_kusur = selectLogic.selectCategoryRank(24, 0, 5);
		request.setAttribute("categoryList_kusur", categoryList_kusur);

		// ベビー、キッズ
		List<TemporaryItem> categoryList_bab = selectLogic.selectCategoryRank(25, 0, 5);
		request.setAttribute("categoryList_bab", categoryList_bab);

		// 健康食品
		List<TemporaryItem> categoryList_kenko = selectLogic.selectCategoryRank(26, 0, 5);
		request.setAttribute("categoryList_kenko", categoryList_kenko);
		
		RequestDispatcher logdispatcher = request.getRequestDispatcher("/WEB-INF/jsp/shop.jsp");
		logdispatcher.forward(request, response);
	}
}
