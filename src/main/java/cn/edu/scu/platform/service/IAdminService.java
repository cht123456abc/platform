package cn.edu.scu.platform.service;

import cn.edu.scu.platform.entity.Admin;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author cht
 * @since 2020-05-30
 */
public interface IAdminService extends IService<Admin> {

    String findPassword(String username);

    boolean changePassword(String username, String newPassword);
}
