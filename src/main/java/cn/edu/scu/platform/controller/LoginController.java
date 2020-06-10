package cn.edu.scu.platform.controller;

import cn.edu.scu.platform.entity.Admin;
import cn.edu.scu.platform.service.IAdminService;
import cn.edu.scu.platform.utils.R;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
public class LoginController {

    Logger Log = LoggerFactory.getLogger(LoginController.class);

    @Autowired
    IAdminService adminService;

    @RequestMapping("/login")
    public R login(String username,String password) {
        if (username == null) {
            return R.error("账号为空");
        }
        if (password == null) {
            return R.error("密码为空");
        }

        String password0 = adminService.findPassword(username);
        if(password0 == null) {
            return R.error("没有该账号");
        }else{
            if (password.equals(password0)) {
                return R.ok();
            } else {
                return R.error("密码错误");
            }
        }
    }

}
