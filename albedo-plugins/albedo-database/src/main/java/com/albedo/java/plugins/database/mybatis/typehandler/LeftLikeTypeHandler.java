package com.albedo.java.plugins.database.mybatis.typehandler;


import com.baomidou.mybatisplus.core.enums.SqlLike;
import org.apache.ibatis.type.Alias;

/**
 * 仅仅用于like查询
 *
 * @author somewhere
 */
@Alias("leftLike")
public class LeftLikeTypeHandler extends BaseLikeTypeHandler {
	public LeftLikeTypeHandler() {
		super(SqlLike.LEFT);
	}
}
