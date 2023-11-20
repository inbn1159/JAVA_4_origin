package org.bookbook.service;

import java.security.Principal;
import java.util.List;

import org.bookbook.domain.BestVO;
import org.bookbook.domain.Criteria;

public interface BestService {
	public int getTotal(Criteria cri);
	
	public List<BestVO> getList(Criteria cri, Principal principal);

	public List<BestVO> getRandom(int count);
	
	public BestVO get(int Column1, Principal principal);
}