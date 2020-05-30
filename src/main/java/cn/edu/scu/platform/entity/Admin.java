package cn.edu.scu.platform.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class Admin {
    private static final long serialVersionUID = 1L;
    @TableId
    private Long id;
    private String account;
    private String password;
    private String name;
    private String detail;

}
