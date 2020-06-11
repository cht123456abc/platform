package cn.edu.scu.platform.controller;


import cn.edu.scu.platform.entity.Account;
import cn.edu.scu.platform.entity.Employee;
import cn.edu.scu.platform.service.IAccountService;
import cn.edu.scu.platform.service.IEmployeeService;
import cn.edu.scu.platform.utils.ExcelExport;
import cn.edu.scu.platform.utils.R;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;



import javax.servlet.http.HttpServletResponse;

import java.util.*;

/**
 * <p>
 * 前端控制器
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
    public Map<String, Object> info(@PathVariable("id") Long id) {
        Log.info("待修改账号");
        Log.info("ID", id);
        Employee res = employeeService.selectEmployeeById(id);
        if (res == null) return R.error("获取用户信息失败");
        return R.ok().put("employee", res);
    }

    @RequestMapping("/save")
    public Map<String, Object> save(@RequestBody Employee employee) {
        Log.info("添加账号");
        Account account = employee.getAccount();
        if (accountService.addAccount(account) > 0) {
            // 添加成功,自动添加了id
            // 将id同时存入employee表中
            Log.info("添加账号成功");
            Long id = account.getId();
            Log.info("ID:" + id);
            employee.setId(id);
            if (employeeService.save(employee)) {
                Log.info("添加用户成功");
                return R.ok();
            } else {
                Log.info("添加用户失败");
                return R.error("添加用户失败");
            }
        } else {
            Log.info("添加账号失败");
            return R.error("添加账号失败");
        }
    }

    @RequestMapping("/delete")
    public Map<String, Object> delete(@RequestBody List<Long> ids) {
        Log.info("删除账号");
        ids.stream().forEach(id -> Log.info("ID" + id));
        if (employeeService.removeByIds(ids)) {
            Log.info("删除用户成功");
            if (accountService.removeByIds(ids)) {
                Log.info("删除账号成功");
                return R.ok();
            } else {
                Log.info("删除账号失败");
                return R.error("删除账号失败");
            }
        } else {
            Log.info("删除用户失败");
            return R.error("删除用户失败");
        }

    }

    @RequestMapping("/update")
    public Map<String, Object> update(@RequestBody Employee employee) {
        Log.info("更新账号");
        Long id = employee.getId();
        Log.info("ID:" + id);
        Account account = employee.getAccount();
        if (accountService.updateById(account)) {
            Log.info("更新账号成功");
            if (employeeService.updateById(employee)) {
                Log.info("更新用户成功");
                return R.ok();
            } else {
                Log.info("更新用户失败");
                return R.error("更新用户失败");
            }
        } else {
            Log.info("更新账号失败");
            return R.error("更新账号失败");
        }
    }

    @RequestMapping("/export")
    public R export(@RequestParam Map<String, Object> params, HttpServletResponse response) {

        List<Employee> employeeList = employeeService.selectAllEmployees();

        ExcelExport ee = new ExcelExport("用户列表");

        String[] header = new String[]{"账号", "名称", "性别", "年龄","手机号","详情"};

        List<Map<String, Object>> list = new ArrayList<>();

        if (employeeList != null && employeeList.size() != 0) {
            for (Employee employee : employeeList) {
                LinkedHashMap<String, Object> map = new LinkedHashMap<>();
                Account account = employee.getAccount();
                map.put("ACCOUNT", account.getAccount());
                map.put("NAME", account.getName());
                map.put("GENDER", account.getGender() == 1 ? "男" : (account.getGender() == 2 ? "女" : "未知"));
                map.put("AGE",account.getAge());
                map.put("PHONE_NUMBER", account.getPhoneNumber());
                map.put("DETAIL",account.getDetail());
                list.add(map);
            }
        }

        ee.addSheetByMap("用户", list, header);
        ee.export(response);
        return R.ok();
    }
}
