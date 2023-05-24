package com.kbstar.cust;

import com.github.pagehelper.PageInfo;
import com.kbstar.dto.Cust;
import com.kbstar.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class SelectPageTests {
    @Autowired
    CustService service;

    @Test
    void contextLoads() {
        PageInfo<Cust> pageInfo;

        try {
            pageInfo = new PageInfo<>(service.getPage(2), 5);
        } catch (Exception e) {

            log.info("......에러다.........");
            e.printStackTrace();
        }

    }
}

