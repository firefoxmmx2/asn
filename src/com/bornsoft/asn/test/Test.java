package com.bornsoft.asn.test;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

import org.junit.Assert;

import com.bornsoft.asn.bean.account.Account;
import com.bornsoft.asn.bean.groupPurchase.GroupPurchaseInfo;
import com.bornsoft.asn.bean.member.Member;
import com.bornsoft.asn.bean.order.Order;
import com.bornsoft.asn.dao.account.AccountDao;
import com.bornsoft.asn.dao.groupPurchase.GroupPurchaseDao;
import com.bornsoft.asn.service.order.OrderService;
import com.bornsoft.asn.utils.common.sqlMapFactory;
import com.sun.org.apache.xml.internal.security.utils.Base64;

public class Test {

	@org.junit.Test
	public void testgetCustomer() {
		List<Member> mlist = new ArrayList<Member>();
		List<Order> olist = new ArrayList<Order>();
		long bt = System.currentTimeMillis();
		try {
			olist = OrderService.findFrontOrderList((long) 7, null, 1, 4);
			List<Long> memberIdList = new ArrayList<Long>();

			for (Order o : olist) {
				memberIdList.add(o.getMemberId());
			}
			System.out.println(memberIdList);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		long at = System.currentTimeMillis();
		System.out.println("used times : " + (at - bt));
	}

	@SuppressWarnings("unchecked")
	@org.junit.Test
	public void testGetCustomerSQL() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", 7);
		List<Member> mlist = null;
		long bt = System.currentTimeMillis();
		try {
			mlist = sqlMapFactory.getSqlMap().queryForList("getCustomer", map);
			System.out.println(mlist);
			for (Member m : mlist) {
				System.out.println(m.getArea());
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		long at = System.currentTimeMillis();
		System.out.println("used times : " + (at - bt));
	}

	@org.junit.Test
	public void testIbatisMap() {
		GroupPurchaseInfo gpi = null;
		List<GroupPurchaseInfo> list = null;
		try {
			list = (List<GroupPurchaseInfo>) GroupPurchaseDao.getById(35l);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(list.size());
	}

	@org.junit.Test
	public void testAccountAdd() {
		Account account = new Account();
		account.setId(1l);
		account.setCreateTime(new Date());
		account.setOrderId(1l);
		account.setIncome(11.1f);
		account.setPayType("0");

		AccountDao.insert(account);
	}

	@org.junit.Test
	public void testAccountUpdate() {
		Account account = new Account();
		account.setId(1l);
		account.setCreateTime(new Date());
		account.setOrderId(2l);
		account.setIncome(2222.1f);
		account.setPayType("0");

		AccountDao.update(account);
	}

	@org.junit.Test
	public void testZipString() {
		String str="123123123123123123123123123123123123123123dlkfjsdlkfjslkdjflksjdflksjflkjsldfkjsdkfj";
		byte[] normalBytes=str.getBytes();
		byte[] compressedStr = ZipString.compress(str);
		System.out.println(normalBytes.length);
		System.out.println(compressedStr.length);
		System.out.println(Base64.encode(normalBytes));
		System.out.println(Base64.encode(compressedStr));
	}
	
	@org.junit.Test
	public void testBatchNumer() {
		List<Order> lst = OrderService.findOrderByBatchNumber("1293765414212-210112959");
		
		Assert.assertNotNull(lst);
	}
	
	@org.junit.Test
	public void testSetOrderStatus()	{
		
		OrderService.updateOrderStatus(new Long(11011067577L), "YFK");
	}
}

class ZipString {
	/**
	 * 压缩字符串为 byte[] 储存可以使用new sun.misc.BASE64Encoder().encodeBuffer(byte[] b)方法
	 * 保存为字符串
	 * 
	 * @param str
	 *            压缩前的文本
	 * @return
	 */
	public static final byte[] compress(String str) {
		if (str == null)
			return null;

		byte[] compressed;
		ByteArrayOutputStream out = null;
		ZipOutputStream zout = null;
		ZipEntry zipBody=null;
		try {
			out = new ByteArrayOutputStream();
			zout = new ZipOutputStream(out);
			zipBody=new ZipEntry("0");
			zout.putNextEntry(zipBody);
			zout.write(str.getBytes());
			zout.closeEntry();
			compressed = out.toByteArray();
		} catch (IOException e) {
			compressed = null;
		} finally {
			if (zout != null) {
				try {
					zout.close();
				} catch (IOException e) {
				}
			}
			if (out != null) {
				try {
					out.close();
				} catch (IOException e) {
				}
			}
		}

		return compressed;
	}

	/**
	 * 将压缩后的 byte[] 数据解压缩
	 * 
	 * @param compressed
	 *            压缩后的 byte[] 数据
	 * @return 解压后的字符串
	 */
	public static final String decompress(byte[] compressed) {
		if (compressed == null)
			return null;

		ByteArrayOutputStream out = null;
		ByteArrayInputStream in = null;
		ZipInputStream zin = null;
		String decompressed;
		try {
			out = new ByteArrayOutputStream();
			in = new ByteArrayInputStream(compressed);
			zin = new ZipInputStream(in);
			ZipEntry entry = zin.getNextEntry();
			byte[] buffer = new byte[1024];
			int offset = -1;
			while ((offset = zin.read(buffer)) != -1) {
				out.write(buffer, 0, offset);
			}
			decompressed = out.toString();
		} catch (IOException e) {
			decompressed = null;
		} finally {
			if (zin != null) {
				try {
					zin.close();
				} catch (IOException e) {
				}
			}
			if (in != null) {
				try {
					in.close();
				} catch (IOException e) {
				}
			}
			if (out != null) {
				try {
					out.close();
				} catch (IOException e) {
				}
			}
		}

		return decompressed;
	}
	
}
