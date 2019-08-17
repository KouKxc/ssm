package cn.kxc.ssm.service.impl;

import cn.kxc.ssm.dao.IUserDao;
import cn.kxc.ssm.domain.Role;
import cn.kxc.ssm.domain.UserInfo;
import cn.kxc.ssm.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service("userService")
@Transactional
public class UserServiceImpl implements IUserService {
    @Autowired
    private IUserDao userDao;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    /**
     * 用户登录
     * @param username
     * @return
     * @throws UsernameNotFoundException
     */
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserInfo userInfo = null;
        try {
            userInfo = userDao.findByUsername(username);
        } catch (Exception e) {
            e.printStackTrace();
        }
        User user = new User(userInfo.getUsername(), /*"{noop}" + */userInfo.getPassword(), userInfo.getStatus() == 0 ? false : true, true, true, true, getAuthority(userInfo.getRoles()));
        return user;
    }

    /**
     * 装有角色描述的list集合
     * @param roles
     * @return
     */
    public List<SimpleGrantedAuthority> getAuthority(List<Role> roles) {

        List<SimpleGrantedAuthority> list = new ArrayList<>();
        for (Role role : roles) {
            list.add(new SimpleGrantedAuthority("ROLE_" + role.getRoleName()));
        }
        return list;
    }

    /**
     * 用户查询
     * @return
     */
    @Override
    public List<UserInfo> findAll() {
        return userDao.findAll();
    }

    /**
     * 用户添加
     * @param userInfo
     */
    @Override
    public void save(UserInfo userInfo) throws Exception{
        //对密码加密
        //userInfo.setPassword(bCryptPasswordEncoder.encode(userInfo.getPassword()));
        userInfo.setPassword(bCryptPasswordEncoder.encode(userInfo.getPassword()));
        userDao.save(userInfo);
    }

    /**
     * 根据id查询用户的详情
     * @param id
     * @return
     * @throws Exception
     */
    @Override
    public UserInfo finById(String id) throws Exception {
        return userDao.findById(id);

    }
}
