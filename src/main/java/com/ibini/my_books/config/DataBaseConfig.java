package com.ibini.my_books.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

// DB 관련 설정 클래스
@Configuration
@ComponentScan(basePackages = "com.ibini.my_books")
public class DataBaseConfig {

    // DB접속 정보 설정 (DataSource설정)
    @Bean
    public DataSource dataSource() {

        HikariConfig config = new HikariConfig();

//        // 현정 노트북 설정
//        config.setUsername("root");
//        config.setPassword("mariadb1234");
//        config.setJdbcUrl("jdbc:mariadb://localhost:3306/ibini");
//        config.setDriverClassName("org.mariadb.jdbc.Driver");

//
        config.setUsername("root");
        config.setPassword("mariadb");
        config.setJdbcUrl("jdbc:mariadb://localhost:3306/ibini");
        config.setDriverClassName("org.mariadb.jdbc.Driver");

        return new HikariDataSource(config);
    }
}
