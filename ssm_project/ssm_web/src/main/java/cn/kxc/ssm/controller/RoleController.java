package cn.kxc.ssm.controller;

import cn.kxc.ssm.domain.Permission;
import cn.kxc.ssm.domain.Role;
import cn.kxc.ssm.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private IRoleService roleService;

    /**
     * 角色查询
     *
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/findAll.do")
    public String findAll(Model model) throws Exception {
        List<Role> roleList = roleService.findAll();
        model.addAttribute("roleList", roleList);
        return "role-list";
    }

    /**
     * 角色添加
     *
     * @param role
     * @return
     */
    @RequestMapping("/save.do")
    public String save(Role role) throws Exception {
        roleService.save(role);
        return "redirect:findAll.do";
    }

    /**
     * 角色详情的查询
     *
     * @param roleId
     * @return
     * @throws Exception
     */
    @RequestMapping("/findById.do")
    public ModelAndView findById(@RequestParam(name = "id", required = true) String roleId) throws Exception {
        ModelAndView mv = new ModelAndView();
        //根据roleId查询所有的role
        Role role = roleService.findById(roleId);
        mv.addObject("role", role);
        mv.setViewName("role-show");
        return mv;
    }

    /**
     * 查询角色没有的权限
     * @param roleId
     * @return
     * @throws Exception
     */
    @RequestMapping("/findRoleByIdAndAllPermission.do")
    public ModelAndView findRoleByIdAndAllPermission(@RequestParam(name = "id", required = true) String roleId) throws Exception {
        ModelAndView mv = new ModelAndView();
        //查询角色没有的权限
        List<Permission> otherPermissions = roleService.findOtherPermissions(roleId);
        //根据roleId查询所有的role
        Role role = roleService.findById(roleId);
        mv.addObject("role", role);
        mv.addObject("permissionList",otherPermissions);
        mv.setViewName("role-permission-add");
        return mv;
    }

    /**
     * 给角色添加权限
     * @param roleId
     * @param permissionIds
     * @return
     * @throws Exception
     */
    @RequestMapping("/addPermissionToRole.do")
    public String addPermissionToRole(@RequestParam(name = "roleId",required = true) String roleId, @RequestParam(name = "ids",required = true) String[] permissionIds) throws Exception {
        System.out.println(roleId);
        System.out.println(permissionIds);
        roleService.addPermissionToRole(roleId,permissionIds);
        return "redirect:findAll.do";
    }
}
