package cn.edu.scu.platform.mapper;

import cn.edu.scu.platform.entity.Admin;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;


public interface AdminMapper extends BaseMapper<Admin> {
    String findPassword(String username);

    boolean changePassword(String username, String newPassword);
}
