package com.jan.crowd.funding;

import com.github.pagehelper.PageInfo;
import com.jan.crowd.funding.entity.Admin;
import com.jan.crowd.funding.handler.AdminHandler;
import com.jan.crowd.funding.service.api.AdminService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.sql.DataSource;
import java.lang.annotation.Target;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-persist-mybatis.xml", "classpath:spring-persist-tx.xml", "classpath:spring-web-mvc.xml"})
public class CrowdingfundingTest {

    @Autowired
    private DataSource dataSource;

    @Autowired
    private AdminService adminService;

    @Test
    public void testMybatis() {
        List<Admin> adminList = adminService.getAll();
        for (Admin admin : adminList) {
            System.out.println(admin);
        }
    }

    @Test
    public void testConnectioin() throws SQLException {
        Connection connection = dataSource.getConnection();
        System.out.print(connection);
    }

    @Test
    public void testPage() {
        PageInfo<Admin> adminPageInfo = adminService.queryForKeywordSearch(5, 1, "");
        System.out.print(adminPageInfo);
    }

    @Test
    public void testPassword() {
        Admin admin = new Admin();
        admin.setUserPassword("123123");
        admin.setId(1);
        admin.setEmail("4357708@qq.com");
        admin.setLoginAccount("jan");
        admin.setUserName("小简");
        adminService.saveAdmin(admin);
    }
}
