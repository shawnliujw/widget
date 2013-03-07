package com.mpupa.utils;

public class CipherKey {

	/**
	 * 
	 * @author tony
	 * @date 2013-2-25上午10:36:28
	 */

	public static void main(String[] args) {
		String temp=encodeCPT("claire@m-pupa.com", 9239, "9oa48ysw56", "8UuvFYH9fAzyjRWwxqQ4tdeMNBcs5ZGk2pbIKgV6iaOlEnSJ3or7hmD1LXCTP");
		System.out.println(temp);
	}

	/**
	 * Returns the encrypted pin code, offercode, short CipherKey and long
	 * CipherKey.
	 * 
	 * @param sPCode
	 *            String - User's unique identifier, as assigned by the client.
	 * @param iOCode
	 *            String - Offer code for the coupon, as assigned by
	 *            Coupons.com.
	 * @param sShortKey
	 *            String - Short CipherKey for the coupon, as assigned by
	 *            Coupons.com.
	 * @param sLongKey
	 *            String – Long CipherKey for the coupon, as assigned by
	 *            Coupons.com.
	 * @return String – An encrypted string, also known as the CPT parameter.
	 */
	public static String encodeCPT(String sPCode, int iOCode, String sShortKey,
			String sLongKey) {
		String decodeX = " abcdefghijklmnopqrstuvwxyz0123456789!$%()*+,-.@;<=>?[]^_{|}~";
		int[] encodeModulo;
		int ocode;
		encodeModulo = new int[256];
		int[] vob;
		vob = new int[2];
		if (Integer.toString(iOCode).length() < 5) {
			ocode = iOCode;
		} else {
			ocode = iOCode % 10000;
		}
		vob[0] = ocode % 100;
		vob[1] = (ocode - vob[0]) / 100;
		for (int i = 0; i < 61; i++) {
			encodeModulo[decodeX.charAt(i)] = i;
		}
		String vString = sPCode.toLowerCase() + iOCode;
		if (vString.length() < 20) {
			vString += " couponsincproduction";
			vString = vString.substring(0, 20);
		}
		int q = 0;
		int j = vString.length();
		int k = sShortKey.length();
		StringBuffer sbCPT = new StringBuffer("");
		int s1, s2, s3;
		for (int i = 0; i < j; i++) {
			s1 = encodeModulo[vString.charAt(i)];
			s2 = 2 * encodeModulo[sShortKey.charAt(i % k)];
			s3 = vob[i % 2];
			q = (q + s1 + s2 + s3) % 61;
			sbCPT.append(sLongKey.charAt(q));
		}
		return sbCPT.toString();
	}
}
