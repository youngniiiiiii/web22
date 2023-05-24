package com.kbstar.cust;

import com.kbstar.dto.Cust;
import com.kbstar.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@Slf4j
@SpringBootTest
class UpdateTests {
	@Autowired
	CustService service;

	@Test
	void contextLoads() {

		try {
			service.modify(new Cust("id03","pwd33","장길산"));
			log.info("수정완료");
			} catch (Exception e) {

				log.info("......에러다.........");
				e.printStackTrace();
			}

		}
	}

