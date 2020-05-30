package cn.edu.scu.platform.entity;

import java.math.BigDecimal;
import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 
 * </p>
 *
 * @author cht
 * @since 2020-05-30
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class Recruitment implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId
    private Long id;

    private Long merchantId;

    private Integer checked;

    private String title;

    private BigDecimal salary;

    private String detail;

    private String vocation;


}
