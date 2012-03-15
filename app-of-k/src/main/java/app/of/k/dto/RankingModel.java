package app.of.k.dto;

import org.springframework.social.facebook.api.Reference;

public class RankingModel {

	private Reference user;
	
	private int score;

	public Reference getUser() {
		return user;
	}

	public void setUser(Reference user) {
		this.user = user;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}
	
	
}
