package com.javatpoint.bean;

public class Msg
{
	private int idMsg;
	private String name, email, subject, message;

	public Msg() {}
	
	public Msg(int idMsg,String name, String email, String subject, String message)
	{
		this.idMsg = idMsg;
	    this.name = name;
	    this.email = email;
	    this.subject = subject;
	    this.message = message;
	}
	
	public Msg(String name, String email, String subject, String message)
	{
	    this.name = name;
	    this.email = email;
	    this.subject = subject;
	    this.message = message;
	}
	
	//delete¨Ï¥Î
	public Msg(int idMsg)
    {
		this.idMsg = idMsg;
    }
	
	public int getIdMsg()
	{
		return idMsg;
	}

	public void setIdMsg(int idMsg)
	{
		this.idMsg = idMsg;
	}

	public String getMsgName()
	{
		return name;
	}

	public void setMsgName(String name)
	{			
		this.name = name;
	}

	public String getMsgEmail()
	{
		return email;
	}

	public void setMsgEmail(String email)
	{
		this.email = email;
	}

	public String getMsgSub()
	{
		return subject;
	}

	public void setMsgSub(String subject)
	{
		this.subject = subject;
	}

	public String getMessage()
	{
		return message;
	}

	public void setMessage(String message)
	{
		this.message = message;
	}
}
