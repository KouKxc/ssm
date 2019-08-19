package cn.kxc.ssm.controller;

import cn.kxc.ssm.domain.Role;
import cn.kxc.ssm.domain.UserInfo;
import cn.kxc.ssm.service.IUserService;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private IUserService userService;

    /**
     * 查询用户
     * @param model
     * @return
     */
    @RequestMapping("findAll.do")
    public String findAll(Model model){
        List<UserInfo> userInfos = userService.findAll();
        model.addAttribute("userList",userInfos);
        return "user-list";
    }

    /**
     * 用户添加
     * @param userInfo
     * @return
     * @throws Exception
     */
    @RequestMapping("/save.do")
    public String save(UserInfo userInfo) throws Exception {
        userService.save(userInfo);
        return "redirect:findAll.do";
    }

    /**
     * 根据id查询用户的详情
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping("/findById.do")
    public ModelAndView findById(String id) throws Exception {
        ModelAndView mv = new ModelAndView();
        UserInfo userInfo = userService.findById(id);
        mv.addObject("user",userInfo);
        mv.setViewName("user-show1");
        return mv;
    }

    /**
     * 查询用户没有的角色
     * @param userId
     * @return
     * @throws Exception
     */
    @RequestMapping("/findUserByIdAndAllRole.do")
    public ModelAndView findUserByIdAndAllRole(@RequestParam(name = "id",required = true) String userId) throws Exception {
        ModelAndView mv = new ModelAndView();
        //查询用户
        UserInfo userInfo = userService.findById(userId);
        //查询可以添加的角色
        List<Role> otherRoles = userService.findOtherRoles(userId);
        mv.addObject("user",userInfo);
        mv.addObject("roleList",otherRoles);
        mv.setViewName("user-role-add");
        return mv;
    }

    /**
     * 给用户添加角色
     * @param userId
     * @param roleIds
     * @return
     * @throws Exception
     */
    @RequestMapping("/addRoleToUser.do")
    public String addRoleToUser(String userId,@RequestParam(name = "ids",required = true)String[] roleIds) throws Exception {
        //userId 用户的id    roleIds 用户要添加的角色数组
        userService.addRoleToUser(userId,roleIds);
        return "redirect:findAll.do";
    }
}
