package cn.edu.scu.platform.mapper;

import cn.edu.scu.platform.entity.SysMenu;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 菜单管理 Mapper 接口
 * </p>
 *
 * @author cht
 * @since 2020-06-01
 */
public interface SysMenuMapper extends BaseMapper<SysMenu> {

    List<SysMenu> queryListByParentId(Long parentId);

    List<SysMenu> queryNotButtonList();

    SysMenu queryObject(Long menuId);

    void deleteBatch(Long[] menuIds);

    void update(SysMenu menu);

    List<SysMenu> queryList(Map<String, Object> params);
}
