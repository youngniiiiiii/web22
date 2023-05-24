package com.kbstar.weather;

import com.kbstar.util.WeatherUtil;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class WeatherTest {


    @Test
    void contextLoads() throws Exception {
        String result = null;
        result = WeatherUtil.getWeather1("108");
        log.info(result);
    }
}
