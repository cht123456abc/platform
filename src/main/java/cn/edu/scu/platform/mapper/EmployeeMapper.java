package cn.edu.scu.platform.mapper;

import cn.edu.scu.platform.entity.Employee;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author cht
 * @since 2020-05-30
 */
public interface EmployeeMapper extends BaseMapper<Employee> {

    List<Employee> selectAllEmployees();

    Employee selectEmployeeById(Long id);
}
