package cn.edu.scu.platform.service.impl;

import cn.edu.scu.platform.entity.Recruitment;
import cn.edu.scu.platform.mapper.RecruitmentMapper;
import cn.edu.scu.platform.service.IRecruitmentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author cht
 * @since 2020-05-30
 */
@Service
public class RecruitmentServiceImpl extends ServiceImpl<RecruitmentMapper, Recruitment> implements IRecruitmentService {
	
	@Autowired
	private RecruitmentMapper recruitmentMapper;
	@Override
	public void deleteByIds(Long[] ids) {
		recruitmentMapper.deleteByIds(ids);
	}

}
