package cn.edu.scu.platform.controller;


import cn.edu.scu.platform.entity.SysMenu;
import cn.edu.scu.platform.service.ISysMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 菜单管理 前端控制器
 * </p>
 *
 * @author cht
 * @since 2020-06-01
 */
@RestController
@RequestMapping("/sysMenu")
public class SysMenuController {

    @Autowired
    ISysMenuService sysMenuService;

    @RequestMapping("/list")
    public Map<String,Object> list(){
        List<SysMenu> list = sysMenuService.getAllMenuList();
        Map<String, Object> res = new HashMap<>();
        res.put("menuList",list);
        return res;
    }

}
