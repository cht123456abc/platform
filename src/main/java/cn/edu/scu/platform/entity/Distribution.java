package cn.edu.scu.platform.entity;

import lombok.Data;

@Data
public class Distribution {
    private Integer id;
    private Integer totalNum;
    private Integer positionId;
    private String positionName;
    private Integer cityId;
    private String cityName;
}
