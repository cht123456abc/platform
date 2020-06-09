package cn.edu.scu.platform.service;

import cn.edu.scu.platform.entity.City;
import cn.edu.scu.platform.entity.Distribution;
import cn.edu.scu.platform.entity.Province;

import java.util.List;

public interface VisualizationService {
    public List<Province> getProvinceList();
    public List<City> getCityListByPId(Integer provinceId);
    public List<Distribution> getDistributionByCityId(Integer cityId);
}
