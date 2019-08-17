package cn.kxc.ssm.service;

import cn.kxc.ssm.domain.UserInfo;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface IUserService extends UserDetailsService {


    List<UserInfo> findAll();

    void save(UserInfo userInfo) throws Exception;

    UserInfo finById(String id) throws Exception;
}
