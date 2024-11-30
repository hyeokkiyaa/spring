package org.example.assignment6.dao;

import lombok.Setter;
import org.example.assignment6.bean.PoolVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.util.ArrayList;

@Repository
@Setter
public class PoolDAO {
    @Autowired
    JdbcTemplate jdbcTemplate;

    private ResultSet rs = null;

    private final String POOL_INSERT = "INSERT INTO pool_member (name, age, phonenum, email, gender, type, attatchment) VALUES(?,?,?,?,?,?,?)";
    private final String POOL_ALL = "SELECT * FROM pool_member";
    private final String POOL_DELETE = "DELETE FROM pool_member WHERE id = ?";
    private final String POOL_FIND_ID = "SELECT * FROM pool_member WHERE id = ?";
    private final String POOL_UPDATE = "UPDATE pool_member SET name = ?, age = ?, phonenum = ?, email = ?, gender = ?, type = ?, attatchment = ?  WHERE id = ?";
    private final String POOL_FIND_NAME = "SELECT * FROM pool_member WHERE name like ?";
    private final String POOL_SORT_BY_NAME = "SELECT * FROM pool_member ORDER BY name ASC";

    public int insertPool(PoolVO vo) {
        return jdbcTemplate.update(POOL_INSERT, new Object[]{vo.getName(), vo.getAge(), vo.getPhonenum(), vo.getEmail(), vo.getGender(), vo.getType(), vo.getFilename()});
    }

    public ArrayList<PoolVO> selectAllPool() {
        return (ArrayList<PoolVO>) jdbcTemplate.query(POOL_ALL, (rs, rowNum) -> {
            PoolVO poolVO = new PoolVO();
            poolVO.setId(rs.getInt("id"));
            poolVO.setName(rs.getString("name"));
            poolVO.setAge(rs.getInt("age"));
            poolVO.setPhonenum(rs.getString("phonenum"));
            poolVO.setEmail(rs.getString("email"));
            poolVO.setGender(rs.getString("gender"));
            poolVO.setType(rs.getString("type"));
            poolVO.setFilename(rs.getString("attatchment"));
            return poolVO;
        });
    }

    public int totalNum() {
        ArrayList<PoolVO> lists = null;
        lists = selectAllPool();
        return lists.size();
    }

    public ArrayList<PoolVO> selectPoolMemberByName(String name) {
        String searchName = "%" + name + "%";
        return (ArrayList<PoolVO>) jdbcTemplate.query(POOL_FIND_NAME, new Object[]{searchName}, (rs, rowNum) -> {
            PoolVO poolVO = new PoolVO();
            poolVO.setId(rs.getInt("id"));
            poolVO.setName(rs.getString("name"));
            poolVO.setAge(rs.getInt("age"));
            poolVO.setPhonenum(rs.getString("phonenum"));
            poolVO.setEmail(rs.getString("email"));
            poolVO.setGender(rs.getString("gender"));
            poolVO.setType(rs.getString("type"));
            poolVO.setFilename(rs.getString("attatchment"));
            return poolVO;
        });
    }

    public ArrayList<PoolVO> selectAllPoolSortedByName() {
        return (ArrayList<PoolVO>) jdbcTemplate.query(POOL_SORT_BY_NAME, (rs, rowNum) -> {
            PoolVO poolVO = new PoolVO();
            poolVO.setId(rs.getInt("id"));
            poolVO.setName(rs.getString("name"));
            poolVO.setAge(rs.getInt("age"));
            poolVO.setPhonenum(rs.getString("phonenum"));
            poolVO.setEmail(rs.getString("email"));
            poolVO.setGender(rs.getString("gender"));
            poolVO.setType(rs.getString("type"));
            poolVO.setFilename(rs.getString("attatchment"));
            return poolVO;
        });
    }
}
