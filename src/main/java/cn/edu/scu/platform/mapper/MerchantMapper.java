package cn.edu.scu.platform.mapper;

import cn.edu.scu.platform.entity.Merchant;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author cht
 * @since 2020-05-30
 */
public interface MerchantMapper extends BaseMapper<Merchant> {
    List<Merchant> selectAllMerchant();

    Merchant selectMerchantById(Long id);

}
