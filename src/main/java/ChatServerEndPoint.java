

import java.io.IOException;
import java.util.Collections;
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
   
   // CUD / R �� ���� -> �а������� �����ϸ� �ȵ�. -> ����ȭ�� �ʿ�(1.���̺귯����� 2.��������ȭ)
   // ������ȯ���Ͽ� ��� �����尡 Set�� ������. -> static���� ���� ����
   static{
      //�������� �ε����϶� ������ ������ �����带 �����ִ� ����ȭ������ �ؽ����� ������
      clients = Collections.synchronizedSet(new HashSet<>());
   }
   
   //�Լ��̸��� �� ����� OnOpen�̶�� ������̼����� ���� ������ ���ִ°�����
   @OnOpen
   public void OnOpen(Session session, EndpointConfig config) throws IOException{
      clients.add(session);
      

      //���ӵǾ����� �ֿܼ� ����
      //System.out.println(session.getBasicRemote());
      System.out.println(session.toString() + ": connected");
   }
   
   //�޽����� �Դٸ��? -> ������ �����������.
   //TCP -> ������ ���� �����Ǿ�����  // UDP -> ���� �������� �����Ե�. 
   @OnMessage
   public void onTextMessage(Session session, String data) throws IOException{
      
      System.out.println(data);
      //�޽��� ����ģ������ echo (1:1 ä���Ҳ��� ���⼭ ������ �ǰڴ�.)
      //session.getBasicRemote().sendText(data);
      ChatData  chatData = new Gson().fromJson(data, ChatData.class);
      
      System.out.println(chatData);
      System.out.println(chatData.getMsg());
      /*new GsonBuilder()*/
      
      for(Session s : clients)
         s.getBasicRemote().sendText(data);
         
      //System.out.println();      
   }
   
   @OnClose
   public void OnClose(Session session){
      clients.remove(session);
      System.out.println(session.toString() + ": disconneted");
   }
   
      
}