package com.fc.service.reservationCalendar;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

import java.util.HashMap;

@Service
public class MessageService {

	 public JSONObject sendSMS(String phoneNumber) {
	        String api_key = "NCSGB6MDJZVCG7JH";
	        String api_secret = "4RWBDUEBPJU1CGJ1DEUXRHVV6LJAJ13E";
	        Message coolsms = new Message(api_key, api_secret);

	        HashMap<String, String> params = new HashMap<String, String>();
	        params.put("to", phoneNumber);
	        params.put("from", "01028683754");  // put your own number here
	        params.put("type", "sms");
	        params.put("text", "예약 등록이 정상적으로 되었습니다.");

	        try {
				return coolsms.send(params);  // sends the message and returns the result
			} catch (CoolsmsException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
	            // return an error message in a JSONObject
	            JSONObject error = new JSONObject();
	            error.put("error", "An error occurred while sending the SMS: " + e.getMessage());
	            return error;
			}
	    }
}