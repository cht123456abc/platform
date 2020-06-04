package cn.edu.scu.platform.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class IndexController {
    Logger Log = LoggerFactory.getLogger(IndexController.class);

        @RequestMapping({"/"," "})
        public String index() {
            Log.info("返回起始页面");
            return "index";
        }


}
