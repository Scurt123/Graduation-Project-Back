package com.jan.crowd.funding.handler;

import com.jan.crowd.funding.entity.Auth;
import com.jan.crowd.funding.entity.ResultEntity;
import com.jan.crowd.funding.entity.Role;
import com.jan.crowd.funding.service.api.AuthService;
import com.jan.crowd.funding.service.api.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/assign")
@PreAuthorize(value = "hasRole('管理员')")
public class AssignHandler {
    @Autowired
    private RoleService roleService;

    @Autowired
    private AuthService authService;

    /**
     * @Description:分配权限
     * @return: com.jan.crowd.funding.entity.ResultEntity<java.lang.String>
     * @Author: jan
     * @Date: 2020/1/18 22:29
     */
    @ResponseBody
    @PatchMapping("/do/assign")
    public ResultEntity<String> doRoleAssignAuth(
            @RequestBody Map<String, List<Integer>> assignDataMap) {
        authService.updateRelationShipBetweenRoleAndAuth(assignDataMap);
        return ResultEntity.successWithoutData();
    }

    /**
     * @Description:回显角色已分配权限
     * @return: com.jan.crowd.funding.entity.ResultEntity<java.util.List       <       java.lang.Integer>>
     * @Author: jan
     * @Date: 2020/1/18 22:07
     */
    @ResponseBody
    @GetMapping("/get/assigned/auth")
    public ResultEntity<List<Integer>> getAssignedAuthIdList(@RequestParam("roleId") Integer roleId) {
        List<Integer> authIdList = authService.getAssignedAuthIdList(roleId);
        return ResultEntity.successWithData(authIdList);
    }

    /**
     * @Description:角色显示权限
     * @return: com.jan.crowd.funding.entity.ResultEntity<java.util.List                               <                               com.jan.crowd.funding.entity.Auth>>
     * @Author: jan
     * @Date: 2020/1/18 21:40
     */
    @ResponseBody
    @GetMapping("/get/all/auth")
    public ResultEntity<List<Auth>> getAllAuth() {
        List<Auth> authList = authService.getAllAuth();
        return ResultEntity.successWithData(authList);
    }

    /**
     * @Description:跳转到分配角色页面
     * @return: java.lang.String
     * @Author: jan
     * @Date: 2020/1/17 22:27
     */
    @RequestMapping("/role/page")
    public String assignRolePage(@RequestParam("adminId") Integer adminId, Model model) {
        // 1.查询已分配角色
        List<Role> assignedRoleList = roleService.getAssignedRoleList(adminId);
        // 2.查询未分配角色
        List<Role> unAssignedRoleList = roleService.getUnAssignedRoleList(adminId);

        // 3.存入模型
        model.addAttribute("assignedRoleList", assignedRoleList);
        model.addAttribute("unAssignedRoleList", unAssignedRoleList);

        return "assign-role";
    }

    /**
     * @Description:分配用户角色
     * @return: java.lang.String
     * @Author: jan
     * @Date: 2020/1/17 22:28
     */
    @RequestMapping("/role")
    public String doAssignRole(
            // roleIdList不一定每一次都能够提供，没有提供我们也接受
            @RequestParam(value = "roleIdList", required = false) List<Integer> roleIdList,
            @RequestParam("adminId") Integer adminId,
            @RequestParam("pageNum") String pageNum) {

        roleService.updateRelationship(adminId, roleIdList);
        return "redirect:/admin/query.html?pageNum=" + pageNum;
    }


}
