package cn.kxc.ssm.dao;

import cn.kxc.ssm.domain.Permission;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface IPermissionDao {
    /**
     * 根据角色的id从角色权限中间表中查到权限的id 再查到"所有的权限信息"
     * @param id
     * @return
     * @throws Exception
     */
    @Select("select * from permission where id in (select permissionId from role_permission where roleId=#{id})")
    List<Permission> findPermissionByRoleId(String id) throws Exception;

    /**
     * 权限的查询
     * @return
     */
    @Select("select * from permission")
    List<Permission> findAll() throws Exception;

    /**
     * 权限的添加
     * @param permission
     */
    @Insert("insert into permission(permissionName,url) values(#{permissionName},#{url})")
    void save(Permission permission);

}
