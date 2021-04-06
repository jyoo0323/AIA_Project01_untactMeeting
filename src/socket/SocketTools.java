package socket;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint(value="/socketTools/{userID}")
public class SocketTools {
	public static Set<Session> sessionSet = Collections.synchronizedSet(new HashSet<Session>());
	//HashSet is generally better for us to handle than Set is, but hashSet
	//does not support synchronization, so we simply make a synchronized set that is HashSet.
	//It is kind of an up-casting.

	@OnOpen
	public void onOpen(Session session, @PathParam("userID") String userID) {
		sessionSet.add(session);
		
		synchronized (sessionSet) {
			for(Session ses: sessionSet) {
				if(!session.equals(ses)) {
					try {
						ses.getBasicRemote().sendText(userID + "님이 입장하셨습니다");
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		//When a Client enters to the server then we add the session into
		//our sessionSet
	}
	
	@OnClose
	public void onClose(Session session, @PathParam("userID") String userID) {
		sessionSet.remove(session);
		synchronized (sessionSet) {
			for(Session ses: sessionSet) {
				if(!session.equals(ses)) {
					try {
						ses.getBasicRemote().sendText(userID + "님이 퇴장하셨습니다.");
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}
	
	@OnMessage
	public void onMessage(String msg, Session session) throws IOException {
		
		//get all sessions alive from sessionSet, then send the msg
		//to all sessions other than sender.
		
		synchronized (sessionSet) {
			for(Session ses: sessionSet) {
				if(!session.equals(ses)) {
					ses.getBasicRemote().sendText(msg);
				}
			}
		}
	}
	
	@OnError
	public void onError(Throwable th) {
		th.printStackTrace();
	}
	
}
