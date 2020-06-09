package cn.edu.scu.platform.mapper;

import cn.edu.scu.platform.entity.City;
import cn.edu.scu.platform.entity.Distribution;
import cn.edu.scu.platform.entity.Province;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("visualizationMapper")
public interface VisualizationMapper {
    public List<Province> getProvinceList();
    public List<City> getCityListByPId(Integer provinceId);
    public List<Distribution> getDistributionByCityId(Integer cityId);
}
