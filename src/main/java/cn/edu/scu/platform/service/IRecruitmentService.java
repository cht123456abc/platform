package cn.edu.scu.platform.service;

import cn.edu.scu.platform.entity.Recruitment;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author cht
 * @since 2020-05-30
 */
public interface IRecruitmentService extends IService<Recruitment> {

	void deleteByIds(Long[] ids);

}
