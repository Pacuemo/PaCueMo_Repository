package _45_websocket_test;

import java.sql.Timestamp;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.annotation.SendToUser;
import org.springframework.stereotype.Controller;

@Controller
public class MarcoController
{
	private static final Logger logger = LoggerFactory.getLogger(MarcoController.class);

//	@MessageMapping("/marco")
//	@SendTo("/topic/shout")
//	public Shout handleShout(Shout incoming)
//	{
//		logger.info("Received message: " + incoming.getMessage());
//		Shout outgoing = new Shout();
//		outgoing.setMessage("Polo!");
//		return outgoing;
//
//	}

//	@SubscribeMapping({ "/marco" })
//	public Shout handleSubscription()
//	{
//		Shout outgoing = new Shout();
//		outgoing.setMessage("Polo!");
//		return outgoing;
//	}

	@MessageMapping("/marco")
	@SendToUser("/queue/test")
	public Shout handleShout(String name, String message)
	{
		Shout outgoing = new Shout();
		outgoing.setName(name);
		outgoing.setMessage("Polo!");
		outgoing.setTimestamp(new Timestamp(System.currentTimeMillis()));
		return outgoing;

	}
}
