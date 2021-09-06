package in.ac.nimhans.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.AlgorithmParameterSpec;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.util.Base64;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.PBEParameterSpec;
import in.ac.nimhans.model.User;

public class JSONEncryptor {
	String secretKey = "LongString@#$!%^&*(*)1234567890";
	
	Cipher ecipher;
	Cipher dcipher;
	byte[] salt = {
	        (byte) 0xA9, (byte) 0x9B, (byte) 0xC8, (byte) 0x32,
	        (byte) 0x56, (byte) 0x35, (byte) 0xE3, (byte) 0x03
	    };
	    
	int iterationCount = 19; // Iteration count
	
	public User encryptUser(User obj) throws Exception{
		
		User user = new User();
		
		String id = encrypt(Integer.toString(obj.getId()));
		String name = encrypt(obj.getName());
		String fname = encrypt(obj.getFname());
		String gender = encrypt(obj.getGender());
		String age = encrypt(obj.getAge());
		String password = encrypt(obj.getPassword());
		String maritalStatus = encrypt(obj.getMaritalStatus());
		String livingArrangement = encrypt(obj.getLivingArrangement());
		String education = encrypt(obj.getEducation());
		String mobileNumber = encrypt(obj.getMobileNumber());
		String significantOther = encrypt(obj.getSignificantOther());
		String mailId = encrypt(obj.getMailId());
		String lastPhoneCall = encrypt(obj.getLastPhoneCall());
		String nextCallDue = encrypt(obj.getNextCallDue());
		
		user.setId(Integer.parseInt(id));
		user.setName(name);
		user.setFname(fname);
		user.setGender(gender);
		user.setAge(age);
		user.setPassword(password);
		user.setEducation(education);
		user.setMobileNumber(mobileNumber);
		user.setLastPhoneCall(lastPhoneCall);
		user.setLivingArrangement(livingArrangement);
		user.setMaritalStatus(maritalStatus);
		user.setMailId(mailId);
		user.setNextCallDue(nextCallDue);
		user.setSignificantOther(significantOther);

		return user;
		
	}
	public static User decryptUser(User obj) throws Exception{

		
		return obj;
		
	}
	
	 public String encrypt(String plainText) throws NoSuchAlgorithmException, InvalidKeySpecException, NoSuchPaddingException, InvalidKeyException,
	            InvalidAlgorithmParameterException, 
	            UnsupportedEncodingException, 
	            IllegalBlockSizeException, 
	            BadPaddingException{
	        //Key generation for enc and desc
	        KeySpec keySpec = new PBEKeySpec(secretKey.toCharArray(), salt, iterationCount);
	        SecretKey key = SecretKeyFactory.getInstance("PBEWithMD5AndDES").generateSecret(keySpec);        
	         // Prepare the parameter to the ciphers
	        AlgorithmParameterSpec paramSpec = new PBEParameterSpec(salt, iterationCount);
	 
	        //Encryption process
	        ecipher = Cipher.getInstance(key.getAlgorithm());
	        ecipher.init(Cipher.ENCRYPT_MODE, key, paramSpec);      
	        String charSet="UTF-8";       
	        byte[] in = plainText.getBytes(charSet);
	        byte[] out = ecipher.doFinal(in);
	        String encStr=Base64.getEncoder().encodeToString(out);
	        return encStr;
	    }
	
	
   
   public String decrypt(String encryptedText)
    throws NoSuchAlgorithmException, 
           InvalidKeySpecException, 
           NoSuchPaddingException, 
           InvalidKeyException,
           InvalidAlgorithmParameterException, 
           UnsupportedEncodingException, 
           IllegalBlockSizeException, 
           BadPaddingException, 
           IOException{
        //Key generation for enc and desc
       KeySpec keySpec = new PBEKeySpec(secretKey.toCharArray(), salt, iterationCount);
       SecretKey key = SecretKeyFactory.getInstance("PBEWithMD5AndDES").generateSecret(keySpec);        
        // Prepare the parameter to the ciphers
       AlgorithmParameterSpec paramSpec = new PBEParameterSpec(salt, iterationCount);
       //Decryption process; same key will be used for decr
       dcipher=Cipher.getInstance(key.getAlgorithm());
       dcipher.init(Cipher.DECRYPT_MODE, key,paramSpec);
       byte[] enc = Base64.getDecoder().decode(encryptedText);
       byte[] utf8 = dcipher.doFinal(enc);
       String charSet="UTF-8";     
       String plainStr = new String(utf8, charSet);
       return plainStr;
   } 
    

}
