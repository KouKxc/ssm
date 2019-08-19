package cn.kxc.ssm.service;


import cn.kxc.ssm.domain.Permission;
import cn.kxc.ssm.domain.Role;

import java.util.List;

public interface IRoleService {

    List<Role> findAll();

    void save(Role role)throws Exception;

    Role findById(String roleId) throws Exception;

    List<Permission> findOtherPermissions(String roleId) throws Exception;

    void addPermissionToRole(String roleId, String[] permissionIds) throws Exception;
}
