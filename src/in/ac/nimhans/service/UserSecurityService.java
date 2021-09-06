package in.ac.nimhans.service;


import java.util.Base64;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import java.lang.*;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.util.Arrays;
import java.sql.*;
import java.util.*;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.concurrent.TimeUnit;


class UserSecurityService extends Thread {

    private static final String keyBase = "$s0$41010$Gxbn9LQ4I+fZ/kt0glnZgQ==$"; // some random string
	private static final String initVectorBase = "X+dRy9oLJz1JaNm1xscUl7EmUFHIILT1ktYB5DQ3fZs="; // some other random string 
	
	// do not change once system is released
	//private static String key = keyBase.substring(4, 20);  
	//private static String initVector = initVectorBase.substring(4, 20); 
	private static String key = keyBase.substring(1, 17);  
	private static String initVector = initVectorBase.substring(1, 17); 
	
	//System.out.println("key");
	
	public static String encrypt(String value) {
		System.out.println("key_value  "+key);
		
		System.out.println("initVector  "+initVector);
	    try {
	        IvParameterSpec iv = new IvParameterSpec(initVector.getBytes("UTF-8"));
	
	        SecretKeySpec skeySpec = new SecretKeySpec(key.getBytes("UTF-8"), "AES");
	
	        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");

	        cipher.init(Cipher.ENCRYPT_MODE, skeySpec, iv);
	
	        byte[] encrypted = cipher.doFinal(value.getBytes());
	        //System.out.println(encrypted.toString());
	       // String str1 = encrypted.toString();
	
	        System.out.println("encrypted-- "+encrypted);
	        
	        return Base64.getEncoder().encodeToString(encrypted);
	       // return Base64.getEncoder().encode(str1);
	        
	      //  byte[] dataBytes = Base64.getEncoder().encode(value.getBytes());
	        
	        
	      //  dataBytes = Base64.getDecoder().decode(dataBytes);
	       
	     
	    } catch (Exception ex) {
	
	        ex.printStackTrace();
	    }
	    return null;
	}

	public static String decrypt(String encrypted) {
	
		    try {
		    	 System.out.println("decrypt-111- "+encrypted);
		    	 
		    	 System.out.println("key_value Decrypt "+key);
		 		
		 		System.out.println("initVector Decrypt  "+initVector);
		    	
		        IvParameterSpec iv = new IvParameterSpec(initVector.getBytes("UTF-8"));
	
		        SecretKeySpec skeySpec = new SecretKeySpec(key.getBytes("UTF-8"), "AES");
	
		        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");
	
		        cipher.init(Cipher.DECRYPT_MODE, skeySpec, iv);
	
		        byte[] original = cipher.doFinal(Base64.getDecoder().decode(encrypted));
	
		        return new String(original);
		
		    } catch (Exception ex) {
		
		        ex.printStackTrace();	
		    } finally {
		    	
		    	System.out.println("skip this");
		    }
		    return null;
		}
	
	//********************PASSWORD CODE**************************//
	// random string from which we use a substr as pepper to add to salt.
	
		private static String randomString = "87adfd14a7a89b201bf6d99105b417287db6581d8aee989076bb7f86154e8f32";

		// returns an SHA-256 hash of input password + salt
		// salt is created for each password and stored in db
		public static String pwdHash(String pwd, String salt)throws NoSuchAlgorithmException, InvalidKeySpecException{
			String generatedPassword = null;
	        try {
	            MessageDigest md = MessageDigest.getInstance("SHA-256");
	            String saltPepper = salt + randomString.substring(11, 23);
	            md.update(saltPepper.getBytes());
	            byte[] bytes = md.digest(pwd.getBytes());
	            StringBuilder sb = new StringBuilder();
	            for(int i=0; i< bytes.length ;i++)
	            {
	            	// do we need this?
	                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
	            }
	            generatedPassword = sb.toString();
	        }
	        catch (NoSuchAlgorithmException e)
	        {
	            e.printStackTrace();
	        }
	        return generatedPassword;
		}
		
		public static boolean pwdMatches(String pwd, String hashedPwd, String salt) {
			String newHash;
			try {
				newHash = pwdHash(pwd, salt);
				if(hashedPwd != null)
					return hashedPwd.equals(newHash);
			} catch (NoSuchAlgorithmException | InvalidKeySpecException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return false;
		}
		
		public static String getNewSalt() throws NoSuchAlgorithmException
	    {
	        SecureRandom sr = SecureRandom.getInstance("SHA1PRNG");
	        byte[] salt = new byte[16];
	        sr.nextBytes(salt);
	        System.out.println("salt---"+sr);
	        return Arrays.toString(salt);
	    }
		
		private void test() {
			
			try {
				// when setting new password
				String salt = getNewSalt();
				String pwd = "abcd8721";
				String hashedPwd = pwdHash(pwd, salt);
				// Store hashedPwd and salt in db for user
				
				// to check password at login:
				String savedHashedPwd = "....";
				String typedPwd = "....";
				String savedSalt = "....";
				boolean success = pwdMatches(typedPwd, savedHashedPwd, salt);
				
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvalidKeySpecException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
	
	
			
		
		
	}
	
	
	

