package com.bornsoft.asn.utils.common;

import java.util.Date;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.FetchProfile;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.Transport;
import javax.mail.URLName;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 * 邮件发送服务
 * 
 * @author hooxin
 * @version 0.1
 * @since 10-03-11
 */
@Deprecated
public class MailService {
	// IMAP协议
	final static public String PROTOCOL_IMAP = "imap";
	// SMTP发送协议
	final static public String PROTOCOL_SMTP = "smtp";
	// POP3邮件收取协议
	final static public String PROTOCOL_POP = "pop3";
	// 收件箱
	final static public String BOX_IN = "INBOX";
	// SSL加密协议
	final static private String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";

	// 邮件协议
	private String protocol;
	// 服务器主机
	private String host;
	// 用户
	private String user;
	// 密码
	private String password;
	// 需要安全连接
	private boolean SSL;
	// 发送前验证用户 smtp验证
	private boolean sendAuth;
	// 错误信息
	private String error;
	// 邮件库
	private Store store;
	// 会话
	private Session session;
	// 邮件用户数据记录
	// 是否显示调试信息
	private boolean debug;
	// smtp 主机默认为host
	private String smtphost;

	/**
	 * 初始化邮件服务, 
	 * @param protocol 协议名称
	 * @param host 邮件主机
	 * @param user 用户名
	 * @param password 密码 
	 * @param ssl 是否使用SSL加密
	 * @param sendAuth 是否使用smtp身份验证
	 */
	public MailService(String protocol, String host, String user,
			String password, boolean ssl, boolean sendAuth) {
		this.host = host;
		this.user = user;
		this.password = password;
		this.SSL = ssl;
		this.sendAuth = sendAuth;
		this.protocol = protocol;
	}
	
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
	public MailService(String protocol, String host,String smtphost, String user,
			String password, boolean ssl, boolean sendAuth) {
		this.host = host;
		this.smtphost = smtphost;
		this.user = user;
		this.password = password;
		this.SSL = ssl;
		this.sendAuth = sendAuth;
		this.protocol = protocol;
	}

	/**
	 * 初始化 邮件服务 使用ssl 安全验证
	 * 
	 * @param host
	 *            主机地址
	 * @param ssl
	 *            ssl安全连接
	 * @param sendAuth
	 *            是否smtp验证
	 */
	public MailService(String protocol, boolean ssl, boolean sendAuth) {
		this(protocol, null, null, null, ssl, sendAuth);
	}

	/**
	 * 初始化 邮件服务 不使用SSL安全连接，使用SMTP身份验证
	 * @param protocol 协议名称
	 */
	public MailService(String protocol) {
		this(protocol, false, true);
	}

	/**
	 * 连接邮件服务器
	 * @return 连接状态
	 */
	public boolean connect() {
		boolean ret = false;
		// String sysEncoding=System.getProperty("file.encoding");

		Properties props = System.getProperties();
		props.put("mail.smtp.host", smtphost); // 发件主机
		props.put("mail.mime.charset", "utf-8"); // 字符编码
		if (sendAuth)
			props.put("mail.smtp.auth", "true"); // 发件前需要验证
		if (debug)
			props.put("mail.debug", "true"); // 显示调试信息
		if (SSL) {
			props.put("mail.smtp.starttls.enable", "true"); // 发件需要安全连接
			props.setProperty("mail.imap.socketFactory.class", SSL_FACTORY); // IMAP
			// provider
			props.setProperty("mail.pop3.socketFactory.class", SSL_FACTORY); // POP3
			// provider
			props.setProperty("mail.imap.socketFactory.fallback", "false"); // IMAP
			// provider
			props.setProperty("mail.pop3.socketFactory.fallback", "false"); // POP3
			// provider
			// IMAP provider
			props.setProperty("mail.imap.port", "993");
			props.setProperty("mail.imap.socketFactory.port", "993");
			// POP3 provider
			props.setProperty("mail.pop3.port", "995");
			props.setProperty("mail.pop3.socketFactory.port", "995");
		}
		// 会话验证, 采用密码验证类型，以后会加入自动获得验证类型，选择正确的验证
		session = Session.getInstance(props, new MailAuthenticator(user,
				password));
		session.setDebug(debug);
		// 设置连接的URL
		URLName url = new URLName(protocol, host, -1, BOX_IN, user, password);
		try {
			store = session.getStore(url);
			store.connect();
			ret = true;
		} catch (Exception ex) {
			error = ex.getMessage();
			System.err.println(error);
		}
		return ret;
	}

	/**
	 * 连接邮件服务器
	 * @param host 服务器主机
	 * @param user 用户名(或者EMAIL)
	 * @param password 密码
	 * @return
	 */
	public boolean connect(String host, String user, String password) {
		this.host = host;
		//当未设置smtp主机的时候，默认host主机为smtp主机
		if (this.smtphost == null)
			this.smtphost = host;
		this.user = user;
		this.password = password;
		return connect();
	}

