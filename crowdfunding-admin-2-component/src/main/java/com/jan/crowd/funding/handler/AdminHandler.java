package com.jan.crowd.funding.handler;

import com.github.pagehelper.PageInfo;
import com.jan.crowd.funding.entity.Admin;
import com.jan.crowd.funding.entity.ResultEntity;
import com.jan.crowd.funding.service.api.AdminService;
import com.jan.crowd.funding.util.CrowdFundingConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin")
@PreAuthorize(value = "hasRole('管理员')")
public class AdminHandler {

    @Autowired
    private AdminService adminService;

    /**
     * @Description:登录(引入spring-security后失效)
     * @Author: jan
     * @Date: 2019/12/26 11:15
     */
    @GetMapping("/do/login")
    public String doLogin(@RequestParam(value = "loginAccount") String loginAccount
            , @RequestParam(value = "userPassword") String userPassword
            , Model model
            , HttpSession session) {
        Admin admin = adminService.login(loginAccount, userPassword);
        //登录失败
        if (admin == null) {
            model.addAttribute(CrowdFundingConstant.ATTR_NAME_MESSAGE, CrowdFundingConstant.MESSAGE_LOGIN_FAILED);
            return "admin-login";
        }
        //登录成功
        session.setAttribute(CrowdFundingConstant.ATTR_NAME_LOGIN_ADMIN, admin);

        //WEB-INF内的文件浏览器无法直接访问，即无法直接重定向，要经过handler
        return "redirect:/back/index.html";
    }


    /**
     * @Description:退出登录(引入spring-security后失效)
     * @Author: jan
     * @Date: 2019/12/26 16:12
     */
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        //将session设置为失效
        session.invalidate();

        return "redirect:/back/login.html";
    }

    /**
     * @Description:用户分页
     * @Author: jan
     * @Date: 2019/12/28 9:37
     */
    // 如果页面上没有提供对应的请求参数，那么可以使用defaultValue指定默认值
    @GetMapping("/query")
    public String queryForSearch(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                                 @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
                                 @RequestParam(value = "keyword", defaultValue = "") String keyword,
                                 Model model) {
        PageInfo<Admin> adminPageInfo = adminService.queryForKeywordSearch(pageNum, pageSize, keyword);
        model.addAttribute(CrowdFundingConstant.ATTR_NAME_PAGE_INFO, adminPageInfo);
        return "admin-page";
    }

    /**
     * @param adminIdList
     * @Description:批量删除
     * @return: com.jan.crowd.funding.entity.ResultEntity
     * @Author: jan
     * @Date: 2019/12/31 9:59
     */
    @DeleteMapping("/remove")
    @ResponseBody
    public ResultEntity batchRemove(@RequestBody List<Integer> adminIdList) {
        try {
            adminService.batchRemove(adminIdList);
            return ResultEntity.successWithoutData();
        } catch (Exception e) {
            return ResultEntity.failed(null, e.getMessage());
        }
    }

    /**
     * @param admin
     * @Description:新增用户
     * @return: java.lang.String
     * @Author: jan
     * @Date: 2020/1/9 17:05
     */
    @PostMapping("/save")
    //使用Admin实体类对象封装表单提交的请求参数，具体每一个请求参数会通过对应的setXxx()方法注入实体类
    public String saveAdmin(Admin admin) {
        try {
            adminService.saveAdmin(admin);
        } catch (Exception e) {
            e.printStackTrace();
            if (e instanceof DuplicateKeyException) {
                throw new RuntimeException(CrowdFundingConstant.MESSAGE_LOGIN_ACCT_ALREADY_IN_USE);
            }
        }
        return "redirect:/admin/query.html";
    }

    /**
     * @Description:跳转到对应的更新页面，显示数据
     * @return: java.lang.String
     * @Author: jan
     * @Date: 2020/1/9 20:42
     */
    @GetMapping("/edit")
    public String toEditPage(@RequestParam("adminId") Integer adminId, Model model) {
        Admin admin = adminService.getAdminById(adminId);
        model.addAttribute("admin", admin);
        return "admin-edit";
    }

    /**
     * @Description:更新用户
     * @return: java.lang.String
     * @Author: jan
     * @Date: 2020/1/9 21:15
     */
    @PostMapping("/update")
    public String updateAdmin(Admin admin, @RequestParam("pageNum") String pageNum) {
        try {
            adminService.updateAdmin(admin);
        } catch (Exception e) {
            e.printStackTrace();
            if (e instanceof DuplicateKeyException) {
                throw new RuntimeException(CrowdFundingConstant.MESSAGE_LOGIN_ACCT_ALREADY_IN_USE);
            }
        }
        return "redirect:/admin/query.html?pageNum=" + pageNum;
    }
}
