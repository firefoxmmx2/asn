/**
 * 
 */
package com.bornsoft.asn.utils.common;

/**
 * 校验和
 * @author kunyun
 *
 */
public class CheckSum {
	/**
	 * 求字符串的校验和
	 * @param buffer
	 * @return
	 */
	public static int checkSum(String buffer){
		int length=buffer.length();
        int cksum=0;
        for(int k=0; k<length; k++){     
            cksum += buffer.charAt(k)<<(k%8) + buffer.charAt(k)*k;
        }
        return Math.abs(cksum);
	}

	/**
	 * 求字符串的校验和，只取最后2位数字
	 * @param buffer
	 * @return
	 */
	public static String checkSum2d(String buffer){
        return String.format("%02d", new Integer(checkSum(buffer) % 100).byteValue());
	}

}
