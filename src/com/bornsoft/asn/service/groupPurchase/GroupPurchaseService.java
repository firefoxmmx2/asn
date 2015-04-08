package com.bornsoft.asn.service.groupPurchase;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.bornsoft.asn.bean.groupPurchase.GroupPurchaseDetail;
import com.bornsoft.asn.bean.groupPurchase.GroupPurchaseInfo;
import com.bornsoft.asn.bean.groupPurchase.GroupPurchaseMemDetail;
import com.bornsoft.asn.bean.groupPurchase.GroupPurchaseMember;
import com.bornsoft.asn.bean.member.Member;
import com.bornsoft.asn.dao.groupPurchase.GroupPurchaseDao;
import com.bornsoft.asn.dao.groupPurchase.GroupPurchaseDetailDao;
import com.bornsoft.asn.dao.groupPurchase.GroupPurchaseMemberDao;
import com.bornsoft.asn.dao.member.MemberDao;
import com.bornsoft.asn.service.idmaker.IdMakerService;
import com.bornsoft.asn.utils.common.AsnConstLib.MemberApproveState;
import com.bornsoft.asn.utils.common.sqlMapFactory;

/**
 * 团购信息服务
 * @author hooxin
 *
 */
public class GroupPurchaseService {
	//类型变量
	/**
	 * 状态：N—未发布；Y—发布；C—关闭；O—结束；
	 */
	public static Map<String, String> status;
	/**
	 * 提货方式：1—自提；2—送货上门；3—邮寄；
	 */
	public static Map<String, String> takeGoodsType;
	/**
	 * 运费方式：1—买家承担；2—卖家承担；3—暂时不计
	 */
	public static Map<String, String> freightType;
	public static Map<String, String> isTimeLimit;
	static {
		status=new HashMap<String, String>();
		status.put("N", "未发布");
		status.put("Y", "发布");
		status.put("C", "关闭");
		status.put("O", "结束");
		
		takeGoodsType=new HashMap<String, String>();
		takeGoodsType.put("1", "自提");
		takeGoodsType.put("2", "送货上门");
		takeGoodsType.put("3", "邮寄");
		
		freightType=new HashMap<String, String>();
		freightType.put("1", "买家承担");
		freightType.put("2", "卖家承担");
		freightType.put("3", "暂时不计");
		
		isTimeLimit=new HashMap<String, String>();
		isTimeLimit.put("Y", "是");
		isTimeLimit.put("N", "否");
	}
	
