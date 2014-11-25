/**
 * 
 */
package com.phn.action;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import com.phn.entity.Goods;
import com.phn.service.GoodsService;

/**
 * @author 潘海南
 * @date 2014-10-30
 */
@Controller("searchAction")
public class SearchAction {
	private String searchTxt;
	private List<Goods> listGoods;
	@Resource
	private GoodsService goodsService;

	public String SearchTxt() throws Exception {
		System.out.println(searchTxt);
		this.listGoods = this.goodsService.GetAllSearTxt(searchTxt);
		return "search_Txt_success";
	}

	public String getSearchTxt() {
		return searchTxt;
	}

	public void setSearchTxt(String searchTxt) {
		try {
			if ("GET".equalsIgnoreCase(ServletActionContext.getRequest().getMethod())) {
				searchTxt = new String(searchTxt.getBytes("ISO-8859-1"),
						"UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		this.searchTxt = searchTxt;
	}

	public List<Goods> getListGoods() {
		return listGoods;
	}

	public void setListGoods(List<Goods> listGoods) {
		this.listGoods = listGoods;
	}

}
