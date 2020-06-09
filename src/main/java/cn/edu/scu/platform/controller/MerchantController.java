package cn.edu.scu.platform.controller;


import cn.edu.scu.platform.entity.Account;
import cn.edu.scu.platform.entity.Merchant;
import cn.edu.scu.platform.service.IAccountService;
import cn.edu.scu.platform.service.IMerchantService;
import cn.edu.scu.platform.utils.ExcelExport;
import cn.edu.scu.platform.utils.R;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.LinkedHashMap;
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
@RequestMapping("/merchant")
public class MerchantController {
    Logger Log = LoggerFactory.getLogger(MerchantController.class);

    @Autowired
    IMerchantService merchantService;

    @Autowired
    IAccountService accountService;


    @RequestMapping("/list")
    public List<Merchant> list() {
        List<Merchant> list = merchantService.selectAllMerchant();
        return list;
    }

    @RequestMapping("/info/{id}")
    public Map<String, Object> info(@PathVariable("id") Long id) {
        Log.info("待修改账号");
        Log.info("ID", id);
        Merchant res = merchantService.selectMerchantById(id);
        if (res == null) return R.error("获取商户信息失败");
        return R.ok().put("merchant", res);
    }

    @RequestMapping("/save")
    public Map<String, Object> save(@RequestBody Merchant merchant) {
        Log.info("添加账号");
        Account account = merchant.getAccount();
        if (accountService.addAccount(account) > 0) {
            // 添加成功,自动添加了id
            // 将id同时存入employee表中
            Log.info("添加账号成功");
            Long id = account.getId();
            Log.info("ID:" + id);
            merchant.setId(id);
            if (merchantService.save(merchant)) {
                Log.info("添加商户成功");
                return R.ok();
            } else {
                Log.info("添加商户失败");
                return R.error("添加商户失败");
            }
        } else {
            Log.info("添加商户失败");
            return R.error("添加商户失败");
        }
    }

    @RequestMapping("/delete")
    public Map<String, Object> delete(@RequestBody List<Long> ids) {
        Log.info("删除账号");
        ids.stream().forEach(id -> Log.info("ID" + id));
        if (merchantService.removeByIds(ids)) {
            Log.info("删除商户成功");
            if (accountService.removeByIds(ids)) {
                Log.info("删除账号成功");
                return R.ok();
            } else {
                Log.info("删除账号失败");
                return R.error("删除账号失败");
            }
        } else {
            Log.info("删除商户失败");
            return R.error("删除商户失败");
        }

    }

    @RequestMapping("/update")
    public Map<String, Object> update(@RequestBody Merchant merchant) {
        Log.info("更新账号");
        Long id = merchant.getId();
        Log.info("ID:" + id);
        Account account = merchant.getAccount();
        if (accountService.updateById(account)) {
            Log.info("更新账号成功");
//            if (employeeService.updateById(employee)) {
//                Log.info("更新用户成功");
//                return R.ok();
//            } else {
//                Log.info("更新用户失败");
//                return R.error("更新用户失败");
//            }
            return R.ok();
        } else {
            Log.info("更新账号失败");
            return R.error("更新账号失败");
        }
    }

    @RequestMapping("/export")
    public R export(@RequestParam Map<String, Object> params, HttpServletResponse response) {

        List<Merchant> merchantList = merchantService.selectAllMerchant();

        ExcelExport ee = new ExcelExport("用户列表");

        String[] header = new String[]{"账号", "名称", "性别", "年龄","手机号","详情"};

        List<Map<String, Object>> list = new ArrayList<>();

        if (merchantList != null && merchantList.size() != 0) {
            for (Merchant merchant : merchantList) {
                LinkedHashMap<String, Object> map = new LinkedHashMap<>();
                Account account = merchant.getAccount();
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
