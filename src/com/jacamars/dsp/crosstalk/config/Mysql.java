package com.jacamars.dsp.crosstalk.config;

import com.jacamars.dsp.rtb.common.Configuration;

/**
 * Mysql configuration object
 * @author Ben M. Faul
 *
 */
public class Mysql {
	
	/** Sql Login string */
	public String defaultString = "jdbc:mysql://68.183.53.10:3301/rtb4free?user=root&password=MkUS5BD5wzG9H3dE";
	public String login;
	
	/**
	 * Default constructor
	 */
	public Mysql() {
		
	}

	public String getLogin() {
		if (login.startsWith("$")) {
			String name = login.substring(1);
			login = Configuration.GetEnvironmentVariable(login,"$JDBC",defaultString);
			System.out.println("*** JDBC: " + name + " has been substituted with " + login);
		}
		return login;
	}
}
