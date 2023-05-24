package com.kbstar.ncp;

import com.kbstar.util.OCRUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Map;

@Slf4j
@SpringBootTest
class OCRTests {

    @Value("${uploadimgdir}")
    String imgpath;

    @Test
    void contextLoads() {
        JSONObject jo = null;
        jo = (JSONObject) OCRUtil.getResult(imgpath, "bob11.jpg");
        log.info(jo.toJSONString());
//        Map map = OCRUtil.getData(jo);
//        log.info(map.values().toString());
        Map map = OCRUtil.getBob(jo);
        log.info(map.values().toString());
    }

}
