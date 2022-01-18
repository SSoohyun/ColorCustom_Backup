package org.cc.mapper;

import org.cc.domain.CustomAttachVO;

public interface CustomAttachMapper {
	public void insert(CustomAttachVO vo);
	public void delete(String uuid);
}
