package com.jan.crowd.funding.handler;

import com.github.pagehelper.PageInfo;
import com.jan.crowd.funding.entity.ResultEntity;
import com.jan.crowd.funding.entity.Role;
import com.jan.crowd.funding.service.api.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/role")
@PreAuthorize(value = "hasRole('管理员')")
public class RoleHandler {

    @Autowired
    private RoleService roleService;

    /**
     * @Description:模态框显示列表
     * @return: com.jan.crowd.funding.entity.ResultEntity<java.util.List                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               <                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               com.jan.crowd.funding.entity.Role>>
     * @Author: jan
     * @Date: 2020/1/14 22:24
     */
    @PostMapping("/list")
    public ResultEntity<List<Role>> getRoleListByIdList(@RequestBody List<Integer> roleIdList) {
        List<Role> roleList = roleService.getRoleListByIdList(roleIdList);
        return ResultEntity.successWithData(roleList);
    }

    /**
     * @Description:分页取角色信息
     * @return: com.jan.crowd.funding.entity.ResultEntity<com.github.pagehelper.PageInfo                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               <                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               com.jan.crowd.funding.entity.Role>>
     * @Author: jan
     * @Date: 2020/1/14 22:23
     */
    @GetMapping("/query")
    public ResultEntity<PageInfo<Role>> search(
            @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
            @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
            @RequestParam(value = "keyword", defaultValue = "") String keyword) {
        // 1.查询得到PageInfo对象
        PageInfo<Role> pageInfo = roleService.queryForKeywordWithPage(pageNum, pageSize, keyword);
        // 2.封装结果对象返回
        return ResultEntity.successWithData(pageInfo);
    }

    /**
     * @Description:批量删除
     * @return: com.jan.crowd.funding.entity.ResultEntity<java.lang.String>
     * @Author: jan
     * @Date: 2020/1/15 21:16
     */
    @DeleteMapping("/remove")
    public ResultEntity<String> batchRemove(@RequestBody List<Integer> roleIdList) {
        roleService.batchRemove(roleIdList);
        return ResultEntity.successWithoutData();
    }

    /**
     * @Description:增加角色
     * @return: com.jan.crowd.funding.entity.ResultEntity<java.lang.String>
     * @Author: jan
     * @Date: 2020/1/15 22:14
     */
    @PostMapping("/save")
    public ResultEntity<String> saveRole(@RequestParam("roleName") String roleName) {
        roleService.saveRole(roleName);
        return ResultEntity.successWithoutData();
    }

    /**
     * @Description:更新角色
     * @return: com.jan.crowd.funding.entity.ResultEntity<java.lang.String>
     * @Author: jan
     * @Date: 2020/1/15 22:47
     */
    @PatchMapping("/update")
    public ResultEntity<String> updateRole(@RequestBody Role role) {
        roleService.updateRole(role);
        return ResultEntity.successWithoutData();
    }

}
