package group7netctoss.service;

import java.util.List;
import java.util.Map;

import group7netctoss.entity.Fee;






public interface FeeService {
	
	/**
	 * 增加资费
	 * @param fee
	 * @return
	 */
	public int addFee(Fee fee);
	
	/**
	 * 删除资费
	 * @param fee
	 * @return
	 */
	public int delFee(Fee fee);
	
	/**
	 * 修改资费
	 * @param fee
	 * @return
	 */
	public int update(Fee fee);
	
	/**
	 * 查询所有资费信息
	 * @return
	 */
	public List<Fee> getAllFee(Map<String,Object> map);
	
	/**
	 * 根据id查询资费信息
	 * @param fee
	 * @return
	 */
	public Fee selectFeeByID(Fee fee);
	
	/**
	 * 启用资费
	 * @param fee
	 * @return
	 */
	public int updateFeeState(Fee fee);
	/**
	 * 查询所有资费id，名称
	 * @return
	 */
	public List<Fee> selectAllFeeIDName();
	
	/**
	 * 查询总记录数
	 * @return
	 */
	public int getAllCounts();
}
