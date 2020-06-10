package cn.edu.scu.platform.controller;

import cn.edu.scu.platform.entity.Admin;
import cn.edu.scu.platform.service.IAdminService;
import cn.edu.scu.platform.utils.R;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

@RestController
public class LoginController {

    Logger Log = LoggerFactory.getLogger(LoginController.class);

    @Autowired
    IAdminService adminService;

    // TODO: 2020/6/10 可以继续更新为 redis存储会话，并使用shiro安全框架。
    @RequestMapping("/login")
    public R login(String username, String password, HttpServletRequest request) {
        if (username == null) {
            return R.error("账号为空");
        }
        if (password == null) {
            return R.error("密码为空");
        }

        String password0 = adminService.findPassword(username);
        if (password0 == null) {
            return R.error("没有该账号");
        } else {
            if (password.equals(password0)) {
                // 将登录成功的账号记录入session中
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                return R.ok();
            } else {
                return R.error("密码错误");
            }
        }
    }

    @RequestMapping("/logout")
    public R logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        // 清空会话
        session.removeAttribute("username");
        session.removeAttribute("password");
        session.invalidate();


        // 跳转
        return R.ok();

    }
}
