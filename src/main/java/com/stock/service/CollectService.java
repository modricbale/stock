package com.stock.service;

import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stock.mapping.CollectMapper;
import com.stock.mapping.StockMapper;
import com.stock.mapping.StockPriceMapper;
import com.stock.pojo.Collect;
import com.stock.pojo.Stock;
import com.stock.pojo.StockPrice;
import com.stock.pojo.User;
import com.stock.utils.getStockData;
import com.stock.utils.getStockData1;


@Service
@Transactional
public class CollectService {
	@Autowired 
	CollectMapper collectMapper;
	@Autowired
	StockPriceMapper stockPriceMapper;
	@Autowired
	StockMapper stockMapper;
	@Autowired
	StockService stockService;
	public void user_delete_by_id(int collect_id){
		
		collectMapper.deleteByPrimaryKey(collect_id);
	}
	
	public Collect selectByPrimaryKey(Integer collect_id){
		
		Collect collect = collectMapper.selectByPrimaryKey(collect_id);
		
		return collect;
	}
		
	 public List<Collect> querycollect(){
			List<Collect> list = collectMapper.selectall();
			return list;
		}
	public void insert(Collect collect){
			
			collectMapper.insert(collect);
			System.out.println("fuck");
		}
	
	public List<String> selectcdbyid(int user_id){
		return collectMapper.selectcdbyid(user_id);
	}
	
	public void deletebycd(String stock_cd){
		collectMapper.deleteBycd(stock_cd);
	}
}
