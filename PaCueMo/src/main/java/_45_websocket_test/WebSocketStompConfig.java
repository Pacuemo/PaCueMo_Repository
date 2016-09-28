package _45_websocket_test;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.AbstractWebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketStompConfig extends AbstractWebSocketMessageBrokerConfigurer
{

	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry)
	{
		registry.addEndpoint("/ws").withSockJS();
	}

	@Override
	public void configureMessageBroker(MessageBrokerRegistry registry)
	{
		registry.enableSimpleBroker("/user", "/queue", "/topic");
		registry.setApplicationDestinationPrefixes("/app");
	}

//	@Override
//	public void configureWebSocketTransport(WebSocketTransportRegistration registration)
//	{
//		registration.setMessageSizeLimit(2048 * 1024);
//		registration.setSendBufferSizeLimit(1024 * 1024);
//		registration.setSendTimeLimit(20000);
//	}

}
