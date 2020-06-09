package cn.edu.scu.platform.service;

import cn.edu.scu.platform.entity.SysMenu;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

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

    List<SysMenu> queryNotButtonList();

    SysMenu queryObject(Long menuId);

    void deleteBatch(Long[] menuIds);

    void update(SysMenu menu);

    List<SysMenu> queryList(Map<String, Object> params);
}
