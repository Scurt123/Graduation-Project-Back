package com.jan.crowd.funding.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jan.crowd.funding.entity.Admin;
import com.jan.crowd.funding.entity.AdminExample;
import com.jan.crowd.funding.mapper.AdminMapper;
import com.jan.crowd.funding.service.api.AdminService;
import com.jan.crowd.funding.util.CrowdFundingUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public List<Admin> getAll() {
        return adminMapper.selectByExample(new AdminExample());
    }

    public Admin login(String loginAccount, String userPassword) {
        //使用AdminExample封装查询条件
        AdminExample adminExample = new AdminExample();
        adminExample.createCriteria().andLoginAccountEqualTo(loginAccount);

        List<Admin> adminList = adminMapper.selectByExample(adminExample);
        //如果查询结果集合无效，则直接返回null
        if (!CrowdFundingUtils.collectionEffective(adminList)) {
            return null;
        }

        // 获取唯一集合元素
        Admin admin = adminList.get(0);

        // 比较密码
        String userPswdDataBase = admin.getUserPassword();
        String userPswdBroswer = CrowdFundingUtils.md5(userPassword);
        if (userPswdDataBase.equals(userPswdBroswer)) {
            // 如果两个密码相等那么说明登录能够成功，返回Admin对象
            return admin;
        }

        return null;
    }

    public PageInfo<Admin> queryForKeywordSearch(Integer pageNum, Integer pageSize, String keyword) {
        // 1.调用PageHelper的工具方法，开启分页功能
        PageHelper.startPage(pageNum, pageSize);

        // 2.执行分页查询
        List<Admin> list = adminMapper.selectAdminListKeyword(keyword);

        // 3.将list封装到PageInfo对象中
        return new PageInfo<Admin>(list);
    }

    public void batchRemove(List<Integer> adminIdList) {
        // QBC：Query By Criteria

        // 创建AdminExample对象（不要管Example单词是什么意思，它没有意思）
        AdminExample adminExample = new AdminExample();

        // 创建Criteria对象（不要管Criteria单词是什么意思，它没有意思）
        // Criteria对象可以帮助我们封装查询条件
        // 通过使用Criteria对象，可以把Java代码转换成SQL语句中WHERE子句里面的具体查询条件
        AdminExample.Criteria criteria = adminExample.createCriteria();

        // 针对要查询的字段封装具体的查询条件
        criteria.andIdIn(adminIdList);

        // 执行具体操作时把封装了查询条件的Example对象传入
        adminMapper.deleteByExample(adminExample);

    }

    public void saveAdmin(Admin admin) {
        // 对密码进行加密
        String userPswd = admin.getUserPassword();
        userPswd = passwordEncoder.encode(userPswd);
        admin.setUserPassword(userPswd);

        // 执行保存
        adminMapper.insert(admin);
    }

    public Admin getAdminById(Integer adminId) {
        return adminMapper.selectByPrimaryKey(adminId);
    }

    public void updateAdmin(Admin admin) {
        // 对密码进行加密
        String userPswd = admin.getUserPassword();
        userPswd = CrowdFundingUtils.md5(userPswd);
        admin.setUserPassword(userPswd);

        adminMapper.updateByPrimaryKey(admin);
    }
}
