package it.lukaszkoziol.springsecurity.config;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.sql.DataSource;
import java.beans.PropertyVetoException;
import java.util.logging.Logger;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "it.lukaszkoziol.springsecurity")
@PropertySource("classpath:persistence-mysql.properties")
public class AppConfig {

    //set up variable to hold the properties
    @Autowired
    private Environment environment;

    //set up a logger for diagnostics
    private Logger logger = Logger.getLogger(getClass().getName());

    //define a bean for ViewResolver
    @Bean
    public ViewResolver viewResolver() {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();

        viewResolver.setPrefix("/WEB-INF/view/");
        viewResolver.setSuffix(".jsp");
        return viewResolver;
    }

    //define a bean for our security datasource
    @Bean
    public DataSource securityDataSource() {
        // create connection pool
        ComboPooledDataSource securityDataSource = new ComboPooledDataSource();

        // set the jdbc driver class
        try {
            securityDataSource.setDriverClass(environment.getProperty("jdbc.driver"));
        } catch (PropertyVetoException e) {
            e.printStackTrace();
        }
        // log the connection properties --> just for info
        logger.info(">>> jdbc.url=" + environment.getProperty("jdbc.url"));
        logger.info(">>> jdbc.user=" + environment.getProperty("jdbc.user"));

        // set database connection properties
        securityDataSource.setJdbcUrl(environment.getProperty("jdbc.url"));
        securityDataSource.setUser(environment.getProperty("jdbc.user"));
        securityDataSource.setPassword(environment.getProperty("jdbc.password"));

        // set connection pool properties
        securityDataSource.setInitialPoolSize(getIntProperty("connection.pool.initialPoolSize"));
        securityDataSource.setMinPoolSize(getIntProperty("connection.pool.minPoolSize"));
        securityDataSource.setMaxPoolSize(getIntProperty("connection.pool.maxPoolSize"));
        securityDataSource.setMaxIdleTime(getIntProperty("connection.pool.maxIdleTime"));

        return securityDataSource;
    }
    //helper method
    //read environment property and convert to int
    private int getIntProperty(String propertyName) {
        String propVal = environment.getProperty(propertyName);
        //convert to int
        assert propVal != null;
        return Integer.parseInt(propVal);
    }
}
