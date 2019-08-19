package cn.kxc.ssm.service;

import cn.kxc.ssm.domain.SysLog;

import java.util.List;

public interface IAopSysLogService {
    void save(SysLog sysLog) throws Exception;

    List<SysLog> findAll(int page,int size) throws Exception;

}
