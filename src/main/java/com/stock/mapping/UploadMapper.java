package com.stock.mapping;

import java.util.List;

import com.stock.pojo.Upload;

public interface UploadMapper {
	int insert(Upload up);

	Upload select(Integer Upload_id);
    
	List<Upload>selectname();
}
