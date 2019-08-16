package cn.kxc.ssm.dao;

import cn.kxc.ssm.domain.Member;
import org.apache.ibatis.annotations.Select;

public interface IMemberDao {
    /**
     * 根据id查询所有数据
     * @param id
     * @return
     * @throws Exception
     */
    @Select("select * from member where id = #{id}")
    Member findById(String id) throws Exception;
}
