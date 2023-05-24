package com.kbstar.Item;

import com.github.pagehelper.PageInfo;
import com.kbstar.dto.Item;
import com.kbstar.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class SelectPageTests {
    @Autowired
    ItemService service;


    @Test
    void contextLoads() {
        PageInfo<Item> pageInfo;

        try {
            pageInfo = new PageInfo<>(service.getPage(2), 5);
        } catch (Exception e) {
            log.info("......에러다.........");
            e.printStackTrace();
        }

    }
}

