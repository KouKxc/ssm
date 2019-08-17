package cn.kxc.ssm.service;


import cn.kxc.ssm.domain.Role;

import java.util.List;

public interface IRoleService {

    List<Role> findAll();

    void save(Role role)throws Exception;
}
