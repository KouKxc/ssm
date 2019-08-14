package cn.kxc.ssm.service;

import cn.kxc.ssm.domain.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll() throws Exception;
}
