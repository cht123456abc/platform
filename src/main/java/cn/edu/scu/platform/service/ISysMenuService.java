package cn.edu.scu.platform.service;

import cn.edu.scu.platform.entity.SysMenu;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 菜单管理 服务类
 * </p>
 *
 * @author cht
 * @since 2020-06-01
 */
public interface ISysMenuService extends IService<SysMenu> {

    List<SysMenu> getAllMenuList();

}
