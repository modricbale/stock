package com.stock.mapping;

import java.util.List;
import java.util.Map;
import com.stock.pojo.StockPrice;


public interface StockPriceMapper {
    //列出全部股票价格信息
    List<Map<String,Object>> listAllStockPrice();
	
}
