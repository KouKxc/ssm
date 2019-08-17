package cn.kxc.ssm.controller;

import cn.kxc.ssm.domain.Role;
import cn.kxc.ssm.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private IRoleService roleService;

    /**
     * 角色查询
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/findAll.do")
    public String findAll(Model model)throws Exception{
        List<Role> roleList = roleService.findAll();
        model.addAttribute("roleList",roleList);
        return "role-list";
    }

    /**
     * 角色添加
     * @param role
     * @return
     */
    @RequestMapping("/save.do")
    public String save(Role role) throws Exception {
        roleService.save(role);
        return "redirect:findAll.do";
    }
}
