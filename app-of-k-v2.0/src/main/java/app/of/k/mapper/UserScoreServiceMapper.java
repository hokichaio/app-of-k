package app.of.k.mapper;

import java.util.List;

import app.of.k.dto.UserScore;

public interface UserScoreServiceMapper {
	
	public UserScore getUser(String id);
	
	public List<UserScore> getAllUser();
	
	public Long sumHearts();
	
	public void insert(UserScore userScore);
	
	public void updateScore(UserScore userScore);
	
}