	/**
	 *  连接邮件服务器
	 * @param host 服务器主机
	 * @param smtphost smtp服务器主机
	 * @param user 用户名(或者EMAIL)
	 * @param password 密码
	 * @return
	 */
	public boolean connect(String host, String smtphost, String user, String password) {
		this.host = host;
		this.smtphost = smtphost;
		this.user = user;
		this.password = password;
		return connect();
	}
	/**
	 * 关闭连接
	 */
	public void close() {
		if (isConnected())
			try {
				store.close();
			} catch (MessagingException e) {
				error = e.getMessage();
				System.err.println(error);
			}
	}

	/**
	 * 关闭连接
	 * @return
	 */
	public boolean isConnected() {
		return (store != null && store.isConnected());
	}

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
	public boolean send(String subject, String to, String cc, boolean pgp,
			boolean signature, String text, String attach, boolean html) {
		boolean ret = false;
		if (isConnected()) {
			Multipart mp = new MimeMultipart();
			try {
				// 创建新消息
				Message msg = new MimeMessage(session);

				// 设置收件人地址
				InternetAddress[] toAddrs = InternetAddress.parse(to, false);
				msg.setRecipients(Message.RecipientType.TO, toAddrs);
				// 设置抄送地址
				if (cc != null) {
					InternetAddress[] ccAddrs = InternetAddress
							.parse(cc, false);
					msg.setRecipients(Message.RecipientType.CC, ccAddrs);
				}
				// 设置主题
				msg
						.setSubject((subject == null || subject.equals("")) ? "No Subject"
								: subject);
				// 发件人
				msg.setFrom(new InternetAddress(user.indexOf("@") > 0 ? user
						: user + "@" + host));

				// 邮件类型
				if (html) {
					MimeBodyPart mbp = new MimeBodyPart();
					mbp.setContent("<meta http-equiv='Content-Type' content='text/html;charset=utf-8'>"+text,"text/html;charset=utf-8");
					mp.addBodyPart(mbp);
				} else {
					// 正文
//					if (text != null)
						msg.setText(text);
				}
				//附件
				if(attach != null){
					String[] tmp = attach.split(",");
					for(String filepath : tmp){
						MimeBodyPart mbp = new MimeBodyPart();
						DataSource source = new FileDataSource(filepath);
						mbp.setDataHandler(new DataHandler(source));
						mbp.setFileName(filepath);
						mp.addBodyPart(mbp);
					}
				}
				// 使用pgp加密 //###
				if (pgp) {
					usePGP();
				}
				// 使用签名 //###
				if (signature) {
					useSignature();
				}
				
				if(mp.getCount() != 0)
					msg.setContent(mp);
				msg.setSentDate(new Date());
				// 发送
				Transport.send(msg);
				ret = true;
			} catch (Exception e) {
				error = e.getMessage();
				System.err.println(error);
			}
		}
		return ret;
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
	public boolean send(String subject, String to, String cc, String text,
			boolean html) {
		return send(subject, to, cc, false, false, text, null, html);
	}
	
	/**
	 * 发送邮件（短带附件）,默认不使用PGP加密和数字签名
	 * @param subject 主题
	 * @param to 收件人（支持多个收件人，若需多个收件人，使用","隔开）
	 * @param cc 抄送 (支持多个抄送,若需多个抄送，使用“,”隔开)
	 * @param text 正文
	 * @param attach 附件（支持多个附件，若需使用，用","隔开）
	 * @param html 是否为HTML邮件
	 * @return 是否发送成功
	 */
	public boolean send(String subject, String to, String cc, String text, String attach,
			boolean html) {
		return send(subject, to, cc, false, false, text, attach, html);
	}
	
	/**
	 * 发送邮件,不使用加密技术和数字签名，不使用附件，不使用抄送，默认纯文本模式
	 * @param subject 主题
	 * @param to 收件人（支持多个收件人，若需多个收件人，使用","隔开）
	 * @param text 正文
	 * @return 是否发送成功
	 */
	public boolean send(String subject, String to, String text) {
		return send(subject, to, null, text, false);
	}

	/**
	 * @param folderName
	 * @return
	 */
	public Message[] recv(String folderName) {
		Message[] msgs = null;
		if (isConnected()) {
			try {
				Folder folder = store.getFolder(folderName);
				if (folder == null) {
					error = "Invalid folder box name";
					System.err.println(error);
				} else {
					folder.open(Folder.READ_WRITE);
					msgs = folder.getMessages();
					FetchProfile fp = new FetchProfile();
					fp.add(FetchProfile.Item.ENVELOPE);
					folder.fetch(msgs, fp);
				}

			} catch (Exception ex) {
				error = ex.getMessage();
				System.err.println(error);
			}
		} else {
			error = "尚未登录";
			System.err.println(error);
		}
		return msgs;
	}

	/**
	 * @param msgNum
	 * @param folderName
	 * @return
	 */
	public Message recv(int msgNum, String folderName) {
		Message ret = null;
		if (isConnected()) {
			try {
				Folder folder = store.getFolder(folderName);
				if (folder == null) {
					error = "Invalid folder box name";
				} else {
					if (!folder.isOpen())
						folder.open(0);
					ret = folder.getMessage(msgNum);
				}
			} catch (MessagingException e) {
				error = e.getMessage();
				System.err.println(error);
			}
		}
		return ret;
	}

	/**
	 *  通过解析 邮件消息模板，得到消息内容 
	 * @param msgTemp 邮件消息模板 @msgTemp 为一个包含@N的字符串(N 为数字,从0开始)
	 * @param objs 消息参数 @objs 为对象数组
	 * @return 以解析好的邮件内容
	 */
	public static String parseMsgCont(String msgTemp, Object[] objs){
		//msgTemp为一个包含@N (N为数字)
		String str = msgTemp;
		if(objs == null){
//			error = "模板参数为空";
			System.err.println("模板参数为空");
			return null;
		}
		
		for(int i=0;i<objs.length;i++){
			str = str.replaceAll("@"+i, (String) objs[i]);
		}
		return str;
	}
	
	public String getSmtphost() {
		return smtphost;
	}

	public void setSmtphost(String smtphost) {
		this.smtphost = smtphost;
	}

	public Message[] recv() {
		return recv(BOX_IN);
	}

	public Message recv(int mailNum) {
		return recv(mailNum, BOX_IN);
	}

	/**
	 * 得到错误信息
	 * @return 错误信息
	 */
	public String getError() {
		return error;
	}

	/**
	 * 身份验证
	 * @author hooxin
	 *
	 */
	class MailAuthenticator extends Authenticator {
		private String user;
		private String pword;

		public MailAuthenticator(String user, String pword) {
			super();
			this.user = user;
			this.pword = pword;
		}

		// 密码验证方式
		public PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(user, pword);
		}
		// 其他验证方式//陆续增加

	}

