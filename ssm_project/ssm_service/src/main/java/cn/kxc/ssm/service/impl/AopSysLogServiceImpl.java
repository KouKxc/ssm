package cn.kxc.ssm.service.impl;

import cn.kxc.ssm.dao.IAopSysLogDao;
import cn.kxc.ssm.domain.SysLog;
import cn.kxc.ssm.service.IAopSysLogService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AopSysLogServiceImpl implements IAopSysLogService {
    @Autowired
    private IAopSysLogDao aopSysLogDao;
    @Override
    public void save(SysLog sysLog) throws Exception {
        aopSysLogDao.save(sysLog);
    }

    @Override
    public List<SysLog> findAll(int page,int size) throws Exception {
        PageHelper.startPage(page,size);
        return aopSysLogDao.findAll();
    }
}
