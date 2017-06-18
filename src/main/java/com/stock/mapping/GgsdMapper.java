package com.stock.mapping;

import java.util.List;

import com.stock.pojo.Ggsd;

public interface GgsdMapper {
	List<Ggsd>select_all(int page);
}