	public void isDebug(boolean debug) {
		this.debug = debug;
	}

	public boolean isDebug() {
		return this.debug;
	}

	public void usePGP() {
		
	}
	
	public void useSignature() {
		
	}
	//测试 参照
//	public static void main(String[] args) {
//		MailService ms = new MailService(MailService.PROTOCOL_POP, true, true);
//		ms.isDebug(true);
//		ms.setSmtphost("smtp.gmail.com");
////		ms.connect("pop3.live.com", "idk5@hotmail.com", "15160273");
//		ms.connect("pop.gmail.com", "firefoxmmx@gmail.com", "missdark");
//		String stemp = "<p>this is test for mailservice please click the link to test, @0";
//		ms.send("hi 这是一个测试", "hq_cl@163.com", null,
//				ms.parseMsgCont(stemp, new Object[] {"<a href='http://www.163.com'>点我</a>"}),
//				true);
////		Message[] mss =  ms.recv();
//		
//		ms.close();
////		System.out.println(Arrays.toString(mss));
//		System.out.println(ms.parseMsgCont(stemp, new Object[] {"<a href='http://www.163.com'>点我</a>"}));
//		System.err.println(ms.getError());
//	}
	
	/**
	 * @description 根据邮箱地址映射出邮箱的WEB地址
	 * @param mailbox
	 * @return
	 */
	public static String getMailWebAddress(String mailbox)
	{
		String retAddr = null;
		if(mailbox!=null && mailbox.trim().length()>0 && "@".indexOf(mailbox)>0)
		{
			if("@sohu.com".indexOf(mailbox)>0)
			{
				retAddr = "http://mail.sohu.com";
			}
			else if("@sina.com".indexOf(mailbox)>0 || "@sina.cn".indexOf(mailbox)>0 
					|| "@vip.sina.com".indexOf(mailbox)>0 || "@my3ia.sina.cn".indexOf(mailbox)>0)
			{
				retAddr = "http://mail.sina.com.cn/";
			}
			else if("@gmail.com".indexOf(mailbox)>0 )
			{
				retAddr = "http://mail.sina.com.cn/";
			}
			else if("@126.com".indexOf(mailbox)>0 )
			{
				retAddr = "http://mail.126.com";
			}
			else if("@163.com".indexOf(mailbox)>0 )
			{
				retAddr = "http://mail.163.com";
			}
			else if("@qq.com".indexOf(mailbox)>0 )
			{
				retAddr = "http://mail.qq.com";
			}
			//后面补充
			
		}
		
		return retAddr;
	}
}
