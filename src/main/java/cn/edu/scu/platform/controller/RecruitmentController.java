package cn.edu.scu.platform.controller;


import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;

import cn.edu.scu.platform.entity.Recruitment;
import cn.edu.scu.platform.service.IRecruitmentService;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author cht
 * @since 2020-05-30
 */
@RestController
@RequestMapping("pages/recruitment")
public class RecruitmentController {
	
	@Autowired
	private IRecruitmentService recruitmentService;
	
	@RequestMapping("/list")
	@ResponseBody
    public List<Recruitment> list(@RequestParam Map<String, Object> params) {
//		Map<String,Object> map = new HashMap<String, Object>();
//      try {
//      	List<Recruitment> recruitments =  recruitmentService.list();
//      	map.put("recruitments",recruitments);
//          return map;
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return null;
		QueryWrapper query = new QueryWrapper(params);
		if("".equals(params.get("title")) || params.get("title")==null) {
			query = null;
		}
		List<Recruitment> recruitments =  recruitmentService.list(query);
		return recruitments;
//		//查询列表数据
//		QueryWrapper query = new QueryWrapper(params);
//        List<Recruitment> recruitments =  recruitmentService.list(query);
//        return recruitments;
		
		
		
//		Map<String,Object> map = new HashMap<String, Object>();
//        try {
//        	List<Recruitment> recruitments =  recruitmentService.list();
//        	map.put("formValidate",recruitments);
//            return map;
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return null;
    }
	
	/**
     * 查看信息
     */
    @RequestMapping("/info/{id}")
    @ResponseBody
    public Map<String,Object> info(@PathVariable("id") Integer id) {
    	
    	Map<String,Object> map = new HashMap<String, Object>();
        try {
	    	Recruitment recruitment = recruitmentService.getById(id);
	      	map.put("recruitment",recruitment);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public Map<String,Object> save(@RequestBody Recruitment recruitment) {
    	Map<String,Object> map = new HashMap<String, Object>();
    	try {
    		recruitmentService.save(recruitment);
	      	map.put("status",1);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("status",0);
		}
        return map;
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public Map<String,Object> update(@RequestBody Recruitment recruitment) {
    	Map<String,Object> map = new HashMap<String, Object>();
    	try {
    		recruitmentService.saveOrUpdate(recruitment);
	      	map.put("status",1);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("status",0);
		}
        return map;
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public Map<String,Object> delete(@RequestBody Integer[] ids) {
    	List<Integer> list = Arrays.asList(ids);
    	Map<String,Object> map = new HashMap<String, Object>();
    	try {
    		recruitmentService.removeByIds(list);
	      	map.put("status",1);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("status",0);
		}
        return map;
    }
	
	
}
