package com.jan.crowd.funding.service.api;

import com.github.pagehelper.PageInfo;
import com.jan.crowd.funding.entity.Admin;

import java.util.List;

public interface AdminService {
    List<Admin> getAll();

    Admin login(String loginAccount, String userPassword);

    PageInfo<Admin> queryForKeywordSearch(Integer pageNum, Integer pageSize, String keyword);

    void batchRemove(List<Integer> adminIdList);

    void saveAdmin(Admin admin);

    Admin getAdminById(Integer adminId);

    void updateAdmin(Admin admin);
}
