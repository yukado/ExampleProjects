package com.spaceinvaders.game.entity;

import com.badlogic.gdx.math.Vector2;
import com.spaceinvaders.game.MainGame;
import com.spaceinvaders.game.TextureManager;

public class Missile extends Entity {

	public Missile(Vector2 pos) {
		super(TextureManager.MISSILE, pos, new Vector2(0, 5));
	}

	@Override
	public void update() {
		pos.add(direction);
	}
	
	public boolean checkEnd() {
		return pos.y >= MainGame.HEIGHT;
	}
	
}
