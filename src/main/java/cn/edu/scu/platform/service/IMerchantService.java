package cn.edu.scu.platform.service;

import cn.edu.scu.platform.entity.Merchant;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author cht
 * @since 2020-05-30
 */
public interface IMerchantService extends IService<Merchant> {
    List<Merchant> selectAllMerchant();

    Merchant selectMerchantById(Long id);

}
