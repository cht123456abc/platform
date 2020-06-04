package cn.edu.scu.platform.entity;

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
public class Account implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId
    private Long id;

    private String account;

    private String password;

    private String name;

    private String gender;

    private Integer age;

    private Integer phoneNumber;

    private String detail;


}
