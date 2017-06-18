package com.stock.utils;



import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

public class Mail {
	String subject;
    String message;
    String customerEmail;
    String path;
    public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getCustomerEmail() {
		return customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}
     
	public static void sendEmail(String subject,String path,String customerEmail)  {
		// TODO Auto-generated method stub
		  HtmlEmail email = new HtmlEmail();
	      
	       //设置发送主机的服务器地址

	       email.setHostName("smtp.126.com");

	       //设置收件人邮箱

	       try {
			email.addTo(customerEmail,"bulktree");
		

	       //发件人邮箱

	       email.setFrom("huangyuan1115@126.com", "云课堂");

	       //如果要求身份验证，设置用户名、密码，分别为发件人在邮件服务器上注册的用户名和密码

	       email.setAuthentication("huangyuan1115@126.com", "Hyuan1115Jae");
	       email.setCharset("utf-8");
	       //设置邮件的主题

	       email.setSubject(subject);
	       //邮件正文消息

	       email.setHtmlMsg("<div>亲爱的："+customerEmail+",欢迎注册XP云课堂。请点击以下链接进行激活认证，若非本人操作，请勿点击。</div><p><a style='color:red' href='"+path+"/study/authcheck/?email="+customerEmail+"'>点击此处即可激活</a></p><p>XP云课堂为您提供海量优质课程，以及创新的在线学习体验，帮助您获得全新的个人发展和能力提升。<p>");

	       email.send();

	       System.out.println("发送给"+customerEmail+"的邮件已在路上");
	       } catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

}