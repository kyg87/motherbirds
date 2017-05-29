import java.util.ArrayList;
import java.util.List;

import com.google.gson.annotations.Expose;

public class ChatMessage {
	@Expose
	private String type;
	@Expose
	private ArrayList<ChatData> userlist;
	
	public ChatMessage(String type,ArrayList<ChatData> userlist) {
		// TODO Auto-generated constructor stub
		
		this.type = type ;
		this.userlist = userlist;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public List<ChatData> getUserlist() {
		return userlist;
	}

	public void setUserlist(ArrayList<ChatData> userlist) {
		this.userlist = userlist;
	}
	
	
}
