package cn.edu.scu.platform;

import cn.edu.scu.platform.entity.Account;
import cn.edu.scu.platform.entity.Admin;
import cn.edu.scu.platform.mapper.AdminMapper;
import cn.edu.scu.platform.service.IAccountService;
import cn.edu.scu.platform.service.impl.AccountServiceImpl;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.util.Assert;

import java.util.List;


@SpringBootTest
class PlatformApplicationTests {

    @Autowired
    private AdminMapper adminMapper;

    @Autowired
    private AccountServiceImpl accountService;


    @Test
    void test1() {
        List<Admin> userList = adminMapper.selectList(null);
        userList.forEach(System.out::println);
    }

    @Test
    void test2(){
        Account account = new Account();
        account.setAccount("123");
        account.setPassword("123");
        account.setName("ccc");
        System.out.println(account.getId());
        accountService.save(account);
        List<Account> list = accountService.list();
        list.forEach(System.out::println);
    }



    @Test
    void test3() {
        Account account = new Account();
        account.setAccount("123");
        account.setPassword("123");
        account.setName("111");
        int res = accountService.addAccount(account);
        System.out.println(res);
        System.out.println(account.getId());
    }
}
