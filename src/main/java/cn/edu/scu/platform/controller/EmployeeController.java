package cn.edu.scu.platform.controller;


import cn.edu.scu.platform.entity.Account;
import cn.edu.scu.platform.entity.Employee;
import cn.edu.scu.platform.service.IAccountService;
import cn.edu.scu.platform.service.IEmployeeService;
import cn.edu.scu.platform.utils.R;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import sun.rmi.runtime.Log;

import java.sql.Wrapper;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    Logger Log = LoggerFactory.getLogger(EmployeeController.class);

    @Autowired
    IEmployeeService employeeService;

    @Autowired
    IAccountService accountService;


    @RequestMapping("/list")
    public List<Employee> list() {
        List<Employee> list = employeeService.selectAllEmployees();
        return list;
    }

    @RequestMapping("/info/{id}")
    public Map<String, Object> info(@PathVariable("id") Long id){
        Log.info("待修改账号ID:" + id);
        Employee res = employeeService.selectEmployeeById(id);
        if(res == null) return R.error("获取用户信息失败");
        return R.ok().put("employee",res);
    }

    @RequestMapping("/save")
    public Map<String,Object> save(@RequestBody Employee employee){
        Log.info("添加账号");
        Account account = employee.getAccount();
        if(accountService.addAccount(account) > 0){
            // 添加成功,自动添加了id
            // 将id同时存入employee表中
            Log.info("添加账号成功");
            Long id = account.getId();
            Log.info("id:" + id);
            employee.setId(id);
            if(employeeService.save(employee)){
                Log.info("添加用户成功");
                return R.ok();
            }else{
                Log.info("添加用户失败");
                return R.error("添加用户失败");
            }
        }else {
            // 添加失败
            Log.info("添加账号失败");
            return R.error("添加账号失败");
        }
    }

    @RequestMapping("/update")
    public Map<String, Object> update(@RequestBody Employee employee){
        return null;
    }

}
