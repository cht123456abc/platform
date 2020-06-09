package cn.edu.scu.platform.service.impl;

import cn.edu.scu.platform.entity.SysMenu;
import cn.edu.scu.platform.mapper.SysMenuMapper;
import cn.edu.scu.platform.service.ISysMenuService;
import cn.edu.scu.platform.utils.Constant;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 菜单管理 服务实现类
 * </p>
 *
 * @author cht
 * @since 2020-06-01
 */
@Service
public class SysMenuServiceImpl extends ServiceImpl<SysMenuMapper, SysMenu> implements ISysMenuService {


    /**
     * 获取所有菜单列表
     */
    public List<SysMenu> getAllMenuList(){
        //查询根菜单列表
        List<SysMenu> menuList = queryListParentId(0L);
        //递归获取子菜单
        getMenuTreeList(menuList);

        return menuList;
    }

    /**
     * 根据父节点ID查询所属孩子
     * @param parentId
     * @return
     */
    public List<SysMenu> queryListParentId(Long parentId) {
        List<SysMenu> menuList = baseMapper.queryListByParentId(parentId);
        return menuList;

    }

    /**
     * 递归
     */
    private List<SysMenu> getMenuTreeList(List<SysMenu> menuList){
        List<SysMenu> subMenuList = new ArrayList<SysMenu>();

        for(SysMenu entity : menuList){
            if(entity.getType() == Constant.MenuType_CATALOG){//目录
                entity.setList(getMenuTreeList(queryListParentId(entity.getMenuId())));
            }
            subMenuList.add(entity);
        }

        return subMenuList;
    }



    
    @Override
    public List<SysMenu> queryNotButtonList() {
        return baseMapper.queryNotButtonList();
    }

    @Override
    public SysMenu queryObject(Long menuId) {
        return baseMapper.queryObject(menuId);
    }

    @Override
    public void update(SysMenu menu) {
        baseMapper.update(menu);
    }

    @Override
    @Transactional
    public void deleteBatch(Long[] menuIds) {
        baseMapper.deleteBatch(menuIds);
    }


}
