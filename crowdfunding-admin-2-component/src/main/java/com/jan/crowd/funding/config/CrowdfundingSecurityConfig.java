package com.jan.crowd.funding.config;

import com.jan.crowd.funding.exception.CrowdFundingAccessDeniedHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

//spring security配置类
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class CrowdfundingSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailsService userDetailsServiceImpl;

    //spring在真正调用方法前会检查IOC容器是否已经有了对应的bean,有就不会调用,而是把IOC容器中bean返回
    @Bean
    public BCryptPasswordEncoder getPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder builder) throws Exception {
        //启用数据库验证、spring security默认加密方式
        builder.userDetailsService(userDetailsServiceImpl)
                .passwordEncoder(getPasswordEncoder());
    }

    @Override
    protected void configure(HttpSecurity security) throws Exception {
        security.authorizeRequests()
                .antMatchers("/assets/**", "/css/**", "/layer/**", "/img/**", "/lib/**", "/ztree/**")  //静态资源放行
                .permitAll()
                .anyRequest()   //其他访问要认证
                .authenticated()
                .and()  //记住我
                .rememberMe()
                .and()   //访问被拒绝界面(403)
                .exceptionHandling()
                .accessDeniedHandler(new CrowdFundingAccessDeniedHandler())
                .and()
                .formLogin()    //表单登录信息相关的
                .loginPage("/back/login.html")
                .permitAll()
                .loginProcessingUrl("/back/security/login.html") //登录地址
                .permitAll()
                .usernameParameter("loginAccount")  //设置登录表单的name
                .passwordParameter("userPassword")
                .defaultSuccessUrl("/back/index.html") //默认登录成功去的页面
                .and()
                .logout()     //设置退出信息
                .logoutUrl("/back/security/logout.html")
                .logoutSuccessUrl("/back/login.html")

                .and()
                .csrf()
                .disable() //暂时禁用csrf功能,csrf可以避免跨站请求伪造
        ;

    }
}


