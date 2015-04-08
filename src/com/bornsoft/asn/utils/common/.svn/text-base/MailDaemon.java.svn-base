package com.bornsoft.asn.utils.common;

/**
 * 后台邮件服务,依赖于 mailservice邮件服务
 * @author hooxin
 *
 */
@Deprecated
public class MailDaemon {
	private MailService ms;
	/**
	 * 初始化邮件服务, 
	 * @param protocol 协议名称 
	 * @param host 邮件主机
	 * @param smtphost 发送主机
	 * @param user 用户名
	 * @param password 密码 
	 * @param ssl 是否使用SSL加密
	 * @param sendAuth 是否使用smtp身份验证
	 */
	@Deprecated
	public MailDaemon(String protocol, String host,String smtphost, String user,
			String password, boolean ssl, boolean sendAuth) {
		ms = new MailService(protocol, host, smtphost, user, password, ssl, sendAuth);
	}
	
	@Deprecated
	/**
	 * 发送邮件
	 * @param subject 主题
	 * @param to 收件人（支持多个收件人，若需多个收件人，使用","隔开）
	 * @param cc 抄送 (支持多个抄送,若需多个抄送，使用“,”隔开)
	 * @param pgp 是否使用公密钥加密
	 * @param signature 是否使用数字签名
	 * @param text 正文 
	 * @param attach 附件
	 * @param html 是否为HTML邮件
	 * @return 是否发送成功
	 */
	public void send(final String subject, final String to, final String cc, final boolean pgp,
			final boolean signature, final String text, final String attach, final boolean html) {
		Thread t = new Thread(){
			public void run() {
				ms.connect();
				ms.send(subject,to,cc,pgp,signature,text,attach,html);
				ms.close();
			}
		};
		t.start();
	}
	
	/**
	 * 发送邮件（短版）,默认不使用 PGP加密和数字签名
	 * @param subject 主题
	 * @param to 收件人（支持多个收件人，若需多个收件人，使用","隔开）
	 * @param cc 抄送 (支持多个抄送,若需多个抄送，使用“,”隔开)
	 * @param text 正文
	 * @param html 是否为HTML邮件
	 * @return 是否发送成功
	 */
	@Deprecated
	public void send(String subject, String to, String cc, String text,
			boolean html) {
		 send(subject, to, cc, false, false, text, null, html);
	}
}
