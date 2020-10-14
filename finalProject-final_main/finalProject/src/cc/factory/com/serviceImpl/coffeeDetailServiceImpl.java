package cc.factory.com.serviceImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.factory.com.dao.coffeeDetailDao;
import cc.factory.com.dto.SideDto;
import cc.factory.com.dto.cartDto;
import cc.factory.com.dto.coffeeDto;
import cc.factory.com.dto.orderDetailDto;
import cc.factory.com.dto.orderDto;
import cc.factory.com.service.coffeeDetailService;

@Service
public class coffeeDetailServiceImpl implements coffeeDetailService {

	@Autowired
	coffeeDetailDao dao;
	
	@Override
	public coffeeDto getDetailOne(int seq) {
		return dao.getDetailOne(seq);
	}

	@Override
	public boolean addCartOne(cartDto dto) {
		return dao.addCartOne(dto)>0?true:false;
	}

	@Override
	public List<cartDto> getCartAll(String id) {
		return dao.getCartAll(id);
	}

	@Override
	public boolean addOrder(orderDto dto) {
		boolean b = true;
		int oseq = dao.addOrder(dto);
		
		List<orderDetailDto> list = new ArrayList<>();
		
		dto.setDetail(dto.getDetail().substring(1));
		String[] arr = dto.getDetail().split("_");
		if(arr!=null && arr.length>1) {
			for(int i=0; i<arr.length; i++) {
				String[] arr2 = arr[i].split(",");
				orderDetailDto odd = new orderDetailDto(arr2[0],Integer.parseInt(arr2[1]),arr2[2],arr2[3]);
				list.add(odd);
			}
		}else {
			String[] arr2 = dto.getDetail().split(",");
			orderDetailDto odd = new orderDetailDto(arr2[0],Integer.parseInt(arr2[1]),arr2[2],arr2[3]);
			list.add(odd);
		}
		
		for(int i=0; i<list.size(); i++) {
			orderDetailDto odd = list.get(i);
			odd.setOrder_seq(oseq);
			int count = dao.addOrderDetail(odd);
			if(count<0) b = false;
		}
		
		if(b) {
			dto.setSeqArr(dto.getSeqArr().substring(1));
			String[] seqArr = dto.getSeqArr().split(",");
			
			if(seqArr!=null && seqArr.length>1) {
				for(int i=0; i<seqArr.length; i++) {
					dao.delCart( Integer.parseInt(seqArr[i]) );
				}
			}else {
				dao.delCart(Integer.parseInt(dto.getSeqArr()));
			}
		}
		return b;
	}

	@Override
	public int getVisitCount(String id) {
		return dao.getVisitCount(id);
	}

	@Override
	public boolean updateVisitCount(String id) {
		return dao.updateVisitCount(id)>0?true:false;
	}

	@Override
	public boolean updateOrderCount(String seq) {
		int count = 1;
		String[] str = seq.split(",");
		for(int i=0; i<str.length; i++) {
			count = dao.updateOrderCount(Integer.parseInt(str[i]));
			if(count<0) count = -1;
		}
		return count>0?true:false;
	}

	@Override
	public List<SideDto> getSyrupAll() {
		return dao.getSyrupAll();
	}

	@Override
	public List<coffeeDto> getCoffeeList() {
		return dao.getCoffeeList();
	}

	@Override
	public List<coffeeDto> getCoffeeKindList(int kind) {
		return dao.getCoffeeKindList(kind);
	}

}
