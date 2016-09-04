package _41_login_controller;

import com.warrenstrange.googleauth.GoogleAuthenticator;
import com.warrenstrange.googleauth.GoogleAuthenticatorKey;

public class Test
{

	public static void main(String[] args)
	{
		GoogleAuthenticator gAuth = new GoogleAuthenticator();

		final GoogleAuthenticatorKey key = gAuth.createCredentials();

//		System.out.println(key.getKey());

//		boolean isCodeValid = gAuth.authorize("HZSF3K7HC7JGTROW", (int) 360714F);
//		System.out.println(isCodeValid);

		System.out.println(Integer.valueOf("000005888").toString());
	}

}
