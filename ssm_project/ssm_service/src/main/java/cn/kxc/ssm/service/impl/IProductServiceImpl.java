package cn.kxc.ssm.service.impl;

import cn.kxc.ssm.dao.IProductDao;
import cn.kxc.ssm.domain.Product;
import cn.kxc.ssm.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class IProductServiceImpl implements IProductService {
    /**注入service*/
    @Autowired
    private IProductDao productDao;

    /**
     * 查询所有
     * @return
     * @throws Exception
     */
    @Override
    public List<Product> findAll() throws Exception {
        return productDao.findAll();
    }

    /**
     * 添加数据
     * @param product
     * @throws Exception
     */
    @Override
    public void save(Product product) throws Exception {
        productDao.save(product);
    }
}
