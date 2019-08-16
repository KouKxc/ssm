package cn.kxc.ssm.service;

import cn.kxc.ssm.domain.Orders;

import java.util.List;

public interface IOrdersService {
    List<Orders> findAll(int page,int size) throws Exception;
}
