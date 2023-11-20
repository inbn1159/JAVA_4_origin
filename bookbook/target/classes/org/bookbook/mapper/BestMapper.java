package org.bookbook.mapper;

import java.util.List;

import org.bookbook.domain.BestVO;
import org.bookbook.domain.Criteria;

public interface BestMapper {
public int getTotalCount(Criteria cri);
	
	// 페이지 목록 추출
	public List<BestVO> getList(Criteria cri);
	
	public List<BestVO> getRandom(int count);
	

	public BestVO read(int Column1);
}
