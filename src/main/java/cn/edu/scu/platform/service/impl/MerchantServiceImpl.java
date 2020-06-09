package cn.edu.scu.platform.service.impl;

import cn.edu.scu.platform.entity.Merchant;
import cn.edu.scu.platform.mapper.MerchantMapper;
import cn.edu.scu.platform.service.IMerchantService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author cht
 * @since 2020-05-30
 */
@Service
public class MerchantServiceImpl extends ServiceImpl<MerchantMapper, Merchant> implements IMerchantService {
    @Autowired
    private MerchantMapper merchantMapper;

    public List<Merchant> selectAllMerchant(){
        return merchantMapper.selectAllMerchant();
    }

    public Merchant selectMerchantById(Long id){
        return merchantMapper.selectMerchantById(id);
    }
}
