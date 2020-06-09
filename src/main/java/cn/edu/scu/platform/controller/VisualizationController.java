package cn.edu.scu.platform.controller;

import cn.edu.scu.platform.entity.City;
import cn.edu.scu.platform.entity.Distribution;
import cn.edu.scu.platform.entity.Province;
import cn.edu.scu.platform.service.VisualizationService;
import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/visualization")
public class VisualizationController {
    @Resource
    private VisualizationService visualizationService;

    @RequestMapping("/getProvince")
    @ResponseBody
    public String getProvince(){
        List<Province> provinceList = visualizationService.getProvinceList();
        return JSON.toJSONString(provinceList);
    }

    @RequestMapping("/getCity")
    @ResponseBody
    public String getCity(Integer id){
        List<City> cityList = visualizationService.getCityListByPId(id);
        return JSON.toJSONString(cityList);
    }

    @RequestMapping("/getCityLocationProportion")
    @ResponseBody
    public String getCityLocationProportion(Integer id){
        System.out.println("in");
        List<Distribution> distributionList = visualizationService.getDistributionByCityId(id);
        List<Map<String,String>> mapList = new ArrayList<>();
        for (Distribution distribution:distributionList){
            Map<String,String> map = new HashMap<>();
            map.put("value",distribution.getTotalNum().toString());
            map.put("name",distribution.getPositionName());
            mapList.add(map);
        }
        return JSON.toJSONString(mapList);
    }
}
