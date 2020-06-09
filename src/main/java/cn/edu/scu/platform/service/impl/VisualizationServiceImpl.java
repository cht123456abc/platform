package cn.edu.scu.platform.service.impl;

import cn.edu.scu.platform.entity.City;
import cn.edu.scu.platform.entity.Distribution;
import cn.edu.scu.platform.entity.Province;
import cn.edu.scu.platform.mapper.VisualizationMapper;
import cn.edu.scu.platform.service.VisualizationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("visualizationService")
public class VisualizationServiceImpl implements VisualizationService {
    @Resource
    private VisualizationMapper visualizationMapper;

    @Override
    public List<Province> getProvinceList() {
        return visualizationMapper.getProvinceList();
    }

    @Override
    public List<Distribution> getDistributionByCityId(Integer cityId) {
        return visualizationMapper.getDistributionByCityId(cityId);
    }

    @Override
    public List<City> getCityListByPId(Integer provinceId) {
        return visualizationMapper.getCityListByPId(provinceId);
    }
}