	public static void appendGroupPurchase(GroupPurchaseInfo gpi) throws Exception{
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			GroupPurchaseDao.insert(gpi);
			List<GroupPurchaseDetail> l=gpi.getDetails();
			if(l!=null&&l.size()>0){
				for(GroupPurchaseDetail gpd:l){
					GroupPurchaseDetailDao.insert(gpd);
				}
			}
			
			sqlMapFactory.getSqlMap().commitTransaction();	
		}catch(Exception e){
			Logger log = Logger.getLogger("GroupPurchaseService");
			log.info("appendGroupPurchase error", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}	
	}
	public static void modifyGroupPurchase(GroupPurchaseInfo gpi) throws Exception{
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			GroupPurchaseDao.update(gpi);
			List<GroupPurchaseDetail> l=gpi.getDetails();
			GroupPurchaseDetailDao.delete(gpi.getId());
			if(l!=null&&l.size()>0){
				for(GroupPurchaseDetail gpd:l){
					GroupPurchaseDetailDao.insert(gpd);
				}
			}
			
			sqlMapFactory.getSqlMap().commitTransaction();	
		}catch(Exception e){
			Logger log = Logger.getLogger("GroupPurchaseService");
			log.info("modifyGroupPurchase error", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}
	}
	public static void removeGroupPurchase(String id) throws Exception{
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			GroupPurchaseDetailDao.delete(Long.parseLong(id));
			GroupPurchaseDao.delete(new Long(id));
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch(Exception e){
			Logger log = Logger.getLogger("GroupPurchaseService");
			log.info("delete GroupPurchase information error", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}			
	}
//	条件自己补充不要用map
	public static List<GroupPurchaseInfo> getGroupPurchase(String title,String productName,String startTimeStart,
			String endTimeStart,String startTimeEnd,String endTimeEnd,String status,int startCount,int endCount) throws Exception{
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("title", title);
		m.put("productName", productName);
		m.put("status", status);
		m.put("startTimeStart", startTimeStart);
		m.put("endTimeStart", endTimeStart);
		m.put("startTimeEnd", startTimeEnd);
		m.put("endTimeEnd", endTimeEnd);
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			List<GroupPurchaseInfo>	list = GroupPurchaseDao.get(m);
			sqlMapFactory.getSqlMap().commitTransaction();
			return list;
		}catch(Exception e){
			Logger log = Logger.getLogger("GroupPurchaseService");
			log.info("search GroupPurchase list error", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}	
	}
	
	public static void updateStatusGroupPurchase(String id,String status) throws Exception{
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("groupPurcharseId", id);
		m.put("status", status);
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			GroupPurchaseDao.updateStatus(m);
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch(Exception e){
			Logger log = Logger.getLogger("GroupPurchaseService");
			log.info("update status of GroupPurchase error", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}			
	}
	
//	条件自己补充不要用map
	public static Integer getGroupPurchaseCount(String title,String productName,String startTimeStart,
			String endTimeStart,String startTimeEnd,String endTimeEnd,String status) throws Exception{
		int count = 0;
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("title", title);
		m.put("productName", productName);
		m.put("status", status);
		m.put("startTimeStart", startTimeStart);
		m.put("endTimeStart", endTimeStart);
		m.put("startTimeEnd", startTimeEnd);
		m.put("endTimeEnd", endTimeEnd);
		try{
			sqlMapFactory.getSqlMap().startTransaction();
			count = GroupPurchaseDao.count(m);
			sqlMapFactory.getSqlMap().commitTransaction();
			return count;
		}catch(Exception e){
			Logger log = Logger.getLogger("GroupPurchaseService");
			log.info("search GroupPurchase count error", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}	
	}
	
	/**
	 * 通过团购ID获取一个团购信息
	 * 
	 * @param groupPurchaseId
	 *            团购信息ID
	 * @return 团购信息
	 * @throws SQLException
	 */
	public static GroupPurchaseInfo getGroupPurchaseById(Long groupPurchaseId)
			throws SQLException {

		if (groupPurchaseId == null)
			throw new RuntimeException("groupPurchaseId is null");
		GroupPurchaseInfo groupPurchase=GroupPurchaseDao.getById(groupPurchaseId);
		return groupPurchase; 
	}
	
	public static void updateGroupMemberStatus(String status,Long groupMemberId){
		Logger log=Logger.getLogger("");
		
		if(!GroupPurchaseService.status.containsKey(status))
			throw new RuntimeException("status is invaild");
		try {
			sqlMapFactory.getSqlMap().startTransaction();
			GroupPurchaseMemberDao.updateStatus(status, groupMemberId);
			sqlMapFactory.getSqlMap().commitTransaction();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.info(e);
		} finally{
			try {
				sqlMapFactory.getSqlMap().endTransaction();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				log.info(e);
			}
		}
	}
	
	public static GroupPurchaseInfo getGroupPurchaseById1(Long groupPurchaseId)throws Exception{
		return GroupPurchaseDao.getById(groupPurchaseId);
	}
	
	//根据团购ID得到团购明细
	public static List<GroupPurchaseDetail> getGroupPurchaseDetailById(Long id) throws Exception{
		return GroupPurchaseDao.getGroupPurchaseDetailById(id);
	}
	
	//INSERT团购成员
	public static void addGroupPurchaseMember(GroupPurchaseMember gpm) throws Exception{
		GroupPurchaseDao.addGroupPurchaseMember(gpm);
	}
	
	public static void addGroupPurchaseMemDetail(List<GroupPurchaseMemDetail> groupPurchaseMemDetail,Long id,GroupPurchaseMember groupPurchaseMember) throws Exception{
		try{
			sqlMapFactory.getSqlMap().startTransaction();			
			for(GroupPurchaseMemDetail gpmd:groupPurchaseMemDetail){	
				if(gpmd.getBuySum() > 0.0){
					gpmd.setId(IdMakerService.newId("GroupPurchaseMemDetailId"));
					if(groupPurchaseMember.getTakeGoodsType().equals("2")){
						gpmd.setCostSum(gpmd.getBuySum()*(gpmd.getGroupPurchasePrice()+gpmd.getFee()));
					}else{
						gpmd.setCostSum(gpmd.getBuySum()*gpmd.getGroupPurchasePrice());
					}
					gpmd.setParentId(id);
					GroupPurchaseDao.addGroupPurchaseMemDetail(gpmd);
				}
			}
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch(Exception e){
			Logger log = Logger.getLogger("GroupPurchaseService");
			log.info("insert GroupPurchaseMemDetail count error", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}			
	}
	
	
	//修改参团人数
	public static void updateCurrentUsers(Long id)throws Exception{
		try{
			sqlMapFactory.getSqlMap().startTransaction();			
			GroupPurchaseDao.updateCurrentUsers(id);
			sqlMapFactory.getSqlMap().commitTransaction();
		}catch(Exception e){
			Logger log = Logger.getLogger("GroupPurchaseService");
			log.info("update CurrentUsers count error", e);
			throw e;
		}finally{
			sqlMapFactory.getSqlMap().endTransaction();
		}		
	}
	
	//SELECT团购成员购买明细
	public static List getMemberBuyDetail(Long id) throws Exception{
		return GroupPurchaseDao.getMemberBuyDetail(id);
	}
	
	
	/*******
	 * 自动添加会员资料
	 * 
	 * *****/
	public static boolean groupPurchaseInsertMember(GroupPurchaseMember groupPurchaseMember)throws Exception{
		Member m = null;
		
		m = new MemberDao().getMemberBySsoAccount(groupPurchaseMember.getMobile());
		if(m == null){		
			try{
				sqlMapFactory.getSqlMap().startTransaction();	
				
				m = new Member();
				m.setMemberId(IdMakerService.newId("memberId"));
				m.setSsoAccount(groupPurchaseMember.getMobile());
				m.setFullName(groupPurchaseMember.getName());
				m.setShortName("");
				m.setAddress(groupPurchaseMember.getAddress());
				m.setApproveState(MemberApproveState.ManualVerify);
				m.setArea("");
				m.setCertType("4");
				m.setCertId(groupPurchaseMember.getCardId());
				m.setContactor("");			
				m.setEmail(groupPurchaseMember.getMobile()+"@139.com");
				m.setFixedPhone("");
				m.setMemberType(Byte.valueOf("2"));
				m.setMobilePhone(groupPurchaseMember.getMobile());
				m.setZip("");
				m.setSsoType("Y");
				
				new MemberDao().insertMember(m); // 添加会员信息
				sqlMapFactory.getSqlMap().commitTransaction();
			}catch(Exception e){
				Logger log = Logger.getLogger("GroupPurchaseService");
				log.info("insert member error", e);
				throw e;
			}finally{
				sqlMapFactory.getSqlMap().endTransaction();
			}
			return false;
		}else{
			return true;
		}
	}
	
	/**
	 * 获取团购信息
	 * @param groupPurchaseId 团购信息ID
	 * @param groupMemberId 会员ID
	 * @return
	 * @throws SQLException
	 */
	public static GroupPurchaseInfo getGroupPurchaseByIdAndMemberId(Long groupPurchaseId,
			Long groupMemberId) throws SQLException {

		if (groupPurchaseId == null)
			throw new RuntimeException("groupPurchaseId is null");
		if (groupMemberId == null)
			throw new RuntimeException("groupMemberId is null");

		GroupPurchaseInfo groupPurchase = GroupPurchaseDao
				.getById(groupPurchaseId);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tblGroupId", groupPurchaseId);
		map.put("mobile", groupMemberId);
		List<GroupPurchaseMember> memberList =GroupPurchaseMemberDao.get(map);
		groupPurchase.setGroupMembers(memberList);
		
		return groupPurchase;
	}

/**
	 * 获取团购记录数
	 * 
	 * @param title
	 *            标题
	 * @param productName
	 *            产品名称
	 * @param startTimeStart
	 *            开始时间开始
	 * @param endTimeStart
	 *            结束时间开始
	 * @param startTimeEnd
	 *            开始时间结束
	 * @param endTimeEnd
	 *            结束时间结束
	 * @param status
	 *            状态
	 * @param groupMemberId
	 *            团员ID
	 * @return 团购记录数
	 */
	public static int getGroupPurchasesCount(String title, String productName,
			String startTimeStart, String endTimeStart, String startTimeEnd,
			String endTimeEnd, String status, Long groupMemberId) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("title", title);
		m.put("productName", productName);
		m.put("status", status);
		m.put("startTimeStart", startTimeStart);
		m.put("endTimeStart", endTimeStart);
		m.put("startTimeEnd", startTimeEnd);
		m.put("endTimeEnd", endTimeEnd);
		m.put("groupMemberId", groupMemberId);

		int count = 0;
		try {
			count = (int) GroupPurchaseDao.count(m);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Logger log = Logger.getLogger("");
			log.error(e);
		}

		return count;
	}

	/**
	 * 获取团购列表
	 * 
	 * @param startCount
	 *            起始记录
	 * @param endCount
	 *            结束记录
	 * @param title
	 *            标题
	 * @param productName
	 *            产品名称
	 * @param startTimeStart
	 *            开始时间开始
	 * @param endTimeStart
	 *            结束时间开始
	 * @param startTimeEnd
	 *            开始时间结束
	 * @param endTimeEnd
	 *            结束时间结束
	 * @param status
	 *            状态
	 * @param groupMemberId
	 *            团员ID
	 * @return 团购列表
	 */
	public static List<GroupPurchaseInfo> getGroupPurchases(int startCount,
			int endCount, String title, String productName,
			String startTimeStart, String endTimeStart, String startTimeEnd,
			String endTimeEnd, String status, Long groupMemberId) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("title", title);
		m.put("productName", productName);
		m.put("status", status);
		m.put("startTimeStart", startTimeStart);
		m.put("endTimeStart", endTimeStart);
		m.put("startTimeEnd", startTimeEnd);
		m.put("endTimeEnd", endTimeEnd);
		m.put("startCount", startCount);
		m.put("endCount", endCount);
		m.put("groupMemberId", groupMemberId);

		List<GroupPurchaseInfo> lst = null;
		try {
			lst = GroupPurchaseDao.get(m);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Logger log = Logger.getLogger("");
			log.error(e);
		}

		return lst;
	}
}
