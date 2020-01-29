package com.jan.crowd.funding.service.impl;

import com.jan.crowd.funding.config.SecurityAdmin;
import com.jan.crowd.funding.entity.Admin;
import com.jan.crowd.funding.entity.AdminExample;
import com.jan.crowd.funding.entity.Auth;
import com.jan.crowd.funding.entity.Role;
import com.jan.crowd.funding.mapper.AdminMapper;
import com.jan.crowd.funding.mapper.AuthMapper;
import com.jan.crowd.funding.mapper.RoleMapper;
import com.jan.crowd.funding.util.CrowdFundingUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

//security使用数据库查询
@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private AdminMapper adminMapper;

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private AuthMapper authMapper;

    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // 1.根据用户名从数据库查询Admin对象
        AdminExample adminExample = new AdminExample();
        adminExample.createCriteria().andLoginAccountEqualTo(username);

        List<Admin> adminList = adminMapper.selectByExample(adminExample);

        // 2.检查list是否有效
        if (!CrowdFundingUtils.collectionEffective(adminList)) {
            return null;
        }

        // 3.获取admin
        Admin admin = adminList.get(0);


        // 4.封装角色、权限信息
        // ①角色
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        Integer adminId = admin.getId();
        List<Role> roleList = roleMapper.selectAssignedRoleList(adminId);
        for (Role role : roleList) {
            String roleName = role.getName();
            // 注意：角色一定要加“ROLE_”,权限不用加
            authorities.add(new SimpleGrantedAuthority("ROLE_" + roleName));
        }

        // ②权限
        List<Auth> authList = authMapper.selectAssignedAuthList(adminId);
        for (Auth auth : authList) {
            String authName = auth.getName();
            //无效值
            if (!CrowdFundingUtils.stringEffective(authName)) {
                continue;
            }
            //不加前缀
            authorities.add(new SimpleGrantedAuthority(authName));
        }

        // 5.返回SecurityAdmin对象(security User的扩展)
        return new SecurityAdmin(admin, authorities);
    }
}
