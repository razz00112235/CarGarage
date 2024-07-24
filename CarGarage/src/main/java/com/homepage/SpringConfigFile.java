package com.homepage;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

@Configuration
public class SpringConfigFile {

    @Bean
    public DriverManagerDataSource getDriver() {
        DriverManagerDataSource dmd = new DriverManagerDataSource();
        dmd.setDriverClassName("com.mysql.cj.jdbc.Driver"); // Corrected Driver class name
        dmd.setUrl("jdbc:mysql://localhost:3306/flipcart");
        dmd.setUsername("root");
        dmd.setPassword("12345678");
        return dmd;
    }

    @Bean
    public JdbcTemplate getQuery() {
        JdbcTemplate temp = new JdbcTemplate();
        temp.setDataSource(getDriver());
        return temp;
    }
}

