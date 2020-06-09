package cn.edu.scu.platform.controller;


import cn.edu.scu.platform.entity.SysMenu;
import cn.edu.scu.platform.service.ISysMenuService;
import cn.edu.scu.platform.utils.Constant;
import cn.edu.scu.platform.utils.R;
import cn.edu.scu.platform.utils.RRException;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
@Data
@RestController
@RequestMapping("/sysMenu")
public class SysMenuController {

    @Autowired
    ISysMenuService sysMenuService;

    @RequestMapping("/list")
    public Map<String,Object> list(){
        List<SysMenu> list = sysMenuService.getAllMenuList();
        return R.ok().put("menuList",list);
    }

    @RequestMapping("/all")
    public Map<String,Object> all(@RequestParam Map<String, Object> params){
        List<SysMenu> list = sysMenuService.queryList(params);
        return R.ok().put("list",list);
    }

    /**
     * 选择菜单(添加、修改菜单)
     */
    @RequestMapping("/select")
    public R select() {
        //查询列表数据
        List<SysMenu> menuList = sysMenuService.queryNotButtonList();

        //添加顶级菜单
        SysMenu root = new SysMenu();
        root.setMenuId(0L);
        root.setName("一级菜单");
        root.setParentId(-1L);
        root.setOpen(true);
        menuList.add(root);

        return R.ok().put("menuList", menuList);
    }

    /**
     * 角色授权菜单
     */
//    @RequestMapping("/perms")
//    public R perms() {
//        //查询列表数据
//        List<SysMenu> menuList = null;
//
//        //只有超级管理员，才能查看所有管理员列表
//        if (getUserId() == Constant.SUPER_ADMIN) {
//            menuList = sysMenuService.queryList(new HashMap<String, Object>());
//        } else {
//            menuList = sysMenuService.queryUserList(getUserId());
//        }
//
//        return R.ok().put("menuList", menuList);
//    }

    /**
     * 菜单信息
     */
    @RequestMapping("/info/{menuId}")
    public R info(@PathVariable("menuId") Long menuId) {
        SysMenu menu = sysMenuService.queryObject(menuId);
        return R.ok().put("menu", menu);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody SysMenu menu) {
        //数据校验
        verifyForm(menu);

        sysMenuService.save(menu);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody SysMenu menu) {
        //数据校验
        verifyForm(menu);

        sysMenuService.update(menu);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] menuIds) {
        for (Long menuId : menuIds) {
            if (menuId <= 30) {
                return R.error("系统菜单，不能删除");
            }
        }
        sysMenuService.deleteBatch(menuIds);

        return R.ok();
    }

    /**
     * 用户菜单列表
     */
//    @RequestMapping("/user")
//    public R user() {
//        List<SysMenu> menuList = sysMenuService.getUserMenu(getUserId());
//
//        return R.ok().put("menuList", menuList);
//    }

    /**
     * 验证参数是否正确
     */
    private void verifyForm(SysMenu menu) {
        if (menu == null || menu.getName().isEmpty()) {
            throw new RRException("菜单名称不能为空");
        }

        if (menu.getParentId() == null) {
            throw new RRException("上级菜单不能为空");
        }

        //菜单
        if (menu.getType() == Constant.MenuType_Menu) {
            if (menu == null || menu.getUrl().isEmpty()) {
                throw new RRException("菜单URL不能为空");
            }
        }

        //上级菜单类型
        int parentType = Constant.MenuType_CATALOG;
        if (menu.getParentId() != 0) {
            SysMenu parentMenu = sysMenuService.queryObject(menu.getParentId());
            parentType = parentMenu.getType();
        }

        //目录、菜单
        if (menu.getType() == Constant.MenuType_CATALOG ||
                menu.getType() == Constant.MenuType_Menu) {
            if (parentType != Constant.MenuType_CATALOG) {
                throw new RRException("上级菜单只能为目录类型");
            }
            return;
        }

        //按钮
        if (menu.getType() == Constant.MenuType_Button) {
            if (parentType != Constant.MenuType_Menu) {
                throw new RRException("上级菜单只能为菜单类型");
            }
            return;
        }
    }
}
