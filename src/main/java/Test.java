import java.net.URI;

import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.nc.api.validator.ResponseBean;


public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		RestTemplate restTemplate = new RestTemplate();
		URI uri = UriComponentsBuilder.fromHttpUrl("http://localhost:8081/api/member/getEnprInfoList.json")
				.queryParam("key", "value")
				.build().toUri();
		ResponseBean r = restTemplate.getForObject(uri, ResponseBean.class);
		
		System.out.println(r.toString());
	}

}
