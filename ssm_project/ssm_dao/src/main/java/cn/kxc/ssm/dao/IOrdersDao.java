package cn.kxc.ssm.dao;

import cn.kxc.ssm.domain.Member;
import cn.kxc.ssm.domain.Orders;
import cn.kxc.ssm.domain.Product;
import org.apache.ibatis.annotations.*;
import sun.dc.pr.PRError;

import java.util.List;

public interface IOrdersDao {

    /**
     * 多表查询 查询产品数据
     * @return
     * @throws Exception
     */
    @Select("select * from orders")
    @Results({
            @Result(id=true,column = "id",property = "id"),
            @Result(column = "orderNum",property = "orderNum"),
            @Result(column = "orderTime",property = "orderTime"),
            @Result(column = "orderStatus",property = "orderStatus"),
            @Result(column = "peopleCount",property = "peopleCount"),
            @Result(column = "payType",property = "payType"),
            @Result(column = "orderDesc",property = "orderDesc"),
            @Result(column = "productId",property = "product",one = @One(select = "cn.kxc.ssm.dao.IProductDao.findById"))

    })
    List<Orders> findAll() throws Exception;





    /**
     * 展示订单信息、关联的商品、关联的会员、关联的旅客集合
     * @param ordersId
     * @return
     * @throws Exception
     */
    @Select("select * from orders where id = #{ordersId}")
    @Results(value = {
            @Result(id = true,property = "id", column = "id"),
            @Result(property = "orderNum", column = "orderNum"),
            @Result(property = "orderTime", column = "orderTime"),
            @Result(property = "orderStatus", column = "orderStatus"),
            @Result(property = "peopleCount", column = "peopleCount"),
            @Result(property = "peopleCount", column = "peopleCount"),
            @Result(property = "payType", column = "payType"),
            @Result(property = "orderDesc", column = "orderDesc"),
            @Result(property = "product",column = "productId",javaType = Product.class,one = @One(select = "cn.kxc.ssm.dao.IProductDao.findById")),
            @Result(property = "member",column = "memberId",javaType = Member.class,one = @One(select = "cn.kxc.ssm.dao.IMemberDao.findById")),
            @Result(property = "travellers",column = "id",javaType = java.util.List.class,many = @Many(select = "cn.kxc.ssm.dao.ITravellerDao.findByOrdersId"))
        })
        Orders findById(String ordersId) throws Exception;
}
