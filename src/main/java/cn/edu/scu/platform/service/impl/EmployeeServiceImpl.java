package cn.edu.scu.platform.service.impl;

import cn.edu.scu.platform.entity.Employee;
import cn.edu.scu.platform.mapper.EmployeeMapper;
import cn.edu.scu.platform.service.IEmployeeService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author cht
 * @since 2020-05-30
 */
@Service
public class EmployeeServiceImpl extends ServiceImpl<EmployeeMapper, Employee> implements IEmployeeService {

    @Autowired
    private EmployeeMapper employeeMapper;

    public List<Employee> selectAllEmployees(){
        return employeeMapper.selectAllEmployees();
    }

    public Employee selectEmployeeById(Long id){
        return employeeMapper.selectEmployeeById(id);
    }

}
