package com.hotel;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 启动程序
 *
 * @author sir
 */
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
public class HotelApplication {
    public static void main(String[] args) {
        SpringApplication.run(HotelApplication.class, args);
        System.out.println("(==========   酒店后台管理系统启动成功    =========)");
    }
}
