package com.spring.dao;

import com.spring.config.MapperBase;
import com.spring.entity.Xinsheng;
import org.springframework.stereotype.Repository;

@Repository
public interface XinshengMapper extends MapperBase<Xinsheng> {
    Xinsheng login(Xinsheng xinsheng);
}
