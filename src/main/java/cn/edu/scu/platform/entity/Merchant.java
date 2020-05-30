package cn.edu.scu.platform.entity;

import java.time.LocalDateTime;
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
public class Merchant implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId
    private Long id;

    private Integer checked;

    private String type;

    private String registeredCapital;

    private LocalDateTime initialDate;

    private String registeredAddress;

    private String businessScope;

    private Integer score;


}
