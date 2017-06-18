package com.stock.mapping;

import java.util.List;

import com.stock.pojo.Lzgg;

public interface LzggMapper {
	List<Lzgg>select_all(int page);
}
