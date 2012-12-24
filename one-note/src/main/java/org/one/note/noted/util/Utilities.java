package org.one.note.noted.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Writer;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.Cookie;

public class Utilities {

	public static String[] acceptedImageExtensions = { "jpg", "jpeg", "gif" };

	public static String toMD5Hash(String source) {
		try {
			MessageDigest algorithm = MessageDigest.getInstance("MD5");
			algorithm.reset();
			algorithm.update(source.getBytes());
			byte messageDigest[] = algorithm.digest();

			StringBuffer hexString = new StringBuffer();
			for (int i = 0; i < messageDigest.length; i++) {
				hexString.append(Integer.toHexString(0xFF & messageDigest[i]));
			}
			String hash = hexString.toString();
			return hash;
		} catch (NoSuchAlgorithmException nsae) {
			nsae.printStackTrace();
		}
		return null;
	}

	public static boolean deleteFile(String filePath)
			throws IllegalAccessException {
		// A File object to represent the filename
		File f = new File(filePath);

		// Make sure the file or directory exists and isn't write protected
		if (!f.exists()) {
			throw new IllegalArgumentException(
					"Delete: no such file or directory: " + filePath);
		}
		if (!f.canWrite()) {
			throw new IllegalArgumentException("Delete: write protected: "
					+ filePath);
		}
		// If it is a directory, make sure it is empty
		if (f.isDirectory()) {
			String[] files = f.list();
			if (files.length > 0) {
				throw new IllegalArgumentException(
						"Delete: directory not empty: " + filePath);
			}
		}

		// Attempt to delete it
		boolean success = f.delete();

		return success;
	}

	public static boolean isAcceptedImageFile(String filename) {
		String lowerCaseFilename = filename.toLowerCase();

		for (String extension : acceptedImageExtensions) {
			if (lowerCaseFilename.endsWith("." + extension)) {
				return true;
			}
		}
		return false;
	}

	/**
	 * Retrieves the value of the cookie with the corresponding name.
	 */
	public static String getCookieValueWithName(Cookie[] cookies, String name) {
		if (cookies != null) {
			for (int cookie_i = 0; cookie_i < cookies.length; cookie_i++) {
				if (cookies[cookie_i].getName().equals(name)) {
					return cookies[cookie_i].getValue();
				}
			}
		}
		return null;
	}

	
	public static boolean createFinalFile(String type, String folderPath, String filename, String text) {
		try {
			createDirsToPath(folderPath);
			File file = new File(folderPath + "/" + filename);
			System.out.println("Creating file " + folderPath + "/" + filename);	
			Writer output = new BufferedWriter(new FileWriter(file));
			output.write(text);
			output.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("WARNING: Failed to create: " + folderPath + "/" + filename + "!!!");
			return false;
		}
		return true;
	}
	
	public static boolean copyDirToDir(String srcFolderPath, String destFolderPath) {
		try {
			String[] folderParts = srcFolderPath.split("\\\\");
			String folderNameToCopy = folderParts[folderParts.length-1];
 			createDirsToPath(destFolderPath+"/"+folderNameToCopy);
 			
 			// Copy the directory into the new directory
 			File srcFolder = new File(srcFolderPath);
 			File destFolder = new File(destFolderPath+"/"+folderNameToCopy);
 			
			copyFileOrFolder(srcFolder, destFolder);
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("WARNING: Failed to copy: " + srcFolderPath + " into " + destFolderPath + "!!!");
			return false;
		}
		return true;
	}
	
	
	public static boolean copyFileToDir(String srcFilePath, String destFolderPath) {
		try {
			String[] folderParts = srcFilePath.split("\\\\");
			String fileNameToCopy = folderParts[folderParts.length-1];
 			createDirsToPath(destFolderPath);
 			
 			// Copy the directory into the new directory
 			File srcFolder = new File(srcFilePath);
 			File destFolder = new File(destFolderPath+"/"+fileNameToCopy);
 			
			copyFileOrFolder(srcFolder, destFolder);
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("WARNING: Failed to copy: " + srcFilePath + " into " + destFolderPath + "!!!");
			return false;
		}
		return true;
	}
	
	public static void copyFileOrFolder(File src, File dest) throws IOException{
    	if (src.isDirectory()) {
 
    		//if directory not exists, create it
    		if (!dest.exists()) {
    		   dest.mkdir();
    		   System.out.println("Directory copied from " + src + "  to " + dest);
    		}
 
    		//list all the directory contents
    		String files[] = src.list();
 
    		for (String file : files) {
    		   //construct the src and dest file structure
    		   File srcFile = new File(src, file);
    		   File destFile = new File(dest, file);
    		   //recursive copy
    		   copyFileOrFolder(srcFile,destFile);
    		}
 
    	} else {
    		//if file, then copy it
    		//Use bytes stream to support all file types
    		InputStream in = new FileInputStream(src);
    	    OutputStream out = new FileOutputStream(dest); 
 
    	    byte[] buffer = new byte[1024];
 
    	    int length;
    	    //copy the file content in bytes 
    	    while ((length = in.read(buffer)) > 0){
    	    	out.write(buffer, 0, length);
    	    }
 
    	    in.close();
    	    out.close();
    	    System.out.println("File copied from " + src + " to " + dest);
    	}
	}
	
	
	public static void createDirsToPath(String folderPath) {
		boolean success = (new File(folderPath)).mkdirs();
		if (success) {
			System.out.println("Directories: " + folderPath + " created.");
		}
	}
	
	public static String toCamelCase(String s, boolean startWithLowercase){
	   String[] parts = s.split("_");
	   String camelCaseString = "";
	   
	   if (startWithLowercase) {
		   parts[0] = parts[0].toLowerCase();
	   } else {
		   parts[0] = toProperCase(parts[0]);
	   }
	   
	   for (int i=1; i<parts.length; i++) {
	      camelCaseString = camelCaseString + toProperCase(parts[i]);
	   }
	   
	   return parts[0] + camelCaseString;
	}

	private static String toProperCase(String s) {
		return s.substring(0, 1).toUpperCase() + s.substring(1).toLowerCase();
	}
	
	
	public static void main(String[] args) {
		//Utilities.createFinalFile("domain", "domain", "UserProfile.java", "test");
		//Utilities.createFinalFile("view", "views/useraccounts", "list.jsp", "test");
		
		/*String str = "user_account";
		System.out.println(toCamelCase(str, true));
		System.out.println(toCamelCase(str, false));*/
		
		//File srcFolder = new File("C:\\Users\\PETROS\\Downloads\\berlincalling\\Wohnung-4.jpg");
		//File destFolder = new File("C:\\Users\\PETROS\\berlincalling");
		
		String src = "C:\\Users\\PETROS\\Downloads\\berlincalling\\Wohnung-4.jpg";
		String dest = "C:\\Users\\PETROS\\berlincalling";
		
		//try {
		//	OutputStream out = new FileOutputStream(destFolder);
		//} catch (FileNotFoundException e) {
		//	// TODO Auto-generated catch block
		//	e.printStackTrace();
		//}
			copyFileToDir(src, dest);
			//copyFileOrFolder(srcFolder, destFolder);
		
	}

	public static Object toPlural(String str) {
		return str + "s";
	}
	
}
