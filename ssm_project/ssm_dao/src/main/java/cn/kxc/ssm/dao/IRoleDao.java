package cn.kxc.ssm.dao;

import cn.kxc.ssm.domain.Permission;
import cn.kxc.ssm.domain.Role;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IRoleDao {
    /**
     *  根据用户id查到角色id 在查到“所有的角色信息”
     *  携带所有的权限
     * @param userId
     * @return
     * @throws Exception
     */
    @Select("select * from role where id in (select roleId from users_role where userId = #{userId})")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "roleNum",column = "roleNum"),
            @Result(property = "roleDesc",column = "roleDesc"),
            @Result(property = "permissions",column = "id",javaType = java.util.List.class,many = @Many(select = "cn.kxc.ssm.dao.IPermissionDao.findPermissionByRoleId"))
    })
    List<Role> findRoleByUserId(String userId) throws Exception;

    /**
     * 角色的查询
     * @return
     */
    @Select("select * from role")
    List<Role> findAll();

    /**
     * 角色的添加
     * @param role
     */
    @Insert("insert into role(roleName,roleDesc) values(#{roleName},#{roleDesc})")
    void save(Role role);

    /**
     * 角色详情查询
     * @param roleId
     * @return
     */
    @Select("select * from role where id=#{roleId}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "roleName",column = "roleName"),
            @Result(property = "roleDesc",column = "roleDesc"),
            @Result(property = "permissions",column = "id",javaType = java.util.List.class,many = @Many(select = "cn.kxc.ssm.dao.IPermissionDao.findPermissionByRoleId")),
    })
    Role findById(String roleId);

    /**
     * 查询角色没有的权限
     * @return
     */
    @Select("select * from permission where id not in (select permissionId from role_permission where roleId=#{roleId})")
    List<Permission> findOtherPermissions(String roleId);

    /**
     * 给角色添加权限
     * @param roleId
     * @param permissionId
     * @throws Exception
     */
    @Insert("insert into role_permission(roleId,permissionId) values (#{roleId},#{permissionId})")
    void addPermissionToRole(@Param("roleId") String roleId,@Param("permissionId") String permissionId) throws Exception;
}
