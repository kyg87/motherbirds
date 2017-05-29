

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

//���� : IP(�ǹ���ȣ) + Port(�缭�Թ�ȣ) / + Web(������)
//�� IP + 80����Ʈ + Web�ּ�(�� �ڼ���)
@ServerEndpoint("/chat/chatserver") //�ܺο��� ���� ��û���ְ� �ϱ� ���� ����ó���� ���ܽ�Ŵ
public class ChatServerEndPoint {
   //�÷����� ���� 3���� �ĺ��ڿ� ����..(��, index, �ٸ� ����)
   private static Set<Session> clients;
   private static HashMap<String,ArrayList<ChatData>> map;
   
   // CUD / R �� ���� -> �а������� �����ϸ� �ȵ�. -> ����ȭ�� �ʿ�(1.���̺귯����� 2.��������ȭ)
   // ������ȯ���Ͽ� ��� �����尡 Set�� ������. -> static���� ���� ����
   static{
      //�������� �ε����϶� ������ ������ �����带 �����ִ� ����ȭ������ �ؽ����� ������
      clients = Collections.synchronizedSet(new HashSet<>());
      map = new HashMap<String, ArrayList<ChatData>>();

      
   }
   
   //�Լ��̸��� �� ����� OnOpen�̶�� ������̼����� ���� ������ ���ִ°�����
   @OnOpen
   public void OnOpen(Session session, EndpointConfig config) throws IOException{
      clients.add(session);
      
      System.out.println(session.getId());
      //���ӵǾ����� �ֿܼ� ����
      //System.out.println(session.getBasicRemote());
      System.out.println(session.toString() + ": connected");
   }
   
   //�޽����� �Դٸ��? -> ������ �����������.
   //TCP -> ������ ���� �����Ǿ�����  // UDP -> ���� �������� �����Ե�. 
   @OnMessage
   public void onTextMessage(Session session, String data) throws IOException{
      
      ChatData  chatData = new Gson().fromJson(data, ChatData.class);
      
      if(chatData.getType().equals("enter")){
    	  
    	  chatData.setSession(session);
    	  
    	  if(seekRoom(chatData.getRoom())){
    		  addUserRomm(chatData.getRoom(), chatData);
    	  }
    	  else{
    		  addRomm(chatData.getRoom(),chatData);
    	  }
    	  
		  ArrayList<ChatData> list = map.get(chatData.getRoom());
		  Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		   
		  String gg = gson.toJson(new ChatMessage("userlist", list));
		  System.out.println(gg);
		  
    	  for (ChatData chatData1 : list) 
    		  chatData1.getSession().getBasicRemote().sendText(gg);
      }
      //type message�̸�
      else {
    	  ArrayList<ChatData> list = map.get(chatData.getRoom());
    	  
    	  for (ChatData chatData1 : list) {
    		  chatData1.getSession().getBasicRemote().sendText(data);
		}
      }
      
   }
   
   @OnClose
   public void OnClose(Session session){
      clients.remove(session);
      System.out.println(session.toString() + ": disconneted");
   }
   
   
   boolean seekRoom(String room){
	   
	   if(map.containsKey(room)){
		   
		   return true;
	   }
	   
	   return false;
   }
   
   void addRomm(String room,ChatData chatData){
	   ArrayList<ChatData> list = new ArrayList<>();
	   list.add(chatData);
	   map.put(room, list);
	   
	   System.out.println("������ �� :" + room);
	   System.out.println("������ : " + list.size());
	   
/*	   Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
	   
	   String gg = gson.toJson(list);
	   System.out.println(gg);*/
   }
   
   void addUserRomm(String room,ChatData chatData){
	   ArrayList<ChatData> list = map.get(room);
	   
	   list.add(chatData);
	   System.out.println("������ �� :" + room);
	   System.out.println("������ : " + list.size());
	   
	 /*  Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
	   
	   String gg = gson.toJson(list);
	   System.out.println(gg);*/
   }
      
}