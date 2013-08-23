package com.boventech.demo.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.boventech.demo.dao.BaseDao;

public abstract class AbstractBaseDaoImpl<T, I extends Serializable> implements BaseDao<T, I> {

    static final int DEFAULT_PAGESIZE = 10;

    @PersistenceContext
    private EntityManager entityManager;

    private Class<T> entityClass;

    @SuppressWarnings("unchecked")
    public AbstractBaseDaoImpl() {
        entityClass = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass())
                .getActualTypeArguments()[0];
    }

    public void save(T t) {
        entityManager.persist(t);
    }

    public T merge(T t) {
        return entityManager.merge(t);
    }

    public void update(T t) {
        entityManager.merge(t);
    }

    public void deleteById(I id) {
        final Class<T> pclass = this.entityClass;
        T t = entityManager.find(pclass, id);
        if (null != t) {
            entityManager.remove(t);
        }
    }

    public void deleteByIds(I[] ids) {
        for (I id : ids) {
            deleteById(id);
        }
    }

    public void delete(T t) {
        if (null != t) {
            entityManager.remove(t);
        }
    }

    public T findByID(I id) {
        final Class<T> pclass = this.entityClass;
        return entityManager.find(pclass, id);
    }

    public int executeCountQuery(String queryString, Object... restricts) {
        Query query = entityManager.createQuery(queryString);
        for (int i = 0; i < restricts.length; i++) {
            query.setParameter(i + 1, restricts[i]);
        }
        Number singleResult = null;
        try {
            singleResult = (Number) query.getSingleResult();
        } catch (NoResultException e) {
        }
        return null == singleResult ? 0 : singleResult.intValue();
    }

    @SuppressWarnings("unchecked")
    public List<T> executeQueryWithPaging(String queryString, int page, int pageSize, Object... restricts) {
        int curPage = (page < 1) ? 1 : page;
        Query query = entityManager.createQuery(queryString);
        for (int i = 0; i < restricts.length; i++) {
            query.setParameter(i + 1, restricts[i]);
        }
        query.setFirstResult((curPage - 1) * pageSize);
        query.setMaxResults(pageSize);
        return query.getResultList();
    }

    @SuppressWarnings("unchecked")
    public List<T> executeQueryWithoutPaging(String queryString, Object... restricts) {
        Query query = entityManager.createQuery(queryString);
        for (int i = 0; i < restricts.length; i++) {
            query.setParameter(i + 1, restricts[i]);
        }
        return query.getResultList();
    }
    

    public List<?> executeQuery(String queryString) {
        Query query = entityManager.createQuery(queryString);
        return query.getResultList();
    }

}