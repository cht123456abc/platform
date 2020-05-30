package cn.edu.scu.platform.service.impl;

import cn.edu.scu.platform.entity.Account;
import cn.edu.scu.platform.mapper.AccountMapper;
import cn.edu.scu.platform.service.IAccountService;
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
public class AccountServiceImpl extends ServiceImpl<AccountMapper, Account> implements IAccountService {


    public int addAccount(Account account){
        return baseMapper.insert(account);// 插入并返回自增id
    }
}
