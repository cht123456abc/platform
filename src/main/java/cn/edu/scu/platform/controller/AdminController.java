package cn.edu.scu.platform.controller;


import cn.edu.scu.platform.service.IAdminService;
import cn.edu.scu.platform.utils.R;
import org.apache.catalina.filters.ExpiresFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author cht
 * @since 2020-05-30
 */
@RestController
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private IAdminService adminService;

    @RequestMapping("password")
    public R changePassword(String password, String newPassword, HttpServletRequest request) {

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        // 先判断账号密码是否正确
        String password0 = adminService.findPassword(username);
        if (password.equals(password0)) {
            if (adminService.changePassword(username, newPassword)) {
                return R.ok();
            } else {
                return R.error("修改密码有误");
            }
        }else{
            return R.error("原密码错误");
        }
    }
}
