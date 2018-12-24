package dao;

import domian.Resource;

import java.util.List;

/**
 * @Author: wt
 * @Date: 2018/12/24 23:48
 */
public interface IResourceManageDao {
    /**
     * 从数据库中查找所有资源的信息
     * @return List<Resource>
     */
    List<Resource> findAllResource();

    /**
     * 更新数据库的资源信息
     * @param resource
     * @return boolean
     */
    boolean updateResource(Resource resource);

    /**
     * 插入资源信息到数据库中
     * @param resource
     * @return
     */
    boolean insertResource(Resource resource);

    /**
     * 删除资源
     * @param resource
     * @return
     */
    boolean deleteResource(Resource resource);
}
