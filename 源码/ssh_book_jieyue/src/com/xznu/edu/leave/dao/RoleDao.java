package com.xznu.edu.leave.dao;

import com.xznu.edu.leave.base.dao.BaseDao;
import com.xznu.edu.leave.model.Role;
import com.xznu.edu.leave.utils.Pager;

public interface RoleDao extends BaseDao<Role> {

    Pager<Role> pagers();

    Role findByEn(String enName);
}
