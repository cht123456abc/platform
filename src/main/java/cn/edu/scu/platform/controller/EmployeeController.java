package cn.edu.scu.platform.controller;


import cn.edu.scu.platform.entity.Account;
import cn.edu.scu.platform.entity.Employee;
import cn.edu.scu.platform.service.IAccountService;
import cn.edu.scu.platform.service.IEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.sql.Wrapper;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author cht
 * @since 2020-05-30
 */
@RestController
@RequestMapping("/employee")
public class EmployeeController {

    @Autowired
    IEmployeeService employeeService;

    @Autowired
    IAccountService accountService;


    @RequestMapping("/list")
    public String list() {
        List<Employee> res =  employeeService.list();
        return res.toString();
    }

    @RequestMapping("/save")
    public String save(String account,String password){
        Account newAccount = new Account();
        newAccount.setAccount(account);
        newAccount.setPassword(password);
        accountService.save(newAccount);


        return accountService.list().toString();
    }

}
