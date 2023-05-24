package com.kbstar.cust;

import com.kbstar.dto.Cust;
import com.kbstar.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

import java.util.List;

@Slf4j
@SpringBootTest
class SelectTests {
	@Autowired
	CustService service;

	@Test
	void contextLoads() {
		List<Cust> list = null;

		try {
			list=service.get();

//			for(Cust obj:list){
//				log.info(obj.toString());
			} catch (Exception e) {

				log.info("......에러다.........");
				e.printStackTrace();
			}

		}
	}

