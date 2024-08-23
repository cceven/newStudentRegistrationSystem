package com.spring.dao;

import com.spring.config.MapperBase;
import com.spring.entity.Xinshengxinxi;
import org.springframework.stereotype.Repository;

@Repository
public interface XinshengxinxiMapper extends MapperBase<Xinshengxinxi> {
    Xinshengxinxi login(Xinshengxinxi xinshengxinxi);
}
