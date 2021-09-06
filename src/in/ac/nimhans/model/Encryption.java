package in.ac.nimhans.model;

public class Encryption {

	/*public static byte[] salt = new String("[B@6d06d69c").getBytes();*/
	/*private byte[] salt = new byte[16];*/
	
	/*public static String calculateHash1(String password) {
		try {
			Random random = new Random();
			byte[] salt = new byte[16];
			random.nextBytes(salt);
			KeySpec spec = new PBEKeySpec(password.toCharArray(), salt, 65536, 128);
			SecretKeyFactory f = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
			byte[] hash = f.generateSecret(spec).getEncoded();
			Base64.Encoder enc = Base64.getEncoder();
		
			//Printing the Hash and the Salt + Hash
			System.out.printf("salt: %s%n", enc.encodeToString(salt));
			System.out.printf("hash: %s%n", enc.encodeToString(hash));
			
			return enc.encodeToString(hash);
		}
		catch(Exception e) {
			e.printStackTrace();
			return "";
		}
	}
	*/
	/*public String calculateHash2(String h1) {
		try {
			KeySpec spec = new PBEKeySpec(h1.toCharArray(), getChallenge(), 65536, 128);
			SecretKeyFactory f = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
			byte[] newHash = f.generateSecret(spec).getEncoded();
			
			Base64.Encoder enc = Base64.getEncoder();
			return enc.encodeToString(newHash);
		}
		catch(Exception e) {
			e.printStackTrace();
			return "";
		}
	}*/

/*	public byte[] getChallenge() {
		Random random = new Random();
		byte[] salt = new byte[16];
		random.nextBytes(salt);
		return salt;
	}

	public void setChallenge(byte[] salt) {
		this.salt = salt;
	}*/
}
