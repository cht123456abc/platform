package cn.edu.scu.platform.service.impl;

import cn.edu.scu.platform.entity.Admin;
import cn.edu.scu.platform.mapper.AdminMapper;
import cn.edu.scu.platform.service.IAdminService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author cht
 * @since 2020-05-30
 */
@Service
public class AdminServiceImpl extends ServiceImpl<AdminMapper, Admin> implements IAdminService {

    @Override
    public String findPassword(String username) {
        return baseMapper.findPassword(username);
    }

    @Override
    public boolean changePassword(String username, String newPassword) {
        return baseMapper.changePassword(username,newPassword);
    }
}
