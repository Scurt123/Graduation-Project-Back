package com.jan.crowd.funding.service.api;

import com.github.pagehelper.PageInfo;
import com.jan.crowd.funding.entity.Role;

import java.util.List;

public interface RoleService {

    PageInfo<Role> queryForKeywordWithPage(Integer pageNum, Integer pageSize, String keyword);

    List<Role> getRoleListByIdList(List<Integer> roleIdList);

    void batchRemove(List<Integer> roleIdList);

    void saveRole(String roleName);

    void updateRole(Role role);

    List<Role> getAssignedRoleList(Integer adminId);

    List<Role> getUnAssignedRoleList(Integer adminId);

    void updateRelationship(Integer adminId, List<Integer> roleIdList);
}
