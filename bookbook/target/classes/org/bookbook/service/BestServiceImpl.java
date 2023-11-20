package org.bookbook.service;

import java.security.Principal;
import java.util.List;

import org.bookbook.domain.BestVO;
import org.bookbook.domain.Criteria;
import org.bookbook.mapper.BestMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BestServiceImpl implements BestService {

	@Autowired
	private BestMapper mapper;
	
	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<BestVO> getList(Criteria cri, Principal principal) {
		List<BestVO>  list = mapper.getList(cri);
		
				
		return list;
	}

	@Override
	public List<BestVO> getRandom(int count) {
		return mapper.getRandom(count);
	}

	@Override
	public BestVO get(int Column1, Principal principal) {
		BestVO best = mapper.read(Column1);
		return best;
	}

	

}
