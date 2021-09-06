package in.ac.nimhans.service;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

class JSONFile {
	public static JSONObject readJSON(String path) throws JSONFileException {
		JSONObject obj = null;
		FileReader fr = null;
		try {
			fr = new FileReader(path);
			obj = (JSONObject) new JSONParser().parse(fr);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (fr != null)
					fr.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(obj == null) {
			throw new JSONFileException("Cannot read JSON File " + path);
		}
		return obj;
	}

	public static JSONArray readJSONArray(String path) throws JSONFileException {
		JSONArray obj = null;
		FileReader fr = null;
		try {
			fr = new FileReader(path);
			obj = (JSONArray) new JSONParser().parse(fr);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
// 			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
		} finally {
			try {
				if (fr != null)
					fr.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(obj == null) {
			throw new JSONFileException("Cannot read JSON File " + path);
		}
		return obj;

	}

}
