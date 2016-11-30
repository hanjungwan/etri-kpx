package com.nc.api.validator;

import java.util.List;
import java.util.Map;

import org.springframework.ui.ModelMap;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class CliResponseBean {
	
	@JsonProperty("results")
	private ModelMap results;
	
	private Map<String, String> staus;
	
	private List<Map<String, String>> items;
	
	
	public ModelMap getResults() {
		return results;
	}
	public void setResults(ModelMap results) {
		this.results = results;
	}
	public Map<String, String> getStaus() {
		return (Map<String, String>) results.get("status");
	}
	public void setStaus(Map<String, String> staus) {
		this.staus = staus;
	}
	public List<Map<String, String>> getItems() {
		return (List<Map<String, String>>) results.get("items");
	}
	public void setItems(List<Map<String, String>> items) {
		this.items = items;
	}
}
