package cn.edu.scu.platform.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
public class IndexController {
    Logger Log = LoggerFactory.getLogger(IndexController.class);

        @RequestMapping({"/",""})
        public String login(HttpServletRequest request) {
//            HttpSession session = request.getSession();
//            String username = (String) session.getAttribute("username");
//            if(username != null){
//                // 存在已登录账号信息，直接跳转登录页面
//                Log.info("跳转");
//                return "index";
//            }
            Log.info("返回登录页面");
            return "login";
        }

        @RequestMapping("/index")
        public String index() {
            Log.info("返回管理页面");
            return "index";
        }

}
